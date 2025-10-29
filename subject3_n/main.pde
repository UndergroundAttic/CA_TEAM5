PVector[] ballPositions;
PVector[] ballVelocities;
boolean[] isBomb;
int maxBalls = 5;
int ballCount = 0;
int maxBombs;
float paddleX;
float paddleWidth = 200;

float paddleMaxSpeed = 40.0; // 최대 이동 속도 (픽셀/프레임)
float paddleMinSpeed = 5.0;  // 최소 이동 속도 (픽셀/프레임)
float paddleExponentialConstant = 50.0; // 지수 함수 상수 (거리 기반 감속 조정)

int score;
int difficulty;
int currentState;
int lastAddedScore = 0; // 공 추가를 위한 마지막 스코어 추적
int lastBombScore = 0; // 폭탄 지정 위한 마지막 스코어 추적
int highScore = 0; // 최고 스코어

int[] toggle = {-1,1};

void removeBall(int index) {
    for (int j = index; j < ballCount - 1; j++) {
        ballPositions[j] = ballPositions[j + 1];
        ballVelocities[j] = ballVelocities[j + 1];
        isBomb[j] = isBomb[j + 1];
    }
    ballCount--;
}

void setup() {
    size(960,540);
    reset();
}

void reset(){
    currentState = 0;
    
    score = 0;
    lastAddedScore = 0;
    lastBombScore = 0;
    difficulty = 100;

    ballPositions = new PVector[maxBalls];
    ballVelocities = new PVector[maxBalls];
    isBomb = new boolean[maxBalls];
    ballCount = 0;
    maxBombs = (int)(maxBalls * 0.4); // 최대 40%
    
    // 처음 공 1개만 추가
    ballPositions[ballCount] = new PVector(width/2 + random(-100,100), 100);
    ballVelocities[ballCount] = new PVector(toggle[(int) random(0,1)] * random(0.5,1) * difficulty /100, difficulty * 5/100);
    isBomb[ballCount] = true; // 일반 공
    ballCount++;
    
    paddleX = width/2 - paddleWidth/2;
};

