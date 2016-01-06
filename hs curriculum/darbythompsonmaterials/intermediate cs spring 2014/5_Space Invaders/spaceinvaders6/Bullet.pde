class Bullet{
 
  PVector position;
  int w=2;
  int h=10;
  
  Bullet(float x, float y){
    position = new PVector(x,y);
  }
  
 void update(){
   position.y -=1;
 }
  
 void display(){
   fill(0,255,0);
   ellipse(position.x,position.y,w,h);
 } 
  
}

class Missile extends Bullet{
  
  Missile(float x, float y){
    super(x,y);
    
  }
  
 void update(){
   position.y +=1;
 }
  
 void display(){
   fill(255,0,0);
   ellipse(position.x,position.y,w,h);
 } 
  
}
