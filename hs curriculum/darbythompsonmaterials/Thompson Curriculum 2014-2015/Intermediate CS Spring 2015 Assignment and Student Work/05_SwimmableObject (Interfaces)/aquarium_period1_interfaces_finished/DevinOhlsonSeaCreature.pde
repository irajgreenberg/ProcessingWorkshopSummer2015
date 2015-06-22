class DevinOhlsonSeaCreature extends BasicFish {

  int x;
  float y;
  float initialy;
  float speedy;
  float counter;
  int timer;
  int dir;
  int r;
  int g;
  int b;
  int smiley;

  DevinOhlsonSeaCreature() {
    x=-20;
    initialy=int(random(175, height-175));
    y=initialy;
    speedy=0.5;
    counter=1;
    timer=0;
    dir=0;
    r=int(random(100, 255));
    g=int(random(100, 255));
    b=int(random(100, 255));
    smiley=0;
  }

  void swim() {
    if (timer==0) {
      if (speedy>0) {
        counter=counter-0.1;
        timer=2;
      } else {
        counter=counter+0.101; 
        timer=2;
      }
    }    
    timer=timer-1;    
    speedy=speedy+counter;
    y=y+speedy/2;
    if (dir<=2) {
      x=x+3;
    } else {
      x=x-3;
    }

    if (x>width+80 || x<-80) {
      dir=int(random(0, 4));
      if (dir<=2) {
        x=-10;
      } else {
        x=width+10;
      }
      smiley=int(random(0, 1000));
      speedy=random(-10, 10);
      y=int(random(100, height-100)); 
      initialy=y;
      r=int(random(100, 255));
      g=int(random(100, 255));
      b=int(random(100, 255));
    }
  }

  void display() {
    ellipseMode(CENTER);
    fill(r, g, b);
    stroke(r-50, g-50, b-50);
    if(smiley==1){
      ellipse(x, y, 100, 100);
      fill(0);
      ellipse(x-40, y-15, 10, 10);
      ellipse(x+40, y-15, 10, 10);
      arc(x, y, 35, 35, 0, PI);
    }
    else{
      if (dir<=2) {
      triangle(x-20, y, x-40, y+10, x-40, y-10);
      triangle(x-13, y-10, x+10, y-10, x-13, y-22);
      ellipse(x, y, 50, 25);
      fill(0, 0, 0);
      ellipse(x+14, y-6, 5, 5);
      }
      else {
      triangle(x+20, y, x+40, y+10, x+40, y-10);
      triangle(x+13, y-10, x-10, y-10, x+14, y-22);
      ellipse(x, y, 50, 25);
      fill(0, 0, 0);
      ellipse(x-14, y-6, 5, 5);
      }
    }
  }
}

