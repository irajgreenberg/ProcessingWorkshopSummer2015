class Circle implements DrawableObject {

  int x;
  int y;
  int w;
  int h;


  Circle() {
    x = mouseX;
    y = mouseY;
    w = 1;
    h = 1;
  }

  void draw() {
    fill(59, 8, 61);
    ellipse(x, y, w, h);
  }



  void update() {
    w = mouseX - x;
    h = mouseY - y;
  }
}
