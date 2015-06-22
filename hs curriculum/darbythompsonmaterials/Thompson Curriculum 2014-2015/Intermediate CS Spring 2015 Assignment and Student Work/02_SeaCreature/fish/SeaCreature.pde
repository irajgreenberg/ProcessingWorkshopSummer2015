class SeaCreature {
  int x;
  float y;

  int radius;
  int speedx;
  float speedy;
  float r;
  float g;
  float b;
 
  float yvalue;

  SeaCreature(int startx,int starty) {
    radius=int(random(25, 50));
    x=startx;
    
    y=starty;
    speedx=int(random(3, 5));
    speedy=int(random(1, 2));
    r= random(0, 255);
    g=random(0, 255);
    b=random(0, 255);
  }

  void swim() {

    x=x+speedx;
    yvalue=x;
    
    speedy=3*sin(.02*yvalue);
    y=speedy+y;
    
    

    if (x>width+radius) {
      x=int(random(-2*radius, 0-radius));
      y=int(random(radius, height-radius));
      r= random(0, 255);
      g=random(0, 255);
      b=random(0, 255);
    }
    
    
  }


  void display() {
   
    fill( r, g, b);
   triangle(x-radius,y-.6*radius,x-.4*radius,y,x-radius,y+.6*radius);
    ellipse(x, y, radius, .75*radius);
    fill(0);
    ellipse(x+radius/6,y-radius/8,radius/10,radius/10);
    
    
   // ellipse(x,y,.5*radius,radius); 
    //triangle(x-.*radius,y-.25*radius,x,y-radius, x+.25*radius,y-.25*radius);  
     
  }
}






