class Stars {

  int x;
  int y;

  Stars(int startx, int starty) {
    x=startx;
    y=starty;
  }

  void update() {
    if (x<-1) {
      x=width+1;
      y=(int)random(height);
    }
    x=x-3;
  }

  void draw() {
    stroke(255);
    fill(255);
    ellipse(x, y, 1, 1);
  }
}

