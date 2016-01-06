class Explosion {

  PImage explosion1;
  PImage explosion2;
  PImage explosion3;
  PImage explosion4;
  PImage explosion5;
  PImage explosion6;
  PImage explosion7;
  PImage explosion8;
  PImage explosion9;
  PImage explosion10;
  PImage explosion11;
  PImage explosion12;
  PImage explosion13;
  PImage explosion14;
  PImage explosion15;
  PImage explosion16;
  PImage explosion17;
  int frame;
  int x;
  int y;

  Explosion() {
    explosion1 = loadImage("explosion1.png");
    explosion2 = loadImage("explosion2.png");
    explosion3 = loadImage("explosion3.png");
    explosion4 = loadImage("explosion4.png");
    explosion5 = loadImage("explosion5.png");
    explosion6 = loadImage("explosion6.png");
    explosion7 = loadImage("explosion7.png");
    explosion8 = loadImage("explosion8.png");
    explosion9 = loadImage("explosion9.png");
    explosion10 = loadImage("explosion10.png");
    explosion11 = loadImage("explosion11.png");
    explosion12 = loadImage("explosion12.png");
    explosion13 = loadImage("explosion13.png");
    explosion14 = loadImage("explosion14.png");
    explosion15 = loadImage("explosion15.png");
    explosion16 = loadImage("explosion16.png");
    explosion17 = loadImage("explosion17.png");
    frame=0;
  }

  void update() {
    x=kittens.x-20;
    y=kittens.y-20;
    frame=frame+1;
  }

  void draw() {
    noTint();
    if (frame==1) {
      image(explosion1, x, y, 142, 200);
    }
    if (frame==2) {
      image(explosion2, x, y, 142, 200);
    }
    if (frame==3) {
      image(explosion3, x, y, 142, 200);
    }
    if (frame==4) {
      image(explosion4, x, y, 142, 200);
    }
    if (frame==5) {
      image(explosion5, x, y, 142, 200);
    }
    if (frame==6) {
      image(explosion6, x, y, 142, 200);
    }
    if (frame==7) {
      image(explosion7, x, y, 142, 200);
    }
    if (frame==8) {
      image(explosion8, x, y, 142, 200);
    }
    if (frame==9) {
      image(explosion9, x, y, 142, 200);
    }
    if (frame==10) {
      image(explosion10, x, y, 142, 200);
    }
    if (frame==11) {
      image(explosion11, x, y, 142, 200);
    }
    if (frame==12) {
      image(explosion12, x, y, 142, 200);
    }
    if (frame==13) {
      image(explosion13, x, y, 142, 200);
    }
    if (frame==14) {
      image(explosion14, x, y, 142, 200);
    }
    if (frame==15) {
      image(explosion15, x, y, 142, 200);
    }
    if (frame==16) {
      image(explosion16, x, y, 142, 200);
    }
    if (frame==17) {
      image(explosion17, x, y, 142, 200);
    }
  }
}

