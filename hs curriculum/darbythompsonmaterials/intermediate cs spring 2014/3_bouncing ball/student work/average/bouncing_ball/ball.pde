class ball {

  int x;
  int y;
  int speedX;
  int speedY;
  int rad;

  void draw() {
    ellipse(x, y, 2*rad, 2*rad);
  }
  
  void move() {
    x = x + speedX;
    y = y + speedY; 
    if (x<=width-rad) {
      speedX = -1*speedX;
    }
    if (x>=rad) {
      speedX = -1*speedX;
    }
    if (y<=height-rad) {
      speedY = -1*speedY;
    }
    if (y>=rad) {
      speedY = -1*speedY;
    }
  }
}



