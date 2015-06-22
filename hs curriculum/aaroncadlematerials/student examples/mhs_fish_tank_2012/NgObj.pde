class NgObj extends AnimatedObject
{
  float x;
  float y;
  float s;
  boolean goingRight;
  boolean goingUp;
  float speed;
  
  NgObj(float sze)
  {
    x = random(width);
    y = random(height);
    s = sze/30.0;
    goingRight = true;
    goingUp = true;
    speed = 0;
  }
  
  void applyGravity()
  {
    speed = speed +  .05;
  }
  
  void display()
  {
    pushMatrix();
    translate(x,y);
    fill(0);
    noStroke();
    ellipse(75,25,50,50);
    PImage a;
    a = loadImage("Mew.png");
    image(a,0,0,50,50);
    popMatrix();
   
  }
  
  void move() 
  {
    applyGravity();
    if(goingRight)    //which way to go!
          x = x+2;
      else
          x = x-2;
          
      if( x > width + 1)        // turn around if I hit edge
          goingRight = false;
      else if(x < -1)
          goingRight = true;
          
      if(goingUp)    //which way to go!
          y = y+speed;
      else
          y = y-speed;
          
      if( y > height + 1)        // turn around if I hit edge
          goingUp = false;
      else if(y < -1)
          goingUp = true;
      
  }
  
  void move(PVector[] allObjectsLocations) 
  { 
    move();
  }
  
  int getX()
  {
      return (int)x;
  }
  
  int getY()
  {
      return (int)y;
  }
}