void draw() {
    background(220);

    // 게임 준비
    if (currentState == 0) {
        gameReady();
        return;
    }
    
    // 게임 진행 중
    if (currentState == 1) {
        // 공 그리기
        for (int i = 0; i < ballCount; i++) {
            if (!isBomb[i]) {
                fill(255, 0, 0); // 폭탄 공은 빨간색
            } else {
                fill(255); // 일반 공은 흰색
            }
            ellipse(ballPositions[i].x, ballPositions[i].y, 30, 30);
        }
        
        // 패들 그리기
        // 패들이 마우스 X를 거리 기반 속도로 따라가도록 업데이트
        float targetX = mouseX - paddleWidth / 2.0;
        float dx = targetX - paddleX;
        float dist = abs(dx);

        // 원하는 속도 = 지수 함수 기반 (거리가 작을수록 속도가 지수적으로 감소)
        float desiredSpeed = paddleMaxSpeed * (1 - exp(-dist / paddleExponentialConstant));

        // 목표에 가까우면 바로 맞춤, 아니면 desiredSpeed만큼 이동
        if (dist <= desiredSpeed) {
            paddleX = targetX;
        } else {
            paddleX += (dx > 0) ? desiredSpeed : -desiredSpeed;
        }
        paddleX = constrain(paddleX, 0, width - paddleWidth);

        fill(255);
        rect(paddleX, height - 30, paddleWidth, 20);

        // 공 이동 및 충돌 처리
        for (int i = ballCount - 1; i >= 0; i--) {
            PVector pos = ballPositions[i];
            PVector vel = ballVelocities[i];
            
            pos.add(vel);

            // 벽 충돌 처리
            if (pos.x < 10 || pos.x > width - 10) {
                vel.x *= -1;
            }
            if (pos.y < 10) {
                vel.y *= -1;
            }

            // 패들 충돌 처리
            if (pos.y > height - 40 && pos.x > paddleX && pos.x < paddleX + paddleWidth) {
                if (!isBomb[i]) {
                    // 폭탄 공이면 즉시 게임 오버
                    currentState = 2;
                    if (score > highScore) highScore = score;
                    gameOver();
                    return;
                }
                vel.y *= -1;
                pos.y = height - 40; // 패들 위에 공 위치 조정
                // 튕김 방향에 약간의 랜덤성 추가
                vel.x += toggle[(int)random(0,1)] * random(1, 2);

                score++;
                vel.y *= 1.01;
                
                // 공 개수가 2개 이하일 때는 폭탄 지정하지 않음
                if (ballCount > 1) {
                    // 스코어가 10점 증가할 때마다 폭탄 지정 (최대 40%)
                    int currentBombCount = 0;
                    for (int k = 0; k < ballCount; k++) {
                        if (!isBomb[k]) currentBombCount++;
                    }
                    if (score >= lastBombScore + 10 && currentBombCount < maxBombs) {
                        // 랜덤으로 일반 공을 폭탄으로 지정
                        int[] normalIndices = new int[ballCount - currentBombCount];
                        int idx = 0;
                        for (int k = 0; k < ballCount; k++) {
                            if (isBomb[k]) {
                                normalIndices[idx++] = k;
                            }
                        }
                        if (idx > 0) {
                            int randIdx = normalIndices[(int)random(idx)];
                            isBomb[randIdx] = false;
                            lastBombScore += 10;
                        }
                    }
                } else {
                    // 공 개수가 2개 이하일 때는 모든 공을 일반 공으로 설정
                    for (int k = 0; k < ballCount; k++) {
                        isBomb[k] = true;
                    }
                }
                
                // 스코어가 5점 증가할 때마다 공 추가 (최대 5개)
                if (score >= lastAddedScore + 5 && ballCount < maxBalls) {
                    ballPositions[ballCount] = new PVector(width/2, height/2);
                    ballVelocities[ballCount] = new PVector(toggle[(int) random(0,1)] * random(0.5,1) * difficulty /100, difficulty * 6/100);
                    isBomb[ballCount] = true; // 일반 공
                    ballCount++;
                    lastAddedScore += 5;
                }
            }

            // 바닥 충돌 처리
if (pos.y > height) {
    if (!isBomb[i]) {
        // 폭탄 공은 바닥에 닿아도 튕겨오름
        vel.y *= -1;
        pos.y = height - 10;
    } else {
        // 일반 공은 제거
        removeBall(i);
        // 공 제거 후 공 개수가 2개 이하가 되면 모든 공을 일반 공으로 설정
        if (ballCount <= 2) {
            for (int k = 0; k < ballCount; k++) {
                isBomb[k] = true;
            }
        }
    }
}
        }

        // 모든 공이 없어지면 게임 오버
        if (ballCount == 0) {
            currentState = 2;
            if (score > highScore) highScore = score;
            gameOver();
        }

        gameRunning();
        return;
    }

    if (currentState == 2) {
        gameOver();
        return;
    }
}

void gameReady() {
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("PONG but BETTER!", width/2, height/2);
    textSize(20);
    text("Click to Start", width/2, height/2 + 50);
}

void gameRunning() {
    // 스코어를 창 우상단에 표시
    fill(0); // 검은색 텍스트
    textAlign(RIGHT, TOP); // 우상단 정렬
    textSize(20);
    text("Score: " + score, width - 10, 10);
}

void gameOver() {
    fill(0);
    textAlign(CENTER, CENTER);
    textSize(50);
    text("Game Over", width/2, height/2);
    textSize(30);
    text("Score: " + score, width/2, height/2 + 60);
    text("High Score: " + highScore, width/2, height/2 + 100);
}

void mousePressed() {
    if (currentState == 0) {
        currentState = 1;
    } else if (currentState == 2) {
        // Reset game state
        reset();
    }
}