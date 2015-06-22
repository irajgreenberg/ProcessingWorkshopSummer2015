class Rectangle implements DrawableObject {

  int x;
  int y;
  int w;
  int z;
  int r;
  int g;
  int b;

  Rectangle(int a, int bl, int rojo, int verde, int azul) {
    x=a;
    y=bl;
    w=0;
    z=0;
    r=rojo;
    g=verde;
    b=azul;
    
  }

  void display() {

    fill(r,g,b);
    stroke(0);
    rect(x, y, w, z);
    }
  
  void update() {
    w=mouseX-x;
    z=mouseY-y;
  }
}
