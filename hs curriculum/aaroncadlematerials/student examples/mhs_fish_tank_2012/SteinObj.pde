class SteinObj extends AnimatedObject 
{

  float x;
  float y;
  float s;
  boolean goingRight;
  int costume;

  
  SteinObj(float sze)
  {
      x = random(width);
      y = random(height);
      s = sze/25;
      goingRight = true;
      costume = 1;
  }
void display()
  {
      pushStyle();
      pushMatrix();
      translate(x,y);
      scale(s);
      smooth();
      noStroke();
      fill(200,20,20);
      if(!goingRight)
          //rotate(PI);
      ellipse(0,0,70,40);
      endShape();
      beginShape();
      vertex(5,-35); 
      vertex(-35,0);
      vertex(5,-15); 
      endShape();
     
     
      
      
  
      
      popMatrix();
      popStyle();
      
      
  }
  
int getX()
{
  return (int)(x);
}  
int getY()
{
  return (int)(y);
}
void move()
{
   if(goingRight)
          x = x+2;
      else
          x = x-2;
          
      if( x > width + 70)
          goingRight = false;
      else if(x < -100)
          goingRight = true;
      
}
}
