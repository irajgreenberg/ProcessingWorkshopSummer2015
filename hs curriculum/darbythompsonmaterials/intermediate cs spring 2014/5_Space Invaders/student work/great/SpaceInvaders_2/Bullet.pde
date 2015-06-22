class Bullet {
  int x;
  int y;

  Bullet(int a, int b) {
    x=a;
    y=b;
  }

  void move() {
    y=y-5;
  }


  void draw() {
    noStroke();
    fill(255, 0, 0);
    rect(x, y, 5, 5);
  }
}

