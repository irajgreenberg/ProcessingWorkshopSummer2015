class Square implements Drawable {
 int x;
 int y;
 int w;
float red;
  float green;
  float blue;
  int h;
Square(int xpos, int ypos, float r1, float g1, float b1){
 x = xpos;
 y = ypos;
 w = 10;
 
 red = r1;
  green = g1;
  blue = b1;
} 
  void display(){
    stroke(5);
    noStroke();
  fill(red,green,blue);
    rect(x,y,w,h);
    
    
  }
  
  void modify() {
   w = mouseX-x;
   h = mouseY-y;
    
  }
  
}
