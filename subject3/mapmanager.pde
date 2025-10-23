class MapManager {
    EntityState[] enemyPatterns;
    int totalDistanceMoved;
    
    Dice dice;
    Tile[] tiles;
    Player player;

    MapManager(int tileCount) {
        createNewMap(tileCount);
    }

    private void createNewMap(int tileNum) {
        tiles = new Tile[tileNum];
        int[] countArr = {0,0,0,0};

        for (int i = 0; i < tileNum; i++) {
            float rng = random(10);

            
            if (rng < 4) {
                tiles[i] = new AttackTile(0,0,100,i);
                countArr[0]++;
            } else if (rng < 6) {
                tiles[i] = new HealTile(0,0,100,i);
                countArr[1]++;
            } else if (rng < 8) {
                tiles[i] = new SpecialTile(0,0,100,i);
                countArr[2]++;
            } else {
                tiles[i] = new ShieldTile(0,0,100,i);
                countArr[3]++;
            };
        }

        if (countArr[1] == 0 || countArr[1] == 0) {
            // Retry map creation if no Heal or Attack tiles
            createNewMap(tileNum);
        }
    }

    void draw() {}

    void playLoop() {}

    void update_pattern(EntityState[] patterns) {
        this.enemyPatterns = patterns;
    }

    void playTurn() {
        int count = dice.roll();
        count = waitForPlayerInput(count);
        // this might block the UI thread...or does it?
        Tile tile = tiles[getPlayerPositionIndex()];
        tile.execute(count);
    }

    int waitForPlayerInput(int count) {
        this.totalDistanceMoved += count;
       return count; // Placeholder
    }

    void waitForEnemyActivity() {
        // Placeholder
    }

    int getPlayerPositionIndex() {
        return totalDistanceMoved % tiles.length;
    }

}
