class Bomb {
  int x;
  int y;

  Bomb (int a, int b) {
    x=a;
    y=b;
  }

  void move() {
    y=y+5;
  }

  void draw() {
    noStroke();
    fill(255, 0, 255);
    rect(x, y, 3, 6);
  }
}

