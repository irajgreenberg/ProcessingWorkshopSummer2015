class Bomb {
  int x;
  int y;
  int speedy=5;

  Bomb (int startx, int starty) {
    x=startx;
    y=starty;
  }
  void draw() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(x, y-10, 3, 20);
  }
  void move() {
    y=y+speedy;
  }
}
