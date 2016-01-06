class Line implements DrawableObject{
  
  int x;
  int y;
  int endx;
  int endy;
  int red; 
  int green;
  int blue;
 
  
  Line(int startx, int starty, int r, int g, int b){
    x=startx;
    y=starty;
    endx=startx;
    endy=starty;
    red=r;
    green=g;
    blue=b;
    
  }
  
  void draw(){
    stroke(red,green,blue);
    line(x, y, endx, endy);
  }
  void update(){
  
    endx=mouseX;
    endy=mouseY;
  
  }
  
}


