class Bomb {

  float x;
  float y;
  float v;

  Bomb(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(255, 69, 0);
    fill(255, 215, 0);
    ellipse(x, y, 5, 5);
  }

  void move() {
    y=y+v;
  }
}

