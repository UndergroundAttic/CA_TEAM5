class Entity {
    private int curHealth;
    private int maxHealth;
    private State state = State.IDLE;
    protected Palette palette;

    Entity(int maxHealth, Palette palette) {
        this.curHealth = maxHealth;
        this.maxHealth = maxHealth;
        this.palette = palette;
    }

    void destroy() {
        // TODO: Implement entity Death logic
    }

    void draw() {
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
    }

    void draw_attack_state() {}

    void draw_prep_state() {}

    void draw_idle_state() {}

    protected void setState(State newState) {
        this.state = newState;
    }

    public State getState() {
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
