PVector ballPos;
PVector ballVel;
float paddleX;
float paddleWidth;
float difficulty = 2.0;
float paddleSpeed = 10.0; // 최대 이동 속도 (픽셀/프레임)

int[] toggle = {-1,1};

void setup() {
    size(960,540);
    ballPos = new PVector(width/2, height/2);
    ballVel = new PVector(random(-1,1) * difficulty, random(-3,3)* difficulty);
    paddleWidth = 100;
    paddleX = width/2 - paddleWidth/2;
}

void draw() {
    background(255);
    // 공 그리기
    ellipse(ballPos.x, ballPos.y, 20, 20);
    // 패들 그리기
    // 패들이 마우스 X를 일정 속도로 따라가도록 업데이트
    float targetX = mouseX - paddleWidth / 2.0;
    float dx = targetX - paddleX;
    if (abs(dx) <= paddleSpeed) {
        paddleX = targetX;
    } else {
        paddleX += (dx > 0) ? paddleSpeed : -paddleSpeed;
    }
    paddleX = constrain(paddleX, 0, width - paddleWidth);

    rect(paddleX, height - 30, paddleWidth, 10);

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
    }

    // 바닥 충돌 처리 (게임 오버)
    if (ballPos.y > height) {
        fill(0);
        textAlign(CENTER, CENTER);
        textSize(50);
        text("Game Over", width/2, height/2);
        noLoop(); // 게임 종료 후 더 이상 그리지 않음
    }
}