class Hole extends BasicFlyingObject{
  

  Hole(){
   x=width+w;
   y=760;
   w=200;
   h=50;
   speedx=4;
    
    
  }
  
void update(){
  x=x-speedx;
  
  
}

void display(){
  fill(86,199,242);
  stroke(86,199,242);
  rect(x,y,w,h);
  
}
  
  
  
  
  
  
  
 
  
  
  
  
  
  
}
