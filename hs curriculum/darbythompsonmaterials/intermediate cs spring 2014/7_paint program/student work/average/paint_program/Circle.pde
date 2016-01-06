class Circle implements DrawableObject{
  
  int x;
  int y;
  float radius;
  int red;
  int green; 
  int blue;
 
  
  Circle(int startx, int starty, int r, int g, int b){
    x=startx;
    y=starty;
    red = r;
    green = g;
    blue = b;
   
  }
  
  void draw(){
    fill(red, green, blue);
    ellipse(x, y, radius*2, radius*2);
  }
  void update(){
  
      radius=sqrt(pow((x-60),2)+pow((y-mouseY),2));
  }
  
}
