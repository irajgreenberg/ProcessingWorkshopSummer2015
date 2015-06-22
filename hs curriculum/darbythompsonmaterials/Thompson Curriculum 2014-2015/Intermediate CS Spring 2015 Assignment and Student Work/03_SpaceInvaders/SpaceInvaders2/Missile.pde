class Missile {
//missile is nearly identical to bullet here, except width, height, and speed
  float x;
  float y;
  float speed;
  int wide;
  int tall;

  Missile(float startX) {

    x=startX;
    y=height-65;
    speed=-4;
    wide=15;
    tall=20;
  }

  void move() {

    y=y+speed;
  }

  void display() {

    image(game.missile, x-wide/2, y-tall/2);
  }
}

