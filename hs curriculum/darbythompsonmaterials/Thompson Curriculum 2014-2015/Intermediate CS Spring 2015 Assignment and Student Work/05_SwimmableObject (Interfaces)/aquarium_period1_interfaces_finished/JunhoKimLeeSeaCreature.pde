class JunhoKimLeeSeaCreature extends BasicFish{

  //Ellipse variables
  int x;
  int y;
  int fwidth;
  int fheight;
  
  //Triangle variables
  int x1;
  int x2;
  int x3;
  int y1;
  int y2;
  int y3;
  
  //Eye variables
  int x4;
  int y4;
  int radius;
  
  //Speed variables
  int speedx;
  int speedy;

  JunhoKimLeeSeaCreature(){
    //ellipse
    x = 100;
    y = 250;
    fwidth = 60;
    fheight = 30;
    
    //triangle
    x1 = 100;
    y1 = 250;
    x2 = 50;
    y2 = 270;
    x3 = 50;
    y3 = 230;
    
    //eye
    radius = 3;
    x4 = 120;
    y4 = 245;
    
    //speed
    speedx=2;
    //speedy=1;
  
  }
  
  void swim(){
    x = x+speedx;
    x1 = x1+speedx;
    x2 = x2+speedx;
    x3 = x3+speedx;
    x4 = x4+speedx;
    //y = y+speedy;
    //y1 = y1+speedy;
    //y2 = y2+speedy;
    //y3 = y3+speedy;
    //y4 = y4+speedy;

    
    y=int(30*sin(.03*x)+230);
    y1=int(30*sin(.03*x)+230);
    y2=int(30*sin(.03*x)+215);
    y3=int(30*sin(.03*x)+245);
    y4=int(30*sin(.03*x)+225);
    
    
    if (x3>width+10){
      x = -50;
      y = 250;
      x1 = -50;
      y1 = 250;
      x2 = -100;
      y2 = 270;
      x3 = -100;
      y3 = 230;
      x4 = -30;
      y4 = 245;
    }
    
    
  }
  
  void display(){
    ellipseMode(CENTER);
    rectMode(CORNER);
    stroke(255,242,88);
    fill(255,242,88);
    ellipse(x,y,fwidth,fheight);
    triangle(x1,y1,x2,y2,x3,y3);
    stroke(0);
    fill(0);
    ellipse(x4,y4,radius*2,radius*2);
    
  }
  
  
}
