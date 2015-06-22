class Circle implements Drawable{
  int x;
  int y;
  int r;
  float red;
  float green;
  float blue;
Circle(int xpos, int ypos, float r1, float g1, float b1){
  x = xpos;
  y = ypos;
  r = 14;
  
  red = r1;
  green = g1;
  blue = b1;
}
  
  
  
  void display(){
    stroke(5);
    noStroke();
    fill(red,green,blue);
   ellipse(x,y,r,r); 
 
   //ellipse(x,y,1,1);
    
  }
  void modify(){
   
    
    r=int(abs((dist(x,y,mouseX,mouseY))))*2; 
    
    
  }
  
}
  
  
