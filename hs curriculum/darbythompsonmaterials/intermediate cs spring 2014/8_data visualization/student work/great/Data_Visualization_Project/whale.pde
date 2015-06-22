class whale {

  PImage whale;
  float x;
  float y;

  whale(float startx, float starty) {
    x = startx;
    y = starty;
    whale = loadImage("Moving Whale.png");
  }

  void update() {
    x = x-5;
    y = y+2*(float)Math.sin(x/50);
    if (x<-500) {
      x=width;
      y=random(200, height-200);
    }
    if (y>height) {
      y=0;
    }
  }

  void display() {
    image(whale, (int)x, (int)y);
  }
}

