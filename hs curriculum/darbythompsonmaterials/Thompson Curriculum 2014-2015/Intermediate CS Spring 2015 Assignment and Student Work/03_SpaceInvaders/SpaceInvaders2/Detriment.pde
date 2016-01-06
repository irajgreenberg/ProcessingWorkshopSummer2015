class Detriment {  //i didnt really know what to call this so i went full on with "detriment". it slows down the ship when it hits it

  float x;
  float y;
  float speed;
  int wide;
  int tall;

  Detriment(int startX, int startY) {

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
    image(game.detriment, x-wide/2, y-tall/2);
  }
}

