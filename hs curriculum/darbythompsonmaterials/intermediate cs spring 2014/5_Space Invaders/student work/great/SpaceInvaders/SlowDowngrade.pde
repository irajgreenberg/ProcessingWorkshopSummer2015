class SlowDowngrade {

  float x;
  float y;
  float v;

  SlowDowngrade(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(0);
    fill(255, 255, 0);
    rect(x, y, 25, 25);
    textSize(20);
    stroke(0);
    fill(0);
    text("S", x+7, y+20);
  }

  void move() {
    y=y+v;
  }
}

