class Bomb extends BasicFlyingObject{
  
 Bomb(){
 x=width+w;
 w=bomb.width;
 h=bomb.height;
 speedx=int(random(-4,-1));
 y=int(random(20,730));
 } 
  
  
 void update(){
  x=x+speedx;
  
 }


void display(){
 image(bomb,x,y);
 
} 
  
  
  
  
  
  
  
  
  
  
  
  
}
