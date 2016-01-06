class FarmerObj extends AnimatedObject
{
  float x;
  float y;
  float s;
  boolean goingRight;
  
  FarmerObj(float sze)
  {
    x = random(width);
    y = random(height);
    s = sze/30.0;
    goingRight = true;
  }
  
  void display()
  {
     pushStyle();
     pushMatrix();
     translate(x,y);
     scale(s);
     smooth();
     noStroke();
     fill(0,245,180);
     ellipse(50,25,70,25);
     beginShape();
     vertex(55,-5);
     vertex(15,25);
     vertex(55,30);
     endShape();
     if(!goingRight)
          rotate(PI);
     popMatrix();
     popStyle();
  }
  void move()
  {
    if(goingRight)
      x+=2;
    else
      x-=2;
    if(x>width+70)
      goingRight=false;
    else if(x<-100)
      goingRight=true;
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
