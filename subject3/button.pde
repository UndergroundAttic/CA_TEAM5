class Button extends GameObject {
    String label;
    boolean hovered = false;
    boolean clicked = false;
    Runnable onClick;

    Button(float posX, float posY, int size, String label, Runnable onClick) {
        super(posX, posY, size);
        this.label = label;
        this.onClick = onClick;
    }

    @Override
    void draw() {
        translate(posX, posY);
        scale(size / 100.0);
        
        stroke(0);
        strokeWeight(2);
        textSize(20);
        if (hovered) fill(200);
        else fill(255);
        rect(0, 0, size, size);

        fill(0);
        textAlign(CENTER, CENTER);
        text(label, size/2, size/2);

        translate(-posX, -posY);
        scale(100.0 / size);
    }
}