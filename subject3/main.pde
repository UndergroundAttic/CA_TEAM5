int currentState = 0;
int timer = 0;
Player player;

void setup() {
  size(300, 300);

  Palette playerPalette = new Palette(
    color(255, 220, 180),  // head
    color(80, 150, 200),   // body
    color(139, 69, 19),    // primary
    color(0)               // secondary
  );

  player = new Player(100, playerPalette);
}

// TODO: Implement Game Over Screen And connect it to Player Death event. 
void gameOver() {}

void draw() {
  background(230);
  translate(100,100);
  timer++;
  if (timer > 60) {
    currentState++;
    timer = 0;
    if (currentState > 2) {
      currentState = 0;
    }
  }
  player.setState(EntityState.values()[currentState]);
  player.draw();
  player.takeDamage(1);
}
