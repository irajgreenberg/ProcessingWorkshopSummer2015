class Line implements Drawable{
 int x;
int y;
int x2;
int y2;
float r;
  float g;
  float b;
Line(int xpos, int ypos,float red, float green, float blue) {
 x = xpos;
y = ypos; 
x2 = xpos+1;
y2 = ypos + 1;
  r = red;
  g = green;
  b = blue;
}


void display(){
  
  
stroke(r,g,b);
strokeWeight(4);
  line(x,y,x2,y2);
}

void modify(){
 x2 = mouseX;
y2 = mouseY; 
  
}
  
}
