Scene currentScene;
abstract class Scene {
  abstract void draw();
  void mousePressed() {}
  void mouseMoved() {}
}

class SceneStart extends Scene {
  Button startButton;

  SceneStart() {
    startButton = new Button(
      width/2 - 50, height/2 + 75, 100,
      "Start",
      () -> {
        println("게임 시작!");
        currentScene = new SceneGame(); // ✨ 다음 씬으로 전환
      }
    );
  }

  void draw() {
    background(255);
    textAlign(CENTER);
    textSize(50);
    text("Dice Dungeon", width/2, height/3);

    startButton.draw();
  }

  void mousePressed() {
    if (startButton.isClicked(mouseX, mouseY)) startButton.onClick.run();
  }

  void mouseMoved() {
    startButton.hovered = startButton.isClicked(mouseX, mouseY);
  }
}

class SceneGameOver extends Scene {
  Button restartButton;

  SceneGameOver() {
    restartButton = new Button(
      width/2 - 50, height/2 + 75, 100,
      "Restart",
      () -> {
        println("다시 시작!");
        currentScene = new SceneStart();
      }
    );
  }

  void draw() {
    background(0);
    fill(255);
    textAlign(CENTER);
    textSize(50);
    text("Game Over", width/2, height/3);

    restartButton.draw();
  }

  void mousePressed() {
    if (restartButton.isClicked(mouseX, mouseY)) restartButton.onClick.run();
  }

  void mouseMoved() {
    restartButton.hovered = restartButton.isClicked(mouseX, mouseY);
  }
}

class SceneGame extends Scene {
  int turn = 0;

  void draw() {
    background(240);
    textAlign(CENTER);
    textSize(32);
    text("게임 진행 중... 턴: " + turn, width/2, height/2);
  }

  void mousePressed() {
    turn++;
    if (turn >= 5) currentScene = new SceneGameOver(); // 예시로 전환
  }
}

