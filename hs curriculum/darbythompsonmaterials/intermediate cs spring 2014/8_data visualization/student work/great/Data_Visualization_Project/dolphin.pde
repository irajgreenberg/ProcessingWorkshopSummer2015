class dolphin {

  PImage dolphin1;
  PImage dolphin2;
  PImage dolphin3;
  PImage dolphin4;
  PImage dolphin5;
  PImage dolphin6;
  PImage dolphin7;
  PImage dolphin8;
  PImage dolphin9;
  PImage dolphin10;
  PImage dolphin11;
  PImage dolphin12;
  PImage dolphin13;
  PImage dolphin14;
  PImage dolphin15;
  int frame;
  float x;
  float y;

  dolphin(int startframe, float startx, float starty) {
    frame = startframe;
    x = startx;
    y = starty;
    dolphin1 = loadImage("4dol3d1.png");
    dolphin2 = loadImage("4dol3d2.png");
    dolphin3 = loadImage("4dol3d3.png");
    dolphin4 = loadImage("4dol3d4.png");
    dolphin5 = loadImage("4dol3d5.png");
    dolphin6 = loadImage("4dol3d6.png");
    dolphin7 = loadImage("4dol3d7.png");
    dolphin8 = loadImage("4dol3d8.png");
    dolphin9 = loadImage("4dol3d9.png");
    dolphin10 = loadImage("4dol3d10.png");
    dolphin11 = loadImage("4dol3d11.png");
    dolphin12 = loadImage("4dol3d12.png");
    dolphin13 = loadImage("4dol3d13.png");
    dolphin14 = loadImage("4dol3d14.png");
    dolphin15 = loadImage("4dol3d15.png");
  }

  void update() {
    if (frame<15) {
      frame = frame+1;
    }
    if (frame==15) {
      frame = 1;
    }
    x = x-5;
    y = y+6*(float)Math.sin(x/50);
    if (x<-200) {
      x=width+100;
      y=random(height);
    }
    if (y>height) {
      y=0;
    }
  }

  void display() {
    if (frame ==1) {
      image(dolphin1, (int)x, (int)y);
    }
    if (frame == 2) {
      image(dolphin2, (int)x, (int)y);
    }
    if (frame == 3) {
      image(dolphin3, (int)x, (int)y);
    }
    if (frame == 4) {
      image(dolphin4, (int)x, (int)y);
    }
    if (frame == 5) {
      image(dolphin5, (int)x, (int)y);
    }
    if (frame == 6) {
      image(dolphin6, (int)x, (int)y);
    }
    if (frame == 7) {
      image(dolphin7, (int)x, (int)y);
    }
    if (frame == 8) {
      image(dolphin8, (int)x, (int)y);
    }
    if (frame == 9) {
      image(dolphin9, (int)x, (int)y);
    }
    if (frame == 10) {
      image(dolphin10, (int)x, (int)y);
    }
    if (frame == 11) {
      image(dolphin11, (int)x, (int)y);
    }
    if (frame == 12) {
      image(dolphin12, (int)x, (int)y);
    }
    if (frame == 13) {
      image(dolphin13, (int)x, (int)y);
    }
    if (frame == 14) {
      image(dolphin14, (int)x, (int)y);
    }
    if (frame == 15) {
      image(dolphin15, (int)x, (int)y);
    }
  }
}

