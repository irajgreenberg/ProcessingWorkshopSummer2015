class Ball {
  int x;
  int y;
  int speedX;
  int speedY;
  int radius;  


  void draw() {
    stroke(0, 0, 139);
    fill(0, 0, 139);
    ellipse(x, y, 100, 100);
  }


  void move() {

    x=x+speedX;
    y=y+speedY;

    if (x+radius>=width) {
      speedX=-speedX;
    }

    if (x-radius<=0) {
      speedX=-speedX;
    }

    if (y+radius>=height) {
      speedY=-speedY;
    }
  }
}
