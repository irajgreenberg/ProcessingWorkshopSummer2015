class Oval implements Drawable {

  float x;
  float y;
  float radius;
  float radiusb;
  boolean progress;
  float r;
  float g;
  float b;

  Oval(float xpos, float ypos, float rad, float radb, float red, float green, float blue) {
    x=xpos;
    y=ypos;
    radius=rad;
    radiusb=radb;
    progress=true;
    r=red;
    g=green;
    b=blue;
  }

  void display() {
    ellipseMode(CORNERS);
    stroke(0);
    fill(r, g, b);
    ellipse(x, y, radius, radiusb);
  }
  
  void inputchange(){
    radius=mouseX;
    radiusb=mouseY;
  }
    
}

