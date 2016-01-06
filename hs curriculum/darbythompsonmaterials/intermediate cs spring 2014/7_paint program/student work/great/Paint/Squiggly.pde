class Squiggly implements DrawableObject {

  int x1;
  int y1;
  int x2;
  int y2;
  color c;
  int w;
  ArrayList<Segment> segments;

  Squiggly(int startx, int starty, color startc) {
    x1=startx;
    y1=starty;
    x2=startx;
    y2=starty;
    c=startc;
    segments = new ArrayList();
  }

  void draw() {
    strokeWeight(w);
    stroke(c);
    fill(c);
    for (Segment s: segments) {
      s.draw();
    }
    strokeWeight(1);
  }

  void update() {
    x2=mouseX;
    y2=mouseY;
    w=ArtPatron.weight;
    Segment s = new Segment(x1, y1, x2, y2);
    segments.add(s);
    x1=mouseX;
    y1=mouseY;
  }
}

