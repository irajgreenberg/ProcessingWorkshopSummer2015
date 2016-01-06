class Line implements DrawableObject {

  int x1;
  int y1;
  int x2;
  int y2;
  color c;
  int w;

  Line(int startx, int starty, color startc) {
    x1=startx;
    y1=starty;
    x2=startx;
    y2=starty;
    c=startc;
  }

  void draw() {
    strokeWeight(w);
    stroke(c);
    fill(c);
    line(x1, y1, x2, y2);
    strokeWeight(1);
  }

  void update() {
    x2=mouseX;
    y2=mouseY;
    w=ArtPatron.weight;
  }
}

