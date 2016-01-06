class Player {
  int x;
  int y;
  int speed;
  int score;
  int Lives;
  boolean Winner;


  Player() {
    x=width/2;
    y=height-100;
    Lives=3;
    Winner=false;
    score=0;
  }

  void draw() {
    noStroke();
    fill(0, 255, 0);
    rect(x, y, 50, 15);
  }

  void move() {
    x=x+speed;
    if (x>=width-50) {
      speed=0;
    }
    if (x<=0) {
      speed=0;
    }
  }

  void action(char k) {
    if (key==CODED) {
      if (x>0) {
        if (keyCode==LEFT) {
          speed=-2;
        }
      }
      if (x<width-50) {
        if (keyCode==RIGHT) {
          speed=2;
        }
      }
      if (keyCode==DOWN) {
        speed=0;
      }
    }
  }
}

