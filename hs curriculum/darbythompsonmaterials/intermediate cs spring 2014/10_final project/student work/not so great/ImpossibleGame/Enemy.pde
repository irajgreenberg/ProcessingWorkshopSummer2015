class Enemy {
  int x;
  int y;
  int speed;
  Enemy() {
    x = int(random(width));
    y = int(random(height));
    speed = 5;
  }
  void draw() {
    fill(255, 0, 0);
    rect(x, y, 30, 30);
    textSize(10);
    fill(0, 255, 0);
    text("death", x, y+15);
  }
  void move() {
    x=x-speed;
    if (x<=0) {
      x=width;
      y=int(random(height));
    }
  }
}

