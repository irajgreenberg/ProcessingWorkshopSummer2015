class Money {
  int x;
  int y;
  PImage img;

  Money (int a, int b) {
    x=a;
    y=b;
    img= loadImage("Money.png");
  }

  void move() {
    y=y+2;
  }

  void draw() {
    image(img, x, y);
  }
}

