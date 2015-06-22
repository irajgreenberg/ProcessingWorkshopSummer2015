class Alien {
  int x;
  int y;
  int speedx=3;
  int speedy=60;

  Alien (int startx, int starty) {
    x= startx;
    y= starty;
  }
  void draw() {
    stroke(0,255,0);
    fill(0,255,0);
    rect(x, y, 30, 30);
  }
  void move() {
    x=x+speedx;
  }
}
