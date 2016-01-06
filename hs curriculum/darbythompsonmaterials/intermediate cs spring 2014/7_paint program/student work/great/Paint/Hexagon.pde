class Hexagon implements DrawableObject {

  int x;
  int y;
  int r;
  color c;

  Hexagon(int startx, int starty, color startc) {
    x=startx;
    y=starty;
    r=0;
    c=startc;
  }

  void draw() {
    stroke(c);
    fill(c);
    beginShape();
    vertex((int)(x-0.5*r), (int)(y-(Math.pow(3, 0.5)/2)*r));
    vertex((int)(x+0.5*r), (int)(y-(Math.pow(3, 0.5)/2)*r));
    vertex(x+r, y);
    vertex((int)(x+0.5*r), (int)(y+(Math.pow(3, 0.5)/2)*r));
    vertex((int)(x-0.5*r), (int)(y+(Math.pow(3, 0.5)/2)*r));
    vertex(x-r, y);
    endShape();
  }

  void update() {
    r=(int)Math.pow((Math.pow(mouseX-x, 2)+Math.pow(mouseY-y, 2)), 0.5);
  }
}

