class ElansariObj extends AnimatedObject
{
  PVector v1;
  PVector horsea;
  float swimX, swimY;
  float wingRot;
  float wingSpd;
  float speedX;
  float speedY;
  float x, y;
  float startX;
  color bodycolor;
  color strokeColor;
  
  
  
   ElansariObj(int tempx, int tempy, float tempsize)
   {
    x=tempx;
    y=tempy;
    v1 = new PVector(width/2, height/2);
    bodycolor = color(252, 3, 40);
    strokeColor = color(79, 7, 162);
    swimX =.90;
    swimY =.25; 
    speedX = 10.0;
    speedY = 1;
    wingSpd = speedY;
  }
    
    
 void display()
 {
    pushMatrix();
    translate(swimX, swimY);
     
    smooth();
 
    strokeWeight(4);
    smooth();
    stroke(strokeColor);
    fill(bodycolor);
    rect(v1.x, v1.y, 60, 20);
    ellipse(v1.x, v1.y, 75, 75);
    noStroke();
    fill(255);
    ellipse(v1.x+20, v1.y, 30, 40);
    fill(255, 0, 0);
    ellipse(v1.x+25, v1.y, 20, 30);
    fill(0);
    ellipse(v1.x+30, v1.y, 10, 20);
    fill(0);
    noStroke();
    ellipse(v1.x+60, v1.y+10, 10, 15);
    //horsea's head fins
    fill(bodycolor);
    stroke(strokeColor);
    pushMatrix();
    translate(v1.x-500, v1.y-55);
    rotate(radians(330));
    arc(v1.x, v1.y, 142, 14, 1.876, 4.421);
    popMatrix();
    arc(v1.x, v1.y, 142, 14, 1.876, 4.421);
    pushMatrix();
    translate(200, -165);
    rotate(radians(30));
    arc(v1.x, v1.y, 142, 14, 1.876, 4.421);
    popMatrix();
    //body
    bezier(v1.x-10, v1.y+40, v1.x, v1.y+200, v1.x+90, v1.y+65, v1.x+10, v1.y+40);
    //wing
    translate(v1.x+15, v1.y+120);
    strokeWeight(2);
    beginShape();
    for (int i=0;i<20;i++) 
    {
      curveVertex((i*2)*sin(i/-2.0), (i*2)*cos(i/-2.0));
    }
    endShape();
    wing(50, -50);
    popMatrix();
     
    stroke(0); 
    
 
  }
   
   
  void wing(float x, float y) 
  {
    pushMatrix();
    translate(x, y);
     wingRot += wingSpd;
    if (wingRot>5) 
    {
      wingRot = 5;
      wingSpd *=-1;
    }
    else if (wingRot < -5) 
    {
      wingRot = -5;
      wingSpd *=-1;
    }
    rotate(radians(wingRot));
    fill(19, 115, 229);
    noStroke();
    arc(-60, 0, 100, 60, 3*PI/4, 5*PI/4);
    popMatrix();
  }
 
  
   
 
 
void move(PVector[] locs)
{ 

    swimX += speedX;
    if(swimX > width)
    {
      swimX *= -1;
    }
    else if (swimX < -width)
    {
      swimX *= -1;  
      
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



  

