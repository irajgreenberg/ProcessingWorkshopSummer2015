class Rectangle implements DrawableObject {

  int x;
  int y;
  int w;
  int h;
  color c;

  Rectangle(int startx, int starty, color startc) {
    x=startx;
    y=starty;
    w=0;
    h=0;
    c=startc;
  }

  void draw() {
    stroke(c);
    fill(c);
    rect(x, y, w, h);
  }

  void update() {
    w=mouseX-x;
    h=mouseY-y;
  }
}

