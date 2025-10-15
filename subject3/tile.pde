class Tile {
    int index;
    int baseValue = 1;
    int modifier = 0;

    Tile(int Index) {
        this.index = Index;
    }

    void draw() {
        fill(color(200, 255, 200));
        rect(-50, -50, 100, 100);
    }

    void execute() {
        // Default behavior: No effect
    }
}

class AttackTile extends Tile {
    AttackTile(int index) {
        super(index);
    }

    @Override
    void draw() {
        fill(color(255, 200, 200));
        rect(-50, -50, 100, 100);
        fill(0);
        textAlign(CENTER, CENTER);
        text("Attack", 0, 0);
    }
    @Override
    void execute() {
        // Implement attack logic here
    }
}

class SpecialTile extends Tile {
    SpecialTile(int index) {
        super(index);
    }

    @Override
    void draw() {
        fill(color(255, 255, 200));
        rect(-50, -50, 100, 100);
        fill(0);
        textAlign(CENTER, CENTER);
        text("Special", 0, 0);
    }
    @Override
    void execute() {
        // Implement special attack logic here
    }
}

class HealTile extends Tile {
    HealTile(int index) {
        super(index);
    }

    @Override
    void draw() {
        fill(color(200, 200, 255));
        rect(-50, -50, 100, 100);
        fill(0);
        textAlign(CENTER, CENTER);
        text("Heal", 0, 0);
    }
    @Override
    void execute() {
        // Implement heal logic here
    }
}

class ShieldTile extends Tile {
    ShieldTile(int index) {
        super(index);
    }

    @Override
    void draw() {
        fill(color(200, 255, 255));
        rect(-50, -50, 100, 100);
        fill(0);
        textAlign(CENTER, CENTER);
        text("Shield", 0, 0);
    }
    @Override
    void execute() {
        // Implement shield logic here
    }
}