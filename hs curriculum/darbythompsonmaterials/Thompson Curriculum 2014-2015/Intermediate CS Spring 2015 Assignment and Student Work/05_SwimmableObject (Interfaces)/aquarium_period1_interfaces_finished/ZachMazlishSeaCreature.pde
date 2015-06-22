class ZachMazlishSeaCreature extends BasicFish {

  int bodywidth;
  int bodyheight;    
  float b;
  float f; 
  float a;
  // PVector location;
  //PVector velocity;

  ZachMazlishSeaCreature() {
    x = 350.0;
    y = 400.0;
    bodywidth = 300;
    bodyheight = 200;
    // location = new PVector(150.0,200.0);
    //velocity =  new PVector(2.0,0.0);
    speedx=5;
    b=100.0;
    f=0.1;
    a=40.0;
  }

  void display() {
    stroke(13, 37, 70);
    fill(13, 37, 70);
    rectMode(CORNER);
    line(x+bodywidth, y, x+bodywidth+30, y);
    line(x+bodywidth, y+bodyheight, x+bodywidth+30, y+bodyheight);
    rect(x, y, bodywidth, bodyheight);
    triangle(x, y, x+bodywidth, y, (x+x+bodywidth)/2, y-80);
    triangle(x, y+bodyheight, x+bodywidth, y+bodyheight, (x+x+bodywidth)/2, y+bodyheight+80);
  }
 /* void swim() {

    y = a*sin(f*x)+b;
    x = x+2;
    // velocity.y=a*sin(f*location.x)+b+velocity.y;
    // location.x=location.x+velocity.x;
    // location.y=location.y+velocity.y;
    //location.add(velocity);


    if (x>width) {
      x=-90.0;
      f=0.1;
    }
  }*/
}

