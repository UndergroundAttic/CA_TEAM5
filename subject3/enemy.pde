class Enemy extends Entity {
    Enemy(float x, float y, int size, int maxHealth, Palette palette){
        super(x, y, size, maxHealth, palette);
    }

    @Override
    void main_draw() {}

    @Override
    void draw_attack_state() {}
    @Override
    void draw_prep_state() {}
    @Override
    void draw_idle_state() {}
}