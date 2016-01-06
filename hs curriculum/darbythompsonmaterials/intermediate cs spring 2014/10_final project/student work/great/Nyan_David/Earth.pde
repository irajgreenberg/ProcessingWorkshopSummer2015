class Earth {
  int x;
  int y;
  int w;
  int h;
  int v;
  int vo;
  int boost;
  color c;
  boolean bouncy;

  Earth(int startx, int starty, int startw, int starth) {
    x=startx;
    y=starty;
    w=startw;
    h=starth;
    vo=5+(int)(counter/360);
    v=vo;
    boost=0;
    double r = random(2);
    if (r>1.6) {
      bouncy=true;
      c=color(0, 255, 0);
    }
    else {
      bouncy=false;
      c=color(255);
    }
  }

  void update() {
    x=x-v;
    if (counter%360==0) {
      vo=vo+1;
    }
    if (v>vo) {
      v=v-1;
    }
    if (v<=vo) {
      v=vo;
      boost=0;
    }
  }

  void draw() {
    stroke(0);
    fill(c);
    rect(x, y, w, h);
  }

  void action(char key) {
    if (keyCode == RIGHT && boost==0) {
      v=vo+20;
      boost=1;
    }
  }
}

