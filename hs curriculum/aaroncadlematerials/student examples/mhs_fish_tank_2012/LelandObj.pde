class LelandObj extends AnimatedObject
{
  //PIVs
  private float x;
  private float y;
  private float xSpeed;
  private float ySpeed;
  private int flipCount;
  private int time;
  private float freezeDist;
  private boolean freeze;
  private float life;
  private float s;
  
  //Constructors
  public LelandObj(float sze)
  {
    time = 0;
    x = (int)(random(0,width));
    y = (int)(random(0,height-SAND_HEIGHT));
    xSpeed = random(2,4);
    ySpeed = random(1,2);
    flipCount =0;
    freezeDist = -1;
    freeze = true;
    life = random(300,1000);
    s = (sze)/40;
  }

  //method used to draw object on screen.
  void display()
  {
    pushStyle();
    pushMatrix();
    smooth();
    translate(x,y);
    if(time>life)
    {
      if(freeze == true)
      {
        freezeDist = y;
        freeze = false;
      }
      float turnAmt = 180.0/freezeDist;
      rotate(radians((freezeDist-y)*turnAmt));
    }
    stroke(0);
    if(xSpeed>0)
    {
      drawFin(-1,1,s);
      drawFin(-1,-1,s);
      drawTail(-1,s);
      drawBody(s);
      drawEye(-1,s);
    }
    else
    {
      drawFin(1,1,s);
      drawFin(1,-1,s);
      drawTail(1,s);
      drawBody(s);
      drawEye(1,s);
    }
    popMatrix();
    popStyle();
  }
  
  void drawBody(float sze)
  {
    if(time<=life)
      fill(255,240,100);
    else if(time>life && time<life+100)
      fill(255,240,round(100+((time-life)/1.5)));
    else
      fill(255,240,175);
    ellipse(0,0,100*sze,60*sze);
  }
  
  void drawEye(int h, float sze)
  {
    if(time<life)
    {
        fill(255);
        ellipse(-(35*h)*sze,-5*sze,15*sze,15*sze);
        fill(0);
        ellipse(-(37*h)*sze,-5*sze,5*sze,5*sze);
    }
    else
    {
      stroke(150);
      line(-(40*h)*sze,-10*sze,-(30*h)*sze,0);
      line(-(40*h)*sze,0,-(30*h)*sze,-10*sze);
      stroke(0);
    }
  }
  
  //h and v must be either -1 or 1
  void drawFin(int h, int v, float sze)
  {
    if(time<=life)
      fill(255,150,100);
    else if(time>life && time<life+100)
      fill(255,round(150+((time-life)/1.5)),round(100+((time-life)/1.5)));
    else
      fill(255,225,175);
    beginShape();
    curveVertex(-(25*h)*sze,-(20*v)*sze);//start
    curveVertex(-(25*h)*sze,-(20*v)*sze);
    curveVertex(-(15*h)*sze,-(35*v)*sze);
    curveVertex(0,-(48*v)*sze);
    curveVertex((15*h)*sze,-(55*v)*sze);
    curveVertex((30*h)*sze,-(55*v)*sze);
    curveVertex((10*h)*sze,-(25*v)*sze);
    curveVertex((10*h)*sze,-(25*v)*sze);//end
    endShape();
  }
  
  //h must be either -1 or 1
  void drawTail(int h, float sze)
  {
    if(time<=life)
      fill(255,150,100);
    else if(time>life && time<life+100)
      fill(255,round(150+((time-life)/1.5)),round(100+((time-life)/1.5)));
    else
      fill(255,225,175);
    beginShape();
    curveVertex((40*h)*sze,-15*sze);//start
    curveVertex((40*h)*sze,-15*sze);
    curveVertex((45*h)*sze,-10*sze);
    curveVertex((50*h)*sze,-15*sze);
    curveVertex((55*h)*sze,-35*sze);
    curveVertex((65*h)*sze,-50*sze);
    curveVertex((80*h)*sze,-60*sze);
    curveVertex((75*h)*sze,-30*sze);
    curveVertex((70*h)*sze,-15*sze);
    curveVertex((65*h)*sze,-2*sze);
    curveVertex((65*h)*sze,2*sze);
    curveVertex((70*h)*sze,15*sze);
    curveVertex((75*h)*sze,30*sze);
    curveVertex((80*h)*sze,60*sze);
    curveVertex((65*h)*sze,50*sze);
    curveVertex((55*h)*sze,35*sze);
    curveVertex((50*h)*sze,15*sze);
    curveVertex((45*h)*sze,10*sze);
    curveVertex((40*h)*sze,15*sze);
    curveVertex((40*h)*sze,15*sze);//end
    endShape();
  }

  //move() will advance object by one frame, but ignores locations of other objects in fish tank.
  void move()
  {
    if(x<=0)
    {
      x=0;
      xSpeed = abs(xSpeed);
    }
    if(x>=width)
    {
      x=width;
      xSpeed = -abs(xSpeed);
    }
    
    x+=xSpeed;
    y+=ySpeed;
    
    if(y>=height-SAND_HEIGHT || y<=0)
      ySpeed = -ySpeed;
      
    if(time>life)
    {
      if(y>0)
      {
         xSpeed/=abs(xSpeed);
         ySpeed=-abs(ySpeed);
      }
      else
      {
        ySpeed = 0;
        xSpeed/=abs(xSpeed);
      }
    }
    time++;
    //println(x + "," + y);
  }

  //move(PVector []) will advance object by one frame, but has an array, locs, with the location of each of the other object's locations stored as a PVector
  void move(PVector[] locs)
  {
    for(PVector p : locs)
    {
      //if(((abs(locs[i].x - x) < 90) && (locs[i].x != x)) && ((abs(locs[i].y - y) < 90) && (locs[i].y != y)))
      if(dist(p.x,p.y,x,y)<100*s && dist(p.x,p.y,x,y)>1 && flipCount==0)
      {
        xSpeed=-xSpeed;
        if(random(0,1) == 0)
          ySpeed = -ySpeed;
        else
          ySpeed = ySpeed;
          x+=xSpeed;
          y+=ySpeed;
          flipCount++;
      }
    }
    
    int fail =0;
    for(PVector p : locs)
    {
      if(dist(p.x,p.y,x,y)<100*s && dist(p.x,p.y,x,y)>1)
      {
        fail = 1;
      }
    }
    if(fail==0)
      flipCount=0;
    move();
  }

  //accessor method returning obj's x position
  int getX()
  {
    return round(x);
  }

  //accessor method returning obj's y position
  int getY()
  {
    return round(y);
  }
}
