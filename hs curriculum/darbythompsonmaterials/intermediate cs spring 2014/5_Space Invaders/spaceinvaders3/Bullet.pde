class Bullet{
 
  PVector position;
  
  Bullet(float x, float y){
    position = new PVector(x,y);
  }
  
 void update(){
   position.y -=1;
 }
  
 void display(){
   fill(0,255,0);
   ellipse(position.x,position.y,2,10);
 } 
  
}
