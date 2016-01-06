class Obstacle {
  int x;
  int y;

  Obstacle() {
    x=width/2;
    y= height/2;
  }
  void draw() {
    fill(0, 255, 0);
    rect(x, y, 500, 30);
  }
  void move() {
    if (x+500<0) {
      x=width;
      y=int(random(height));
    }
    else {
      x=x-8;
    }
  }
}

