class FastUpgrade {

  float x;
  float y;
  float v;

  FastUpgrade(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(0);
    fill(255, 0, 0);
    rect(x, y, 25, 25);
    textSize(20);
    stroke(255, 255, 0);
    fill(255, 255, 0);
    text("F", x+7, y+20);
  }

  void move() {
    y=y+v;
  }
}

