class Bomb {
  int x;
  int y;
  int sy=5;
  Bomb (int startx, int starty) {
    x=startx;
    y=starty;
  }
  void draw() {
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect(x, y, 2, 2);
  }
  void move() {
    y=y+sy;
  }
}


