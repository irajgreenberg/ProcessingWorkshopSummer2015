class Player {
  int x;
  int y;
  int sx;
  Player () {
    x=width/2;
    y=800;
    sx=0;
  }
  void draw() {
    fill(255);
    stroke(0);
    rect(x, y, 100, 50);
  }
  void action(char key) {
    if (key == CODED) {
      if  (keyCode == LEFT) {
        sx=-2;
      }
      else if (keyCode==RIGHT) {
        sx=2;
      }
      else if (keyCode==DOWN) {
        sx=0;
      }
    }
  }
  void move() {
    if (x>=width-100) {
      sx=0;
      x=x-5;
    }
    else if (x<=0) {
      sx=0;
      x=x+5;
    }
    x=x+sx;
  }
}

