int count = 6;
float returned = 0;
int diceSize = 80;

Dice[] dices;  // 주사위 객체 배열

void setup() {
  size(800, 600);
  dices = new Dice[count];

  for (int i = 0; i < count; i++) {
    float x = diceSize * i;
    float y = height - diceSize;
    dices[i] = new Dice(x, y, diceSize);
  }
}

void draw() {
  background(255);
  for (int i = 0; i < count; i++) {
    dices[i].display();
  }
}

// 마우스로 클릭 시, 해당 주사위 값 리턴 + 비활성화
void mousePressed() {
  for (int i = 0; i < count; i++) {
    if (dices[i].isClicked(mouseX, mouseY)) {
      returned = dices[i].value;
      dices[i].deactivate(); // 0으로 바꾸는 부분
      println("Returned value: " + returned);
    }
  }
}

// 🎲 주사위 클래스
class Dice {
  float x, y;
  int size;
  int value;
  boolean active = true;

  Dice(float x_, float y_, int size_) {
    x = x_;
    y = y_;
    size = size_;
    roll(); // 생성 시 굴려서 초기화
  }

  void roll() {
    value = int(random(1, 7));
  }

  void deactivate() {
    value = 0;
    active = false;
  }

  boolean isClicked(float mx, float my) {
    return (mx > x && mx < x + size && my > y && my < y + size);
  }

  void display() {
    strokeWeight(size / 50);
    if (!active) fill(0);
    else fill(255);
    square(x, y, size);

    if (value == 0) return;  // 비활성 상태면 눈 표시 안 함

    fill(0);
    strokeWeight(size / 5);

    float cx = x + size / 2;
    float cy = y + size / 2;
    float q = size / 4;

    switch(value) {
      case 1:
        point(cx, cy);
        break;
      case 2:
        point(cx - q, cy - q);
        point(cx + q, cy + q);
        break;
      case 3:
        point(cx, cy);
        point(cx - q, cy - q);
        point(cx + q, cy + q);
        break;
      case 4:
        point(cx - q, cy - q);
        point(cx - q, cy + q);
        point(cx + q, cy - q);
        point(cx + q, cy + q);
        break;
      case 5:
        point(cx, cy);
        point(cx - q, cy - q);
        point(cx - q, cy + q);
        point(cx + q, cy - q);
        point(cx + q, cy + q);
        break;
      case 6:
        float offX1 = size * 2 / 7;
        float offX2 = size * 5 / 7;
        float offY1 = size / 6;
        float offY2 = size / 2;
        float offY3 = size * 5 / 6;
        point(x + offX1, y + offY1);
        point(x + offX2, y + offY1);
        point(x + offX1, y + offY2);
        point(x + offX2, y + offY2);
        point(x + offX1, y + offY3);
        point(x + offX2, y + offY3);
        break;
    }
  }
}
