class BasicFish {

  float x;
  float y;
  float speedx;
  float speedy;

  void swim() {
    x+= speedx;
    y= y-speedy*cos(radians(speedy-x)); 
    if (x>width) {
      x = -100;
    }
  }
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, 100, 50);
  }
}

