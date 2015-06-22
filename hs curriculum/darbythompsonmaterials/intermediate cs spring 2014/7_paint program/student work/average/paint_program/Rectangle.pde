class Rectangle implements DrawableObject{
  int x;
  int y;
  int endx;
  int endy;
  int red;
  int green;
  int blue;
  
  Rectangle(int startx, int starty, int r, int g, int b){
    x=startx;
    y=starty;
    endx=startx;
    endy=starty;
    red=r;
    blue=b;
    green=g;
  }
  
  void draw(){
    stroke(red,green,blue);
    fill(red,green,blue);
    rect(x, y, endx-x, endy-y);
  }
  void update(){
  
    endx=mouseX;
    endy=mouseY;
  
  }
}
  
