class Bullet {

  float x;
  float y;
  float v;

  Bullet(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(255, 69, 0);
    fill(255, 69, 0);
    ellipse(x, y, 3, 3);
  }

  void move() {
    y=y-v;
  }
}

