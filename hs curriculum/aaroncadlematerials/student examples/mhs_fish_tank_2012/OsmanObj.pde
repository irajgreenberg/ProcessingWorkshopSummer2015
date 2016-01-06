class OsmanObj extends AnimatedObject{
  private PVector a;
  
  OsmanObj(int x, int y)
  {
   a = new PVector(x,y);
  }
  
  void display()
  {
    fill(0);
    noStroke();
    PImage c = loadImage("troll face.jpg");
    imageMode(CENTER);
    image(c,width/2,height/2); 
  }
  
  void move(PVector[] locs)
  {
    for(PVector i: locs)
      if(dist(i.x, i.y, a.x, a.y) > 0 && dist(i.x, i.y, a.x, a.y) < 200)
        exit();
  }
      
  int getX()
  {
    return (int)a.x;
  }
  
  int getY()
  {
    return (int)a.y;
  }
}
