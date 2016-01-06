class LifeUpgrade {

  float x;
  float y;
  float v;

  LifeUpgrade(float startx, float starty, float startv) {
    x = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(255);
    fill(255);
    rect(x, y, 25, 25);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(x+10, y+5, 5, 5);
    rect(x+10, y+10, 5, 5);
    rect(x+10, y+15, 5, 5);
    rect(x+5, y+10, 5, 5);
    rect(x+15, y+10, 5, 5);
  }

  void move() {
    y=y+v;
  }
}

