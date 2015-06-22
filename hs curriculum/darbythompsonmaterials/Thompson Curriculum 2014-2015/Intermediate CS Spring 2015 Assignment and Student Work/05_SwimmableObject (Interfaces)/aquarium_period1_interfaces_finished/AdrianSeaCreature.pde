class AdrianSeaCreature extends BasicFish{
  int[] col;
  float t, f, a, b, size, vx, vy, x, y;


  AdrianSeaCreature() {
    size= random(10, 40);
    x=random(size, width-size);
    y=random(size, height-size);
    vx= random(1, 5);
    vy=random(10, 200); 
    col=new int[3];
    col[0]=(int)random(0, 255);
    col[1]=(int)random(0, 255);
    col[2]=(int)random(0, 255);
    t=0;
    f=1/vy;
    a=random(20, 200);
    b=random(a, height-a);
  }
  void swim() {
    x=vx+x;
    t++;
    y=a*sin(f*t)+b;
    if (x>width+size) {
      x=0;
    }
  }
  void display () {
    ellipseMode(CENTER);
    stroke(0);
    fill(col[0], col[1], col[2]);
    triangle(x-size/3, y, x-size/1.25, y+size/2.5, x-size/1.25, y-size/2.5);
    triangle(x-size/4, y, x-size/3, y-size/2, x+size/2.2, y-size/10);
    triangle(x+size/3, y+size/4.5, x+size/5, y+size/5, x, y+size/2.4);
    ellipse(x, y, size, size/2);    
    fill(0, 0, 0);
    ellipse(x+size/5, y-size/15, size/10, size/10);
  }
}

