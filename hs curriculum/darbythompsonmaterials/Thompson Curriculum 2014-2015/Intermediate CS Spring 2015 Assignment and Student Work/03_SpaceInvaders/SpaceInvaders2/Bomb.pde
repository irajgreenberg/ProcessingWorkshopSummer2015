class Bomb {
//pretty normal stuff here
  float x;
  float y;
  float speed;
  int wide;
  int tall;

  Bomb(float startX, float startY) {//need to specify

    x=startX;
    y=startY;
    speed=3;
    wide=10;
    tall=20;
  }

  void move() {

    y=y+speed;
  }

  void display() {

    image(game.bomb, x-wide/2, y-tall/2);
  }
}

