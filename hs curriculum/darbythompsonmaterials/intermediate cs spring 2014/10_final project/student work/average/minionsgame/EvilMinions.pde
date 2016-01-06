class EvilMinions {
  int x;
  int y;
  int speed;
  int size;
  PImage p;

  EvilMinions(int startx, int starty) {
    x=startx;
    y=starty;
    speed=(int)random(7,9);
    p=loadImage("evil-minion-finished.png");
  }

  void move() {
    x=x-speed;
  }
  void draw() {

    image(p, x, y, 120, 120);
  }
}
/* TO DO LIST 
-game end checks
-collision detection b/n evil minions and minion
-input other images
*/
