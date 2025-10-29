PVector ballPos;
PVector ballVel;
float paddleX;
float paddleWidth;

float paddleMaxSpeed = 40.0; // 최대 이동 속도 (픽셀/프레임)
float paddleMinSpeed = 5.0;  // 최소 이동 속도 (픽셀/프레임)
float paddleExponentialConstant = 50.0; // 지수 함수 상수 (거리 기반 감속 조정)

int score;
int difficulty;
int currentState;

int[] toggle = {-1,1};

void setup() {
    size(960,540);
    reset();
}

void reset(){
    currentState = 0;
    
    score = 0;
    difficulty = 100;

    ballPos = new PVector(width/2, height/2);
    ballVel = new PVector(toggle[(int) random(0,1)] *random(0.5,1) * difficulty /100, difficulty * 6/100);
    paddleWidth = 150;
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
        fill(255);
        ellipse(ballPos.x, ballPos.y, 30, 30);

        float targetX = mouseX - paddleWidth / 2.0;
        float dx = targetX - paddleX;
        if (abs(dx) <= paddleSpeed) {
            paddleX = targetX;
        } else {
            paddleX += (dx > 0) ? paddleSpeed : -paddleSpeed;
        }
        paddleX = constrain(paddleX, 0, width - paddleWidth);

        rect(paddleX, height - 30, paddleWidth, 20);

        // 공 이동
        ballPos.add(ballVel);

        // 벽 충돌 처리
        if (ballPos.x < 10 || ballPos.x > width - 10) {
            ballVel.x *= -1;
        }
        if (ballPos.y < 10) {
            ballVel.y *= -1;
        }

        // 패들 충돌 처리
        if (ballPos.y > height - 40 && ballPos.x > paddleX && ballPos.x < paddleX + paddleWidth) {
            ballVel.y *= -1;
            ballPos.y = height - 40; // 패들 위에 공 위치 조정
            ballVel.x += toggle[(int)random(0,1)] * random(1, 2);

            score++;
            difficulty *= 1.05;
        }

        // 바닥 충돌 처리 (게임 오버)
        if (ballPos.y > height) {
            currentState = 2;
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
}

void mousePressed() {
    if (currentState == 0) {
        currentState = 1;
    } else if (currentState == 2) {
        // Reset game state
        reset();
    }
}