class Ellipse implements DrawableObject {

  int x;
  int y;
  int r1;
  int r2;
  color c;

  Ellipse(int startx, int starty, color startc) {
    x=startx;
    y=starty;
    r1=0;
    r2=0;
    c=startc;
  }

  void draw() {
    stroke(c);
    fill(c);
    ellipse(x, y, r1, r2);
  }

  void update() {
    r1 = abs(2*(mouseX-x));
    r2 = abs(2*(mouseY-y));
  }
}

