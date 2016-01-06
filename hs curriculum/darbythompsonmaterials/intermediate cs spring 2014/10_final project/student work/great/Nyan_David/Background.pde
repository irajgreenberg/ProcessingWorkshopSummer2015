class Background {

  PImage b1;
  PImage b2;
  PImage b3;
  PImage b4;
  PImage b5;
  PImage b6;
  PImage b7;
  PImage b8;
  PImage b9;
  PImage b10;
  PImage b11;
  PImage b12;
  PImage b13;
  PImage b14;
  PImage b15;
  PImage b16;
  PImage b17;
  PImage b18;
  PImage b19;
  PImage b20;
  PImage b21;
  PImage b22;
  PImage b23;
  PImage b24;
  PImage b25;
  PImage b26;
  PImage b27;
  PImage b28;
  PImage b29;  
  int frame;
  int x;
  int y;

  Background() {
    b1 = loadImage("b1.png");
    b2 = loadImage("b2.png");
    b3 = loadImage("b3.png");
    b4 = loadImage("b4.png");
    b5 = loadImage("b5.png");
    b6 = loadImage("b6.png");
    b7 = loadImage("b7.png");
    b8 = loadImage("b8.png");
    b9 = loadImage("b9.png");
    b10 = loadImage("b10.png");
    b11 = loadImage("b11.png");
    b12 = loadImage("b12.png");
    b13 = loadImage("b13.png");
    b14 = loadImage("b14.png");
    b15 = loadImage("b15.png");
    b16 = loadImage("b16.png");
    b17 = loadImage("b17.png");
    b18 = loadImage("b18.png");
    b19 = loadImage("b19.png");
    b20 = loadImage("b20.png");
    b21 = loadImage("b21.png");
    b22 = loadImage("b22.png");
    b23 = loadImage("b23.png");
    b24 = loadImage("b24.png");
    b25 = loadImage("b25.png");
    b26 = loadImage("b26.png");
    b27 = loadImage("b27.png");
    b28 = loadImage("b28.png");
    b29 = loadImage("b29.png");
    frame=0;
    x=0;
    y=0;
  }

  void update() {
    if (frame<29) {
      frame = frame+1;
    }
    if (frame==29) {
      frame = 1;
    }
  }

  void draw() {
    noTint();
    if (frame==1) {
      image(b1, x, y, width, height);
    }
    if (frame==2) {
      image(b2, x, y, width, height);
    }
    if (frame==3) {
      image(b3, x, y, width, height);
    }
    if (frame==4) {
      image(b4, x, y, width, height);
    }
    if (frame==5) {
      image(b5, x, y, width, height);
    }
    if (frame==6) {
      image(b6, x, y, width, height);
    }
    if (frame==7) {
      image(b7, x, y, width, height);
    }
    if (frame==8) {
      image(b8, x, y, width, height);
    }
    if (frame==9) {
      image(b9, x, y, width, height);
    }
    if (frame==10) {
      image(b10, x, y, width, height);
    }
    if (frame==11) {
      image(b11, x, y, width, height);
    }
    if (frame==12) {
      image(b12, x, y, width, height);
    }
    if (frame==13) {
      image(b13, x, y, width, height);
    }
    if (frame==14) {
      image(b14, x, y, width, height);
    }
    if (frame==15) {
      image(b15, x, y, width, height);
    }
    if (frame==16) {
      image(b16, x, y, width, height);
    }
    if (frame==17) {
      image(b17, x, y, width, height);
    }
    if (frame==18) {
      image(b18, x, y, width, height);
    }
    if (frame==19) {
      image(b19, x, y, width, height);
    }
    if (frame==20) {
      image(b20, x, y, width, height);
    }
    if (frame==21) {
      image(b21, x, y, width, height);
    }
    if (frame==22) {
      image(b22, x, y, width, height);
    }
    if (frame==23) {
      image(b23, x, y, width, height);
    }
    if (frame==24) {
      image(b24, x, y, width, height);
    }
    if (frame==25) {
      image(b25, x, y, width, height);
    }
    if (frame==26) {
      image(b26, x, y, width, height);
    }
    if (frame==27) {
      image(b27, x, y, width, height);
    }
    if (frame==28) {
      image(b28, x, y, width, height);
    }
    if (frame==29) {
      image(b29, x, y, width, height);
    }
  }
}

