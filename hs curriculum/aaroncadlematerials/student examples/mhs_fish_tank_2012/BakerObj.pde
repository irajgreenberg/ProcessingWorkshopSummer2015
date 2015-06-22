import java.util.ArrayList;

public class BakerObj extends AnimatedObject
{
  private int x;
  private int y;
  private boolean isBottom;
  private boolean isRight;
  private int transparency;
  private boolean invisible;
  private ArrayList newLocs;
  //private boolean hasChanged;
  
  public BakerObj(int x, int y)
  {
    this.x=x;
    this.y=y;
    isBottom=true;
    isRight=true;
    transparency=255;
    invisible=false;
    //hasChanged=false;
    newLocs = new ArrayList();
  }
  
  public void display()
  {
    if(invisible)
    {
      noStroke();
    }
    else
    {
      stroke(66/2,232/2,2/2);
    }
    
    if(isRight)
    {
      fill(66,232,2,transparency);
      triangle(x-20,y-26,x-50,y-50,x+20,y-27);
      triangle(x-30,y+22,x-80,y+50,x+20,y+27);
      triangle(x-45,y,x-60,y+20,x-60,y+5);
      quad(x-46,y,x-65,y,x-100,y-20,x-60,y-5);
      fill(66,232,2,transparency);
      ellipse(x,y,90,60);
      fill(255,255,255);
      ellipse(x+18,y-7,15,15);
      fill(0,0,0);
      ellipse(x+18,y-7,6,6);
    }
    
    
    if(isRight==false)
    {
      fill(66,232,2,transparency);
      triangle(x+20,y-26,x+50,y-50,x-20,y-27);
      triangle(x+30,y+22,x+80,y+50,x-20,y+27);
      triangle(x+45,y,x+60,y+20,x+60,y+5);
      quad(x+46,y,x+65,y,x+100,y-20,x+60,y-5);
      fill(66,232,2,transparency);
      ellipse(x,y,90,60);
      fill(255,255,255);
      ellipse(x-18,y-7,15,15);
      fill(0,0,0);
      ellipse(x-18,y-7,6,6);
    }
  }
  
  public void move()
  {
    if(isRight)
    {
      x++;
      if(x==955)
      {
        isRight=false;
      }
    }
    else
    {
      x--;
      if(x==45)
      {
        isRight=true;
      }
    }
    if(isBottom)
    {
      y++;
      if(y==570)
      {
        isBottom=false;
      }
    }
    else
    {
      y--;
      if(y==30)
      {
        isBottom=true;
      }
    }
  }
  
  public void move(PVector[] locs)
  {
    for(PVector q: locs)
    {
      float newDist = dist(this.x,this.y,q.x,q.y);
      
      if((newDist<150) && (this.x!=q.x && this.y!=q.y))
      {
        newLocs.add(q);
      }
    }
    
    if(newLocs.size()==0)
    {
      if(transparency<=245)
      {
        transparency+=10;
        invisible=false;
      }
      else
      {
        transparency=255;
      }
    }
    else
    {
      for(int i=0; i<newLocs.size(); i++)
      {
        if(transparency>=10)
        {
          transparency-=10;
        }
        else
        {
          transparency=0;
          invisible=true;
        }
      }
    }
    newLocs.clear();
    
    move();
  }
  
  public int getX()
  {
    return this.x;
  }
  public int getY()
  {
    return this.y;
  }
}
