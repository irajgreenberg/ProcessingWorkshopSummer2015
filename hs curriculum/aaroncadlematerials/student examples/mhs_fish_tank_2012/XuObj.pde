class XuObj extends AnimatedObject
{
  float x;
  float y;
  float s;
  boolean goingRight;
  boolean goingUp;
  
  XuObj(float s)
  {
    x = random(width);
    y = random(height);
    s = s/50.0;
    goingRight = true;
    goingUp = true;
  }
  
  void display()
  {
    PImage b;
    b = loadImage("pokemon.png");
    
    pushStyle();
    pushMatrix();
    ellipseMode(CENTER);
    smooth();
    noStroke();
    fill(255);
    arc(x,y,30,30,0,PI);
    fill(255,0,0);
    arc(x,y,30,30,PI,TWO_PI);
    fill(0);
    ellipse(x,y,10,10);
    fill(0);
    strokeWeight(10);
    fill(255);
    ellipse(x,y,8,8);
    
    float m = millis();
    if(m>5000)
    {
      noTint();
      image(b,x-55,y-55,150,150);
    }

    popMatrix();
    popStyle();
  }
  
  void move()
  {
    float m = millis();
    if(m>5500)
    {
      if(goingRight)
        x = x+3.5;
      else
        x = x-3.5;
        
      if( x>width+50)
        goingRight = false;
      else if(x< -80)
        goingRight = true;
    }
    
        if(m>5500)
    {
      if(goingUp)
        y = y+3.5;
      else
        y = y-3.5;
        
      if(y >height+50)
        goingUp = false;
      else if(y< -80)
        goingUp = true;
    }
    
    
    
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
