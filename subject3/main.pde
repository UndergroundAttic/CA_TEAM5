int currentState = 0;
int timer = 0;
Player player;
Dice dice;
Button btn;
GameObject[] gameObjects;
GameObject[] uiObjects;
boolean gameIsOver = false;

void setup() {
  size(960, 540);

  Palette playerPalette = new Palette(
    color(255, 220, 180),  // head
    color(80, 150, 200),   // body
    color(139, 69, 19),    // primary
    color(0)               // secondary
  );

  gameObjects = new GameObject[2];
  // uiObjects = new GameObject[0];

  dice = new Dice(300, 300, 100);
  player = new Player(200, 100 ,100, 100, playerPalette);
  gameObjects[0] = player;
  gameObjects[1] = dice;

  btn = new Button(
    width/2-50,
    height/2+75,
    100,
    "Restart",
    () -> {
      // Restart the game
      currentState = 0;
      timer = 0;
      player.reset();
      gameIsOver = false;
      loop();
    }
  );
}

// TODO: Implement Game Over Screen And connect it to Player Death event. 
void gameOver() {
  gameIsOver = true;
  background(100);
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(64);
  text("Game Over", width / 2, height / 2);
  btn.draw();
  noLoop();
}

void draw() {
  background(230);
  // gameOver();
  for (int i = 0; i < gameObjects.length; i++) {
    gameObjects[i].draw();
  }

  // for (int i = 0; i < uiObjects.length; i++) {
  //   uiObjects[i].draw();
  // }

  if (!gameIsOver) {
    timer++;
    if (timer > 60) {
      currentState++;
      timer = 0;
      dice.roll();
      if (currentState > 2) {
        currentState = 0;
      }
    }

    player.setState(EntityState.values()[currentState]);
    // player.takeDamage(1);
    if (player.isDead()) {
      gameOver();
    }
  }
}

void mousePressed() {
  // dice.roll();
  if (dice.isClicked(mouseX, mouseY)) {
    dice.roll();
  }

  if (player.isClicked(mouseX, mouseY)) {
    player.heal(10);
  }

  println("Mouse Pressed at: " + mouseX + ", " + mouseY);
  println(btn.isClicked(mouseX, mouseY));
  if (btn.isClicked(mouseX, mouseY)) {
    btn.onClick.run();
  }
}