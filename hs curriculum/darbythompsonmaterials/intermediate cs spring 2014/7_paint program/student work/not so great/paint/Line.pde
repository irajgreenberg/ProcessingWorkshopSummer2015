class Line implements DrawableObject {

  int x;
  int y;
  int xx;
  int yy;


  Line() {
    x = mouseX;
    y = mouseY;
    
  }

  void draw() {
    stroke(0);
    line(x, y, xx, yy);
  }

  void update() {
    xx = mouseX;
    yy = mouseY;
  }
  
  void mouseDragged() {
    xx = xx + 3;
    yy = yy + 3;
  }
}

