class Circle implements DrawableObject{
  int radiusx;
  int radiusy;
  int centerx;
  int centery;
  int r;
  int g;
  int b;
  
  Circle(int centerxx, int centeryy, int radiusxx, int radiusyy, int rr, int gg, int bb){
    centerx=centerxx;
    centery=centeryy;
    radiusx=radiusxx;
    radiusy=radiusyy;
    r=rr;
    g=gg;
    b=bb;
  }
  
  void draw(){
    fill(r, g, b);
    stroke(r, g, b);
    ellipse(centerx, centery, abs(radiusx-centerx)*2, abs(radiusy-centery)*2);
  }
  
  void update(){
    radiusx = mouseX;
    radiusy = mouseY;
  }
}
  
