enum TileType {
    ATTACK, SPECIAL, HEAL, SHIELD
}

class Tile extends GameObject {
    int index;
    int baseValue = 1;
    int modifier = 0;

    TileType type;

    Tile(float posX, float posY, int size, int Index) {
        super(posX, posY, size);
        this.index = Index;
    }

    void draw() {
        translate(posX, posY);
        scale(size / 100.0);

        switch (type) {
            case ATTACK:
                fill(color(255, 200, 200));
                break;
            case SPECIAL:
                fill(color(255, 255, 200));
                break;
            case HEAL:
                fill(color(200, 200, 255));
                break;
            case SHIELD:
                fill(color(200, 255, 255));
                break;
        }
        rect(0, 0, size, size);

        fill(0);
        textAlign(CENTER, CENTER);
        text(type.toString(), 0, 0);


        scale(100.0 / size);
        translate(-posX, -posY);
    }

    void execute() {
        // Default behavior: No effect
    }
}

class AttackTile extends Tile {
    AttackTile(float posX, float posY, int size, int index) {
        super(posX, posY, size, index);
        this.type = TileType.ATTACK;
    }

    @Override
    void draw() {}

    @Override
    void execute() {
        // Implement attack logic here
    }
}

class SpecialTile extends Tile {
    SpecialTile(float posX, float posY, int size, int index) {
        super(posX, posY, size, index);
        this.type = TileType.SPECIAL;
    }

    @Override
    void draw() {}
    @Override
    void execute() {
        // Implement special attack logic here
    }
}

class HealTile extends Tile {
    HealTile(float posX, float posY, int size, int index) {
        super(posX, posY, size, index);
        this.type = TileType.HEAL;
    }

    @Override
    void draw() {
    }
    @Override
    void execute() {
        // Implement heal logic here
    }
}

class ShieldTile extends Tile {
    ShieldTile(float posX, float posY, int size, int index) {
        super(posX, posY, size, index);
        this.type = TileType.SHIELD;
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