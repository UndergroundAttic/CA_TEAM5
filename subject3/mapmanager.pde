class MapManager {
    Tile[] tiles;

    MapManager() {
    }

    void createNewMap(int tileNum) {
        tiles = new Tile[tileNum];
        for (int i = 0; i < tileNum; i++) {
            tiles[i] = new Tile(i);
        }
    }

    void draw() {}

}
