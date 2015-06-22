class Pen implements DrawableObject{
  
  int x;
  int y;
  int red;
  int green;
  int blue;
  int rad;
 
  
  Pen(int startx, int starty, int r, int g, int b, int radius){
    x=startx;
    y=starty;
    red=r;
    green=g;
    blue=b;
    rad=radius;
  }
  
  void draw(){
    stroke(red,green,blue);
    fill(red,green,blue);
    ellipse(x, y, rad,rad);
    
  }
  void update(){
    x=mouseX;
    y=mouseY;
  }
  
}
