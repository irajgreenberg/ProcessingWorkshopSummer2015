class Alien {
  int x;
  int y;
  int speed=2;
  PImage img;

  Alien (int a, int b) {
    x=a;
    y=b;
    img= loadImage("SI Aliens.png");
  }

  void move() {
    x=x+speed;
  }

  void draw() {
    image(img, x, y);
  }
}

