class GrowthDowngrade {

  float x;
  float y;
  float v;

  GrowthDowngrade(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(0);
    fill(0, 255, 50);
    triangle(x, y+25, x+10, y, x-10, y);
    textSize(14);
    stroke(0);
    fill(0);
    text("G", x-5, y+15);
  }

  void move() {
    y=y+v;
  }
}

