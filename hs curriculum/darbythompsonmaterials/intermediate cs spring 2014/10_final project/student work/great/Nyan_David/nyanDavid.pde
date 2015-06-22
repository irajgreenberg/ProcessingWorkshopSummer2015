class nyanDavid {

  PImage nyan1;
  PImage nyan2;
  PImage nyan3;
  PImage nyan4;
  PImage nyan5;
  PImage nyan6;
  PImage nyan7;
  PImage nyan8;
  PImage nyan9;
  PImage nyan10;
  PImage nyan11;
  PImage nyan12;
  int frame;
  int s;
  int x;
  int y;
  int v;
  int jumps;
  int lives;

  nyanDavid() {
    nyan1 = loadImage("nyan1.png");
    nyan2 = loadImage("nyan2.png");
    nyan3 = loadImage("nyan3.png");
    nyan4 = loadImage("nyan4.png");
    nyan5 = loadImage("nyan5.png");
    nyan6 = loadImage("nyan6.png");
    nyan7 = loadImage("nyan7.png");
    nyan8 = loadImage("nyan8.png");
    nyan9 = loadImage("nyan9.png");
    nyan10 = loadImage("nyan10.png");
    nyan11 = loadImage("nyan11.png");
    nyan12 = loadImage("nyan12.png");
    frame=0;
    s=200;
    x=250;
    y=200;
    v=0;
    jumps=0;
    lives=3;
  }

  void update() {
    if (v<=-25) {
      v=-24;
    }
    y=y-v;
    v=v-1; 
    for (Earth p: platforms) {
      if (p.x<=245+0.18*s && p.x>=255-p.w-0.12*s && y>p.y-0.18*s && y<p.y+10 && v<=0) {
        if (p.bouncy==false) {
          y=p.y-(int)(0.18*s);
          v=0;
          jumps=0;
        }
        else {
          y=p.y-(int)(0.18*s);
          v=36;
          jumps=0;
          score.value=score.value+50;
        }
      }
    }
    if (frame<12) {
      frame = frame+1;
    }
    if (frame==12) {
      frame = 1;
    }
  }

  void draw() {
    textSize(24);
    textAlign(LEFT, TOP);
    text("Lives: "+Integer.toString(lives), 10, 40);
    stroke(0);
    if (gameStarted==true && platforms.get(0).boost==1) {
      tint(230, 100, 100, 150);
    }
    else {
      noTint();
    }
    //image(darbyHead, x-0.5*w, y-0.5*h, w, h);
    if (frame==1) {
      image(nyan1, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==2) {
      image(nyan2, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==3) {
      image(nyan3, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==4) {
      image(nyan4, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==5) {
      image(nyan5, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==6) {
      image(nyan6, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==7) {
      image(nyan7, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==8) {
      image(nyan8, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==9) {
      image(nyan9, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==10) {
      image(nyan10, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==11) {
      image(nyan11, x-0.5*s, y-0.5*s, s, s);
    }
    if (frame==12) {
      image(nyan12, x-0.5*s, y-0.5*s, s, s);
    }
  }

  void action(char key) {
    if (keyCode == UP && jumps<=1) {
      v=15;
      jumps=jumps+1;
    }
  }
}

