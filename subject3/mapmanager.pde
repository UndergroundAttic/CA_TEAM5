class MapManager {
    EntityState[] enemyPatterns;
    int totalDistanceMoved;
    
    Dice dice;
    Tile[] tiles;
    Player player;

    MapManager(int tileCount) {
        createNewMap(tileCount);
    }

    void createNewMap(int tileNum) {
        tiles = new Tile[tileNum];
        for (int i = 0; i < tileNum; i++) {
            tiles[i] = new Tile(0,0,100,i);
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
