class Rectangle implements DrawableObject {

  int x;
  int y;
  int w;
  int h;


  Rectangle() {
    x = mouseX;
    y = mouseY;
    w = 1;
    h = 1;
  }

  void draw() {
    fill(57, 112, 54);
    rect(x, y, w, h);
  }



  void update() {
    w = mouseX - x;
    h = mouseY - y;
  }
}



