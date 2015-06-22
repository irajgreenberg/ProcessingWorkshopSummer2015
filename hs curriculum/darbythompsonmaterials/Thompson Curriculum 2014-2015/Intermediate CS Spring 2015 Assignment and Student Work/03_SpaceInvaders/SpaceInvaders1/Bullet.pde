class Bullet {
  int x;
  int y=690;
  int speedy=-5;
  Bullet(int xpos) {
    x=xpos;
  }
  void display() {
    rect(x, y, 5, 10);
  } 

  void move() {
    y=y+speedy;
  }
}

