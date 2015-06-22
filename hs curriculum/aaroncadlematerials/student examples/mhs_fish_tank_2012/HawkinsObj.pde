public class HawkinsObj extends AnimatedObject
{
  //PIVs?  
  private int x;
  private int y;
  private int r;
  private int g;
  private int b;
  private color c;
  private int xChange;
  private int yChange;
  private int body;
  private boolean balls;
  
  //Constructors??
  
  public HawkinsObj()
  {
    x = (int)(random(0,width));
    y = height - SAND_HEIGHT;
    //y = (int)(random(0,height));
    
    xChange = 0;
    yChange = 0;
    
    body = 80;
    
    r = (int)(random(0,255));
    g = (int)(random(0,255));
    b = (int)(random(0,255));
    c = color(r,g,b);
    
    balls = true;
  }

  public void display() //method used to draw object on screen.
  {
    pushStyle();
    fill(c);
    stroke(color(255-r,255-g,255-b));
    strokeWeight(body/25);
    
    //body
    ellipse(x,y,body,body-10);
    
    
    //arms
    strokeWeight(body/10);
    line(x+(body/2),y,x+(body/2)+(body/4),y-((body-10)/4));
    line(x-(body/2),y,x-(body/2)-(body/4),y-((body-10)/4));
    
    //legs
    strokeWeight(body/15);
    line(x+(body/6),y+(body-10)/2,x+(body/6)+body/20,y+(body-10)/2+(body-10)/6);
    line(x+(body/3),y+(body-20)/2,x+(body/3)+body/20,y+(body-10)/2+(body-10)/6);
    line(x+(body/4),y+(body-15)/2,x+(body/4)+body/20,y+(body-10)/2+(body-10)/6);
    line(x-(body/3),y+(body-20)/2,x-(body/3)-body/20,y+(body-10)/2+(body-10)/6);
    line(x-(body/4),y+(body-15)/2,x-(body/4)-body/20,y+(body-10)/2+(body-10)/6);
    line(x-(body/6),y+(body-10)/2,x-(body/6)-body/20,y+(body-10)/2+(body-10)/6);
    
    //claws
    strokeWeight(body/60);
    ellipse(x+(body/2)+(body/4)+5, y-((body-10)/4)-5, 30,30);
    ellipse(x-(body/2)-(body/4)-5,y-((body-10)/4)-5, 30,30);
    beginShape();
    vertex(x+(body/2)+(body/4)+15, y-((body-10)/4)-15);
    vertex(x+(body/2)+(body/4)+10, y-((body-10)/4)-7);
    vertex(x+(body/2)+(body/4)+5, y-((body-10)/4)-9);
    vertex(x+(body/2)+(body/4)-2, y-((body-10)/4));
    endShape();
    
    beginShape();
    vertex(x-(body/2)-(body/4)-15, y-((body-10)/4)-15);
    vertex(x-(body/2)-(body/4)-10, y-((body-10)/4)-7);
    vertex(x-(body/2)-(body/4)-5, y-((body-10)/4)-9);
    vertex(x-(body/2)-(body/4)+2, y-((body-10)/4));
    endShape();
    
    //eyeballs
    fill(255);
    stroke(0);
    strokeWeight(1);
    ellipse(x-15,y-5,25,25);
    ellipse(x+15,y-5,25,25);
    fill(0);
    if(balls)
    {
      ellipse(x+20,y-10,5,5);
      ellipse(x-10,y-10,5,5);
    }
    else
    {
      ellipse(x+10,y-10,5,5);
      ellipse(x-20,y-10,5,5);
    }
    
    
    popStyle();
  }

  //move() will advance object by one frame, but ignores locations of other objects in 
  //fish tank.
  
  public void move()
  {
    int way = (int)(random(0,2));
    int num = (int)(random(1,6));
    
    for(int i = 0; i < num; i++)
    {
    xChange = (int)(random(0,5));
    if(way == 0)
    {
      x+=xChange;
      balls = true;
    }
    if(way == 1)
    {
      x-=xChange;
      balls = false;
    }
    if(x>=width)
      x=0;
    if(x<0)
      x=width;
    }
      
    //yChange = (int)(random(-5,20));
   // y+=yChange;
    if(y>=width)
      y=0;
  }

  //move(PVector []) will advance object by one frame, but has an array, locs, with
  //the location of each of the other object's locations stored as a PVector
  
  public void move(PVector[] locs)
  { 
    move();
    
    
    int numClose = 0;
      for(PVector p: locs) 
      {
          float distance = dist(this.x, this.y, p.x, p.y); 
                                     
          if(distance < 250)                     
              numClose++;
      }
      
      if(numClose > 2)
      {
            r = (int)(random(0,255));
            g = (int)(random(0,255));
            b = (int)(random(0,255));
            c = color(r,g,b);
      }
  }

  //accessor method returning obj's x position
  public int getX()
  {
    return x;
  }

  //accessor method returning obj's y position
  
  public int getY()
  {
    return y;
  }
}

