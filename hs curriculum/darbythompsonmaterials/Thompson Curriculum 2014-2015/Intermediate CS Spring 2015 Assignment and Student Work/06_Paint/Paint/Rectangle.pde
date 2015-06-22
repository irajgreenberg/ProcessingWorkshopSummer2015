class Rectangle implements Drawable {

  float x;
  float y;
  float xb;
  float yb;
  boolean progress;
  float r;
  float g;
  float b;


  Rectangle(float xpos, float ypos, float thing, float thingtwo, float red, float green, float blue) {
    x=xpos;
    y=ypos;
    xb=thing;
    yb=thingtwo;
    progress=true;
    r=red;
    g=green;
    b=blue;
  }


  void display() {
    stroke(0);
    fill(r, g, b);
    rectMode(CORNERS);
    rect(x, y, xb, yb);
  }
  
  void inputchange(){
    xb=mouseX;
    yb=mouseY;
  }
}

