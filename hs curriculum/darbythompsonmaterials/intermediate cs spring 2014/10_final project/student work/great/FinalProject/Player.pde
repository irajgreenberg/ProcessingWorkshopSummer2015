class Player {

  float x;
  float y;
  PImage skater;
  PImage skaterjump;
  int pwidth = 40;
  float speedy = 0;
  float speedx = 0;
  //if this is 0, player has not jumped, if it is 1 it has jumped once, 2 if it has jumped twice
  int hasjumped = 0;

  Player() {
    x = 100;
    y = 100;
    skater = loadImage("skating1.gif");
    skaterjump = loadImage("skating2.gif");
  }

  void draw() {
    if (hasjumped==0) {
      image(skater, x, y);
    }
    else {
      image(skaterjump, x, y);
    }
  }

  void move() {
    x = x+speedx;
  }

  void fall() {
    speedy = speedy+.3;
    y = y+speedy;
  }

  void action() {
    if (key==CODED) {
      if (hasjumped<=1) {
        if (keyCode==UP) {
          speedy = -8;
          fall();
          hasjumped++;
        }
      }
      if (keyCode==LEFT) {
        speedx = speedx-2;
      }
      if (keyCode==RIGHT) {
        speedx = speedx+2;
      }
    }
  }
}

