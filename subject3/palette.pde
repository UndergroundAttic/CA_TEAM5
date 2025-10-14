class Palette {
    private color head;
    private color body;
    private color primary;
    private color secondary;

    Palette(color head, color body, color primary, color secondary) {
        this.head = head;
        this.body = body;
        this.primary = primary;
        this.secondary = secondary;
    }

    color head() {
        return head;
    }

    color body() {
        return body;
    }

    color primary() {
        return primary;
    }

    color secondary() {
        return secondary;
    }
}