class Minion {
  int x;
  int y;
  int speed;
  int score;
  int lives;
  PImage p;
  boolean jumping;
  int jumpcount=0;

  Minion(int startx, int starty) {
    x=100;
    y=680;
    speed=20;
    score=0;
    lives=3;
    p=loadImage("minion.png");
  }
  void move() {
    if (y<680) {
      speed=speed+1;
      y=y+speed;
    }
    if (y>680) {
      y=680;
    }
    if (y==680) {
      jumpcount=0;
    }
  }
  void draw() {
    image(p, x, y, 120, 120);
  }
  void jump(char key) {
    if (keyCode==UP && jumpcount<=2 && y>0) {
      speed=-20;
      y=y+speed;
      jumpcount++;
    }
  }
  void loselife() {
    lives=lives-1;
  }
  void addscore() {
    score=score+10;
  }
}

