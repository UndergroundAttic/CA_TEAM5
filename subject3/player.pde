class Player extends Entity {
    Player(int maxHealth, Palette palette){
        super(maxHealth, palette);
    }

    void move() {
        //TODO: Implement player movement logic here
    }

    void draw() {
        draw_body();
        super.draw();
        draw_health_bar();
    }

    void draw_body() {
        fill(palette.body);
        stroke(0);
        strokeWeight(3);
        rect(-20, 60, 15, 50);
        rect(5, 60, 15, 50);
        rect(-25, 0, 50, 60);

        // 2. 머리
        fill(palette.head);
        strokeWeight(3);
        circle(0, -20, 40);

        // 눈
        stroke(0);
        strokeWeight(2);
        line(10, -20, 18, -20);
    }

    @Override
    void draw_attack_state() {
      stroke(0);
      strokeWeight(5);

      line(15, 15, 50, 15);
      line(-15, 15, -25, 25);

      noFill();
      stroke(palette.primary);
      strokeWeight(4);
      arc(50, 15, 20, 80, -HALF_PI, HALF_PI);

      stroke(0); strokeWeight(1);
      line(50, -25, 60, -20); line(60, -20, 60, 50); line(60, 50, 50, 55);
        // Draw player in attack state
    }

    @Override
    void draw_prep_state() {
      stroke(0);
      strokeWeight(5);

      line(15, 15, 50, 15);
      line(-15, 15, -30, 30);

      noFill();
      stroke(palette.primary);
      strokeWeight(4);
      arc(50, 15, 20, 80, -HALF_PI, HALF_PI);

      stroke(0); strokeWeight(1);
      line(50, -25, -30, 30); line(50, 55, -30, 30);
      stroke(palette.primary); strokeWeight(2);
      line(-30, 30, 90, 10);
      fill(palette.secondary); noStroke();
      triangle(90, 10, 85, 7, 85, 13);
        // Draw player in preparation state
    }

    @Override
    void draw_idle_state() {
      stroke(0);
      strokeWeight(5);

      line(-15, 15, -20, 50);
      line(15, 15, 20, 50);
      // Draw player in idle state

      noFill();
      stroke(palette.primary);
      strokeWeight(4);
      line(25, 40, 35, 60);
    }
}
