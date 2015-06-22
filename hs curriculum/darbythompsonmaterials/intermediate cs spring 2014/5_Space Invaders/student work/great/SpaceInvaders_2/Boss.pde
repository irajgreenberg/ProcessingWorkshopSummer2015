class Boss {
  int x;
  int y;
  int Lives;
  int speed=5;
  PImage img;

  Boss (int a, int b) {
    x=a;
    y=b;
    img= loadImage("Boss.png");
    Lives=3;
  }

  void move() {
    x=x+speed;

    if (x+100==width) {
      speed=-speed;
    }

    if (x==0) {
      speed=-speed;
    }
  }

  void draw() {
    image(img, x, y);
  }
}

