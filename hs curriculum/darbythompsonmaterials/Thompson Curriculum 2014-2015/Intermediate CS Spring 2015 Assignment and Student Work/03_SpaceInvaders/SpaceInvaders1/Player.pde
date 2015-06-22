class Player {
  int x=450;
  int y=700;
  int speedx=0;
  PImage img;
Player(){
  img=loadImage("Player.jpg");
}
  void move() { 
    x=x+speedx;
  }
  void display() {
   image(img, x, y);
  }

  void changespeed() {
    if (keyPressed) { 
      if (key==CODED) {
        if (keyCode==LEFT) {
          speedx=-3;
        }
      }
    }

    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==RIGHT) {
          speedx=3;
        }
      }
    }

    if (keyPressed) {
      if (key==CODED) {
        if (keyCode==DOWN) {
          speedx=0;
        }
      }
    }

    if (x<=0) {
      speedx=0;
      x=1;
    }
    if (x>=width-100) {
      speedx=0;
      x=width-101;
    }
  }
}
