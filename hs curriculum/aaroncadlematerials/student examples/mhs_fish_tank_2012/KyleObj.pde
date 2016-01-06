class KyleObj extends AnimatedObject {

  //PIVs? 
  int x;
  int y;
  int s;
  int triS;
  
  //Constructors??
  public KyleObj()
  {
    x = (int)random(width);
    y = (int)random(height);
    s = 200;
    triS = 100;
  }
  void display()
 {
   fill(254,255,0);
   stroke(0);
   strokeWeight(5);
   beginShape();
   vertex(x,y+50);
   vertex(x+150,y-100);
   vertex(x+150,y+50);
   endShape();
   ellipse(x,y,s,s);
   beginShape();
   vertex(x+60,y);
   vertex(x+130,y-30);
   vertex(x+130,y+50);
   vertex(x+60,y+15);
   endShape();
   beginShape();
   vertex(x-60,y);
   vertex(x-130,y-30);
   vertex(x-130,y+50);
   vertex(x-60,y+15);
   endShape();
   fill(255,200,0);
   ellipse(x,y,s/8,s/8);
   fill(0);
   ellipse(x,y,s/18,s/18);
   fill(255);
   ellipse(x-20,y-40,s/8,s/8);
   ellipse(x+20,y-40,s/8,s/8);
   fill(0);
   ellipse(x-20,y-35,s/18,s/18);
   ellipse(x+20,y-35,s/18,s/18);
   
    
 } //method used to draw object on screen.

  //move() will advance object by one frame, but ignores locations of other objects in 
  //fish tank.
  
  void move()
  {
    int temp = getX();
    
    if(x > -150)
      {
        
        x-=3;
        
        if(x > width/2)
          s = 250;
        else s = 200;
      }
    else if( x <= -150)
      {x = width+150;
      y = (int)random(height);}
    else x = temp;
    
  }

  //move(PVector []) will advance object by one frame, but has an array, locs, with
  //the location of each of the other object's locations stored as a PVector
  
  void move(PVector[] locs) { 
    move();
  }

  //accessor method returning obj's x position
  int getX()
  {
    return x;
  }

  //accessor method returning obj's y position
  
  int getY()
  {
    return y;
  }
}
