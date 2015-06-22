class Triangle implements DrawableObject {

  int x;
  int y;
  int xx;
  int yy;
  int xxx;
  int yyy;

  Triangle() {
    x = mouseX;
    y = mouseY;
    xx = mouseX;
    yy = mouseY;
    xxx = mouseX - 50;
    yyy = mouseY;
  }

  void draw() {
    fill(103, 48, 112);
    triangle(x, y, xx, yy, xxx, yyy);
  }


  void update() {
    xx = mouseX;
    yy = mouseY;
  }

}

