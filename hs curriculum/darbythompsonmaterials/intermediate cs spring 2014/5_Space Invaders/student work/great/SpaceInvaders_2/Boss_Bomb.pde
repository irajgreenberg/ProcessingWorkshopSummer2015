class Boss_Bomb {
  int x;
  int y;

  Boss_Bomb (int a, int b) {
    x=a;
    y=b;
  }

  void move() {
    y=y+8;
  }

  void draw() {
    noStroke();
    fill(255, 153, 51);
    rect(x, y, 10, 10);
  }
}

