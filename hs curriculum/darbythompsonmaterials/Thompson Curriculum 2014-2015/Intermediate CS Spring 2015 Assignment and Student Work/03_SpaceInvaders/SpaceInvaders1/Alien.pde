class Alien {
  int x;
  int y;
  int speedx=1;
  PImage img;

  Alien(int xpos, int ypos) {
    x=xpos;
    y=ypos;
    img= loadImage("Aliens.jpg");
  }
  void display() {
   image(img,x,y);
  }

  void move() {
    x=x+speedx;
  }

  void changedirection() {
    speedx=-speedx;
    y=y+50;
  }
}

