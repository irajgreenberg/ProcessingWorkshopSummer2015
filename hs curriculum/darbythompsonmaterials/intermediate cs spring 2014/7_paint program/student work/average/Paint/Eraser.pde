class Eraser implements DrawableObject{
  int centerx;
  int centery;
  int r;
  int g;
  int b;
  
  Eraser(int centerxx, int centeryy){
    centerx=centerxx;
    centery=centeryy;
  }
  
  void draw(){
    fill(255);
    stroke(255);
    ellipse(centerx, centery, 15, 15);
  }
  
  void update(){
    centerx = mouseX;
    centery = mouseY;
  }
}
