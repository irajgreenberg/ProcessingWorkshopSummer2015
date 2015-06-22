class Bonus {
  int x;
  int y;
  int speed;
  Bonus() {
    x=int(random(width));
    y=int(random(height));
    speed = 9;
  }
  void draw() {
    fill(255, 255, 0);
    ellipse(x, y, 40, 40);
    textSize(10);
    fill(0);
    text("+5", x, y);
  }
  void move() {
    x=x-speed;
    if (x<=0) {
      x=width-40;
      y = int(random(height));
    }
  }
}

