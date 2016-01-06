class Bullet {
  int x;
  int y;
  int speedy=5;

  Bullet (int startx, int starty) {
    x=startx;
    y=starty;
  }
  void draw() {
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rect(x, y-10, 3, 20);
  }
  void move() {
    y=y-speedy;
  }
}

