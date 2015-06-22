class NguyenL_ghoti2 extends AnimatedObject
{
  float x,y,z,msElapsed;
  
  NguyenL_ghoti2(float dx,float dy)
  {
    x=dx;y=dy;msElapsed=0;
    z=random(0,2*PI);
  }
  
  void display()
  {
    ellipseMode(CENTER);
    stroke(255);
    fill(255);
    ellipse(x,y,100,100);
  }
  
  void move(float dx,float dy)
  {
    msElapsed+=100;
    z+=sqrt(pow(dx,2)+pow(dy,2));
//    if(msElapsed%400==0)
//    {
      for(float i=0;i<2*PI;i+=2*PI/3)
      {
        float z1=z-.5+i;
        float z2=z-.2+i;
        float z3=z+.2+i;
        float z4=z+.5+i;
        float z5=z+i;
        msElapsed=0;
        stroke(255);fill(180,205,255);
        beginShape();
        vertex(x,y);
        vertex(x+5*cos(z1),y+5*sin(z1));
        vertex(x+10*cos(z2),y+10*sin(z2));
        vertex(x+15*cos(z1),y+15*sin(z1));
        vertex(x+20*cos(z2),y+20*sin(z2));
        vertex(x+25*cos(z1),y+25*sin(z1));
        vertex(x+30*cos(z2),y+30*sin(z2));
        vertex(x+35*cos(z1),y+35*sin(z1));
        vertex(x+40*cos(z2),y+40*sin(z2));
        vertex(x+45*cos(z1),y+45*sin(z1));
        vertex(x+50*cos(z5),y+50*sin(z5));
        vertex(x+45*cos(z4),y+45*sin(z4));
        vertex(x+40*cos(z3),y+40*sin(z3));
        vertex(x+35*cos(z4),y+35*sin(z4));
        vertex(x+30*cos(z3),y+30*sin(z3));
        vertex(x+25*cos(z4),y+25*sin(z4));
        vertex(x+20*cos(z3),y+20*sin(z3));
        vertex(x+15*cos(z4),y+15*sin(z4));
        vertex(x+10*cos(z3),y+10*sin(z3));
        vertex(x+5*cos(z4),y+5*sin(z4));
        endShape();
      }
//    }
  }
  
  int getX() {return (int)x;}
  int getY() {return (int)y;}
  void setX(float dx) {x=dx;}
  void setY(float dy) {y=dy;}
}
