class GameObject {
    float posX, posY;
    float size;
    GameObject(float x, float y, float s) {
        posX = x;
        posY = y;
        size = s;
    }

    void draw() {}

    boolean isClicked(float mouseX, float mouseY) {
        return mouseX >= posX && mouseX <= posX + size && mouseY >= posY && mouseY <= posY + size;
    }
}