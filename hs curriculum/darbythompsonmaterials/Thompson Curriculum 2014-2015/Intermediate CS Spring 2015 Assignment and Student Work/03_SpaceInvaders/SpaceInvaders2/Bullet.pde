class Bullet {

  float x;
  float y;
  float speed;
  int wide;
  int tall;

  Bullet(float startX) {

    x=startX;
    y=height-65;
    speed=-3;
    wide=2;
    tall=30;
  }

  void move() {

    y=y+speed;
  }

  void display() {

    image(game.bullet, x-wide/2, y-tall/2);
  }
}

