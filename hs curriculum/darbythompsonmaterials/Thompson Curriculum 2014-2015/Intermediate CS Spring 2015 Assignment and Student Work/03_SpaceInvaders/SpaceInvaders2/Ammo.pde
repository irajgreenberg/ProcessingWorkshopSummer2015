class Ammo {
//this is the actual item that drops that provides the ability to shoot missiles
  float x;
  float y;
  float speed;
  int wide;
  int tall;

  Ammo(int startX, int startY) {

    x=startX;
    y=startY;
    speed=2;
    wide=15;
    tall=15;
  }

  void move() {
    y=y+speed;
  }

  void display() {

    image(game.ammo, x-wide/2, y-tall/2);
  }
}

