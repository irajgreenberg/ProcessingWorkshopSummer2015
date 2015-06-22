class Bullet {
  int x;
  int y;
  int sy=10;
  Bullet (int startx, int starty) {
    x=startx;
    y=starty;
  }
  void draw() {
    fill (255, 0, 0);
    stroke(120, 230, 180);
    ellipse(x, y, 2, 2);
  }
  void move() {
    y=y-sy;
  }
}  

