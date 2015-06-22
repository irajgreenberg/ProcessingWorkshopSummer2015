class SolomonFaisonSeaCreature extends BasicFish{
  //properties
  int fill;
  float sharkx;
  float  sharky;
  int speedx;
  int speedy;
  int tailSpeed;//inversed
  float taily;
  boolean revdirect;
  int finPower; //proportional to speedx
  int z;
  float t;
  float amplitude;


  //ability
  SolomonFaisonSeaCreature() {
    t=0.0;
    amplitude=2;
    fill=int(random(#1203FF, #03E8FF));
    sharkx=400;
    sharky=400;
    speedx=int(random(2, 10));
    speedy=1;
    tailSpeed=42/speedx;
    z=0;
    finPower=5;
    taily=sharky+finPower;
  }
  void display() {
    rectMode(CORNER);
    ellipseMode(CENTER);
   noStroke();;
    fill(fill);
    if (revdirect==false) {
      ellipse(sharkx+5, sharky, 120, 22);
      triangle(sharkx+18, sharky-11, sharkx-5, sharky-11, sharkx-4, sharky-30);//dorsal fins
      curve(sharkx-10, sharky-30, sharkx-4, sharky-30, sharkx+18, sharky-11, sharkx-10, sharky-10);
      triangle(sharkx-40, sharky-6, sharkx-30, sharky-6, sharkx-39, sharky-11);
      triangle(sharkx-40, sharky+7, sharkx-40, sharky-7, sharkx-75, taily);//tail
      triangle(sharkx-63, taily, sharkx-92, taily-30, sharkx-77, taily);
      triangle(sharkx-63, taily, sharkx-80, taily+15, sharkx-77, taily);
      triangle(sharkx-50, sharky+6, sharkx-40, sharky+6, sharkx-50, sharky+10);//bottom fins
      triangle(sharkx-25, sharky+9, sharkx-15, sharky+9, sharkx-24, sharky+15);
      triangle(sharkx+35, sharky+6, sharkx+15, sharky+6, sharkx+5, sharky+20);//swimming fin
      curve(sharkx, sharky+6, sharkx+34, sharky+6, sharkx+4, sharky+20, sharkx, sharky-30);
    } 
    if (revdirect==true) {
      ellipse(sharkx-5, sharky, 120, 22);
      triangle(sharkx-18, sharky-11, sharkx+5, sharky-11, sharkx+4, sharky-30);//dorsal fins
      curve(sharkx+10, sharky-30, sharkx+4, sharky-30, sharkx-18, sharky-11, sharkx+10, sharky-10);
      triangle(sharkx+40, sharky-6, sharkx+30, sharky-6, sharkx+39, sharky-11);
      triangle(sharkx+40, sharky+7, sharkx+40, sharky-7, sharkx+75, taily);//tail
      triangle(sharkx+63, taily, sharkx+92, taily-30, sharkx+77, taily);
      triangle(sharkx+63, taily, sharkx+80, taily+15, sharkx+77, taily);
      triangle(sharkx+50, sharky+6, sharkx+40, sharky+6, sharkx+50, sharky+10);//bottom fins
      triangle(sharkx+25, sharky+9, sharkx+15, sharky+9, 24, sharky+15);
      triangle(sharkx-35, sharky+6, sharkx-15, sharky+6, sharkx-5, sharky+20);//swimming fin
      curve(sharkx, sharky+6, sharkx-34, sharky+6, sharkx-4, sharky+20, sharkx, sharky-30);
    }
  }
  void move() {
    t=t+0.1;
    sharkx=sharkx+speedx;
    sharky=sharky+speedy;
    sharky=amplitude*sin(t)+sharky;
    //taily=sharky+finPower;
    if (sharkx-60>width || sharkx+80<0) {
      speedx=-speedx;
      fill=int(random(#3003FF, #B2C6FF));
    } else if (sharky-20>height || sharky+30<0) {
      speedy=-speedy;
      fill=int(random(#3003FF, #B2C6FF));
    }
    if (speedx<0) {
      revdirect=true;
    } else {
      revdirect=false;
    }
  }
  void swim() {
    z++;
    if (z==tailSpeed) {
      finPower=-finPower;
    }
    if (z>tailSpeed*2) {
      z=0;
    }
    move();
    taily=sharky+finPower;
  }
}

