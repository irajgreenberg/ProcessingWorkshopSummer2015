class Platform {

  float x;
  int y;
  int speedx;
  int pwidth;
  int pheight;

  Platform(int startx, int starty, int startwidth, int startheight) {
    x = startx;
    y = starty;
    pwidth = startwidth;
    pheight = startheight;
  }

  void move() {
    x = x-speedx;
  }

  void draw() {
    stroke(100);
    fill(100);
    rect(x, y, pwidth, pheight);
  }
}

