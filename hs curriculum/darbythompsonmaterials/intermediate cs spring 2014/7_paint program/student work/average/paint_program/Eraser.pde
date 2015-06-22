class Eraser implements DrawableObject{
  
  int x;
  int y;
  int rad;
 
  
  Eraser(int startx, int starty, int radius){
    x=startx;
    y=starty;
    rad=radius;
  }
  
  void draw(){
    stroke(255);
    fill(255);
    rect(x, y, rad,rad);
    stroke(0);
    fill(0);
    
  }
  void update(){
    x=mouseX;
    y=mouseY;
  }
  
}
