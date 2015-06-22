class ShrinkUpgrade {

  float x;
  float y;
  float v;

  ShrinkUpgrade(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(0);
    fill(255, 62, 150);
    triangle(x, y, x+10, y+25, x-10, y+25);
    textSize(12);
    stroke(0);
    fill(0);
    text("Ss", x-5, y+25);
  }

  void move() {
    y=y+v;
  }
}

