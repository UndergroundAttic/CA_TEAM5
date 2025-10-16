enum EntityState {
  IDLE, PREP, ATCK
}

class Entity extends GameObject {
    private int curHealth;
    private int maxHealth;
    private EntityState state = EntityState.IDLE;
    protected Palette palette;

    Entity(float x, float y, int size, int maxHealth, Palette palette) {
        super(x, y, size);
        this.curHealth = maxHealth;
        this.maxHealth = maxHealth;
        this.palette = palette;
    }

    @Override
    void draw() {
        translate(posX, posY);
        scale(size / 100.0);
        
        main_draw();
        switch (state) {
            case IDLE:
                draw_idle_state();
                break;
            case PREP:
                draw_prep_state();
                break;
            case ATCK:
                draw_attack_state();
                break;
        }
        draw_health_bar();

        scale(100.0 / size);
        translate(-posX, -posY);
    }

    void main_draw() {}

    void draw_attack_state() {}

    void draw_prep_state() {}

    void draw_idle_state() {}

    protected void setState(EntityState newState) {
        this.state = newState;
    }

    public EntityState getState() {
        return state;
    }

    protected void takeDamage(int damage) {
        curHealth -= damage;
        if (curHealth < 0) {
            curHealth = 0;
        }
    }

    protected void heal(int amount) {
        curHealth += amount;
        if (curHealth > maxHealth) {
            curHealth = maxHealth;
        }
    }

    // TODO: Add numeric health display
    protected void draw_health_bar() {
        stroke(0);
        strokeWeight(1);
        float barWidth = 100;
        float barHeight = 10;
        float healthRatio = (float) curHealth / maxHealth;

        // Draw background bar
        fill(255, 0, 0);
        rect(-barWidth / 2, -80, barWidth, barHeight);

        // Draw current health
        fill(0, 255, 0);
        rect(-barWidth / 2, -80, barWidth * healthRatio, barHeight);
    }
}
