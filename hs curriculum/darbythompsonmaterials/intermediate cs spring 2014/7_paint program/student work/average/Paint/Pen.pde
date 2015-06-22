class Pen implements DrawableObject{
  int centerx;
  int centery;
  int r;
  int g;
  int b;
  
  Pen(int centerxx, int centeryy, int rr, int gg, int bb){
    centerx=centerxx;
    centery=centeryy;
    r=rr;
    g=gg;
    b=bb;
  }
  
  void draw(){
    fill(r, g, b);
    stroke(r, g, b);
    ellipse(centerx, centery, 15, 15);
  }
  
  void update(){
    centerx = mouseX;
    centery = mouseY;
  }
}
