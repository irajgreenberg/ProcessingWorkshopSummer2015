class Powerup {
  int x;
  int y;
  int puheight;
  int puwidth;
  Powerup(int x1, int y1) {
    x = x1;
    y = y1;
    puwidth = 25;
    puheight = 25;
  }
  void move(int x2, int y2) {
    x = x+x2;
  }
  void display() {
    fill(0, 255, 0);
    rect(x, y, puwidth, puheight);
    fill(0, 0, 0);
    textSize(20);
    text("$$", x, y+3*puheight/4);
  }
}

