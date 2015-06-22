class Powerup {
//this grants the player an extra life
  float x;
  float y;
  float speed;
  int wide;
  int tall;

  Powerup(int startX, int startY) {

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

    image(game.life, x-wide/2, y-tall/2);
  }
}

