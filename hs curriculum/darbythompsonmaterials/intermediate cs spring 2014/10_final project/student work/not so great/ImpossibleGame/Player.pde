class Player {
  float x;
  float y;
  PVector speed;
  int lives;
  boolean jump = false;
  int score;
  Player() {
    x=200;
    y=height-200;
    speed = new PVector(0, 0);
    lives=1;
  }
  void draw() {
    fill(0, 0, 255);
    rect(x, y, 100, 100);
  }
  void speedchange(char key) {
    if (key=='w') {
      jump = true;
      speed.y=7;
      speed.x=2;
    }
  }


  void move() {
    if (jump==true) {
      speed.y=speed.y-.2;
      y=y-speed.y;
    }
    if (y>=height-100) {
      jump=false;
    }
    if (y+100>height) {
      y=height-100;
    }
  }
  void die() {
    lives=lives-1;
  }
  void addpoints() {
    score = score + 1;
  }
  void addbonus() {
    score = score+5;
  }
}

