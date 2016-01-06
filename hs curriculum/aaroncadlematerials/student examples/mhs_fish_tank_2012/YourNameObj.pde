class YourNameObj extends AnimatedObject
{
  float x;
  float y;
  float s;
  boolean goingRight;
  boolean goingUp;
  
  YourNameObj(float siize)
  {
    x= random(width);
    y= random(height);
    s= siize/15.0;
    goingRight=true;
    goingUp=true;
  }
  void display()
  {
    pushStyle();
    pushMatrix();
    translate(x,y);
    scale(s);
    smooth();
    noStroke();
    if(!goingRight)
      rotate(PI);
    if(!goingUp)
      rotate(PI);
      
    fill(0,200,0);
    ellipse(0,0,60,20);
    triangle(-25, -11, -42, -15, -22, -5);
    fill(0);  
    ellipse(15,0,10,5);
   
    popMatrix();
    popStyle();
  }
  void move()
  {
    if(goingRight)
      x=x+4;
    else
      x=x-4;
    if(goingUp)
    y--;
    else
    y++;
    if(x>width+70)
      goingRight=false;
    else if(x<-100)
      goingRight=true;
    if(y<0)
      goingUp=false;
    else if(y>height)
      goingUp=true;
  }
  void move(PVector[] allObjectsLocations) { 
      int numClose = 0;
      for(PVector p: allObjectsLocations)  //go through all PVectors calling each one p
      {
          float distance = dist(this.x, this.y, p.x, p.y); //get distance between me (this.x, this.x)
                                                           //and current PVector (p.x,p.y)
          if(distance < 250)                        //see if I am within 250 pixels of other object)
              numClose++;
      }
      if(numClose>3)
        {
          fill(0);
          if(goingRight)
          x=x+21;
          else
          x=x-21;
          if(goingUp)
          y=y-21;
          else
          y=y+21;
        }
          
      else
      {
        fill(0,200,0);
      }
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
