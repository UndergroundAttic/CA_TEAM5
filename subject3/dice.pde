class Dice extends GameObject {
  int value;
  boolean active = true;

  Dice(float posX, float posY, int size) {
    super(posX, posY, size);
    roll();
  }

  int roll() {
    value = int(random(1, 7));
    return value;
  }

  @Override
  void draw() {
    translate(posX, posY);
    scale(size / 100.0);

    strokeWeight(size / 50);
    fill(255);

    square(0,0, size);
    drawEyes();

    scale(100.0 / size);
    translate(-posX, -posY);
  }

  void drawEyes() {
    strokeWeight(size / 5);
    fill(0);

    switch(value) {
      case 1:
        point(size / 2, size / 2);
        break;
      case 2:
        point(size * 1/4, size * 3/4);
        point(size * 3/4, size * 1/4);
        break;
      case 3:
        point(size / 2, size / 2);
        point(size * 1/4, size * 3/4);
        point(size * 3/4, size * 1/4);
        break;
      case 4:
        point(size * 1/4, size * 1/4);
        point(size * 1/4, size * 3/4);
        point(size * 3/4, size * 1/4);
        point(size * 3/4, size * 3/4);
        break;
      case 5:
        point(size / 2, size / 2);
        point(size * 1/4, size * 1/4);
        point(size * 1/4, size * 3/4);
        point(size * 3/4, size * 1/4);
        point(size * 3/4, size * 3/4);
        break;
      case 6:
        point(size * 2 / 7, size / 2);
        point(size * 2 / 7, size * 2 /9);
        point(size * 2 / 7, size * 7 / 9);
        point(size * 5 / 7, size / 2);
        point(size * 5 / 7, size * 2 / 9);
        point(size * 5 / 7, size * 7 / 9);
        break;
    }
  }
}
