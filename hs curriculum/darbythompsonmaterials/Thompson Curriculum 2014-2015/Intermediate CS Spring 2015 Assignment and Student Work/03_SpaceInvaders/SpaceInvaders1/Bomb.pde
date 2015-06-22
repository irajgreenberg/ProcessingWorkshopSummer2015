class Bomb {
  int x; 
  float y;
  float speedy=1.5;

  Bomb(int xpos, int ypos) {
    x=xpos;
    y=ypos;
  }
  void display() {
    ellipse(x, y, 10, 10);
  }

  void move() {
    y=y+speedy;
  }
}

