 class Jump {
  int x;
  int y;
  int jwidth;
  int jheight;
  Jump(int x2, int y2) {
    x = 99*width/100;
    y = y2;
    jwidth = 10;
    jheight = x2;
  }
  void move(int x1, int y1) {
    x = x+x1;
  }
  void display() {
    fill(255,255,0);
    rect(x, y, jwidth, jheight);
  }
}

