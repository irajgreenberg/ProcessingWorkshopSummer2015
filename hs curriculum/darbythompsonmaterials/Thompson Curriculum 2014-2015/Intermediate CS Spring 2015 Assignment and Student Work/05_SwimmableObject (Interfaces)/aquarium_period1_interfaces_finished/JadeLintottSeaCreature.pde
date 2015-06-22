class JadeLintottSeaCreature extends BasicFish {

  float x;
  float y;
  int size;
  float speedx;
  float speedy;
  float breathingtime;

  JadeLintottSeaCreature() {
    size = int(random(10, 30));
    x= 500;
    y= int(random(50, height));
    speedx= int(random(1, 3));
    speedy= int(random(1, 3));
  }
  void swim() {
    breathingtime=breathingtime+1;
    x=x-speedx;
    if (x<size) {
      x=width;
    }
    if (breathingtime>300) {
      y=y-speedy;
    }
    if (y<-20) {
      breathingtime=-(breathingtime-300);
    }
    if (breathingtime<0) {
      y=y+speedy ;
    }
  }


  void display() {
    stroke(0);
    ellipseMode(CENTER);
    fill(48, 173, 45);
    ellipse(x-size*2, y, size, size/1.5);
    ellipse(x-size, y-1.35*size, size/2, size*1.5);
    ellipse(x-size, y+1.35*size, size/2, size*1.5);
    ellipse(x+size, y-1.35*size, size/2, size*1.5);
    ellipse(x+size, y+1.35*size, size/2, size*1.5);
    fill(132, 66, 4);
    ellipse(x, y, size*3, size*2);
  }
}

