class Segment {

  int x1;
  int y1;
  int x2;
  int y2;

  Segment(int startx1, int starty1, int startx2, int starty2) {
    x1=startx1;
    y1=starty1;
    x2=startx2;
    y2=starty2;
  }

  void draw() {
    line(x1, y1, x2, y2);
  }
}

