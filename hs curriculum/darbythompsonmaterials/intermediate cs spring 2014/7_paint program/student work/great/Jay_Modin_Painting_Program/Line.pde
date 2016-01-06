class Line implements DrawableObject {

  int x;
  int y;
  int q;
  int w;
  int r;
  int g;
  int b;
  Line(int a, int bl, int rojo, int verde, int azul) {
    x=a;
    y=bl;
    q=a;
    w=bl;
    r=rojo;
    g=verde;
    b=azul;
  }

  void display() {
    stroke(r, g, b);
    line(x, y, q, w);
  }
  void update() {
    q=mouseX;
    w=mouseY;
  }
}

