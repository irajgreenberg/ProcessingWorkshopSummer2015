class Obstacle extends BasicFlyingObject{
 

  Obstacle(){
   x=width+w;
   y= 660;
   w=50;
   h=100;
   speedx=7;
    
    
  }
  
void update(){
  x=x-speedx;
  
  
}

void display(){
  fill(83,15,180);
  stroke(83,15,180);
  rect(x,y,w,h);
  
}
  
  
  
  
  
  
  
}
