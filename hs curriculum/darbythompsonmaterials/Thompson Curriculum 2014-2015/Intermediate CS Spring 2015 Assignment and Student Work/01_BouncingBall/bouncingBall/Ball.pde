class Ball {

  int x;
  int y;
  int radius;
  int speedx;
  int speedy;

  Ball() {
    x = width/2;
    y = height/2;
    radius = 50;
    speedx = 3;
    speedy = 5;
  }

  Ball(int startx, int starty, int size, int sx, int sy) {
    x = startx;
    y = starty;
    radius = size;
    speedx = sx;
    speedy = sy;
  }

  void move() {
    x = x+speedx;
    y = y+speedy;

    if (x<radius|| x>width-radius) {
      speedx=-speedx;
    }
    if (y<radius || y>height-radius) {
      speedy=-speedy;
    }
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, radius*2, radius*2);
  }
}

