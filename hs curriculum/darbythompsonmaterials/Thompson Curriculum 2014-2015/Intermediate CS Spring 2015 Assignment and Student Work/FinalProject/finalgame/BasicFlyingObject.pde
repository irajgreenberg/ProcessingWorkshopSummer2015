abstract class BasicFlyingObject{
 int x;
int y;
int speedx; 
int h;
int w;


BasicFlyingObject(){
 x=width/2;
 y=height/2;
 h=20;
 w=200;
  
  
  
}
 void update(){
   
  x=x-speedx; 
 }
  
  void display(){
    
   rect(x,y,w,h); 
  }
  
  
  
  
  
  
  
}
