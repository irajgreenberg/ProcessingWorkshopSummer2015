class Alien {
  int x;
  int y;
  int sx=3;
  int sy=6;
  Alien (int startx, int starty) {
    x=startx;
    y=starty;
  }
  void draw() {
    fill(0, 255, 0);
    stroke(100, 200, 120);
    rect(x, y, 30, 30);
  }
  void move() {
    x=x+sx;
  }
}


