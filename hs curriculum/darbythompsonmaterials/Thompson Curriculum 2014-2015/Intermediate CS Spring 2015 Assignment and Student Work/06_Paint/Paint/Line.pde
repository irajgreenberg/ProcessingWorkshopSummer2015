class Line implements Drawable {

  float firstx;
  float firsty;
  float endx;
  float endy;
  boolean progress;
  float r;
  float g;
  float b;

  Line(float x, float y, float otherx, float othery, float red, float green, float blue) {
    firstx= x;
    firsty= y;
    endx= otherx;
    endy= othery;
    progress=true;
    r=red;
    g=green;
    b=blue;
  }

  void display() {
    stroke(r, g, b);
    line(firstx, firsty, endx, endy);
  }
   void inputchange(){
     endx=mouseX;
     endy= mouseY;
   }
}















