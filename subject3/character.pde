int currentState = 0;
int timer = 0;
color BODY_COLOR = color(80, 150, 200);
color HEAD_COLOR = color(255, 220, 180);
color BOW_COLOR = color(139, 69, 19);
color ARROW_HEAD_COLOR = color(0);

void setup() {
  size(300, 300);
}

void draw() {
  background(230);
  translate(100,100);
  drawCharacter(currentState);
  timer++;
  if (timer > 60) {
    currentState++;
    timer = 0;
    if (currentState > 2) {
      currentState = 0;
    }
  }
}

// state 0: 기본, 1: 장전, 2: 발사
void drawCharacter(int state) {
  // 1. 다리와 몸통
  fill(BODY_COLOR);
  stroke(0);
  strokeWeight(3);
  rect(-20, 60, 15, 50);
  rect(5, 60, 15, 50);
  rect(-25, 0, 50, 60);

  // 2. 머리
  fill(HEAD_COLOR);
  strokeWeight(3);
  circle(0, -20, 40);

  // 눈
  stroke(0);
  strokeWeight(2);
  line(10, -20, 18, -20);
  
  // 팔
  stroke(0);
  strokeWeight(5);
  if (state == 0) { // 기본
    line(-15, 15, -20, 50);
    line(15, 15, 20, 50);
  } else if (state == 1) { // 장전
    line(15, 15, 50, 15);
    line(-15, 15, -30, 30);
  } else if (state == 2) { // 발사
    line(15, 15, 50, 15);
    line(-15, 15, -25, 25);
  }
  
  // 활& 화살
  if (state > 0) {
    noFill();
    stroke(BOW_COLOR);
    strokeWeight(4);
    arc(50, 15, 20, 80, -HALF_PI, HALF_PI);
    if (state == 1) { // 장전
      stroke(0); strokeWeight(1);
      line(50, -25, -30, 30); line(50, 55, -30, 30);
      stroke(BOW_COLOR); strokeWeight(2);
      line(-30, 30, 90, 10);
      fill(ARROW_HEAD_COLOR); noStroke();
      triangle(90, 10, 85, 7, 85, 13);
    } else if (state == 2) { // 발사
      stroke(0); strokeWeight(1);
      line(50, -25, 60, -20); line(60, -20, 60, 50); line(60, 50, 50, 55);
      stroke(BOW_COLOR); strokeWeight(2);
      line(100, 8, 140, 4);
      fill(ARROW_HEAD_COLOR); noStroke();
      triangle(140, 4, 135, 1, 135, 7);
    }
  } else { // 기본
    noFill();
    stroke(BOW_COLOR);
    strokeWeight(4);
    line(25, 40, 35, 60);
  }
}
