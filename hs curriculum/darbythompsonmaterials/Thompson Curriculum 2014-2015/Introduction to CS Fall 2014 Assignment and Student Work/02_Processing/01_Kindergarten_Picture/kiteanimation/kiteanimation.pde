
int xposa=600;
int ypos1a=50;
int ypos2a=150;
int xposb=575;
int yposb=100;
int xposc=625;
int yposc=100;

int speedx=2;
int speedy=3;

float swingxa=82;
float swingxb=118;

float sideswing=.5;

float sub1a=72;
float sub1b=84;
float sub2a=108;
float sub2b=120;

void setup() {
  
  size(800,500);
  
 }
  
  
  
void draw() {
  
  background(48, 139, 195);
  
  xposa=xposa+speedx;
  ypos1a=ypos1a+speedy;
  ypos2a=ypos2a+speedy;
  xposb=xposb+speedx;
  yposb=yposb+speedy;
  xposc=xposc+speedx;
  yposc=yposc+speedy;
  
  if (xposa>=700 || xposa<=500){
    speedx=-speedx;
  }
  
  if (ypos1a<=25 || ypos2a>=185){
    speedy=-speedy;
  }
  
  
  
  swingxa=swingxa+sideswing;
  swingxb=swingxb+sideswing;
  
  sub1a=sub1a+sideswing;
  sub1b=sub1b+sideswing;
  sub2a=sub2a+sideswing;
  sub2b=sub2b+sideswing;
  
  if (swingxa<=65 || swingxa>=100){
    sideswing=-sideswing;
  }
  

  
  
  
  //ground
  noStroke();
  fill(0, 205, 100);
  rect(0, 428, 800, 72);
  
  //sun
  fill(255, 255, 0);
  ellipse(0, 0, 150, 150);
  
  //swing
    //frame
    stroke(0);
    line(40, 428, 40, 320);
    line(40, 320, 160, 320);
    line(160, 428, 160, 320);
    //seat  
    noStroke();
    fill(165, 97, 86);
    triangle(sub1a, 400, sub1b, 407, sub1b, 400);
    rect(sub1b, 400, 24, 7);
    triangle(sub2a, 400, sub2a, 407, sub2b, 407);
    //ropes
    stroke(0);
    line(82, 320, swingxa, 385);
    line(118, 320, swingxb, 385);
    //left subropes
    line(swingxa, 385, sub1a, 400);
    line(swingxa, 385, sub1b, 407);
    //right subropes
    line(swingxb, 385, sub2a, 400);
    line(swingxb, 385, sub2b, 407);
    
    
   
  //head
  noStroke();
  fill(200, 0, 200);
  ellipse(300, 350, 20, 20);
  
  //body
  stroke(200, 0, 200);
  line(300, 360, 300, 395);
  
  //feet
  line(300, 395, 310, 428);
  line(300, 395, 290, 428);
  
  //arms
  line(300, 370, 330, 365);
  line(300, 370, 285, 395);
  
  //kite
  noStroke();
  fill(250, 0, 150);
  triangle(xposa, ypos1a, xposb, yposb, xposc, yposc);
  triangle(xposa, ypos2a, xposb, yposb, xposc, yposc);
   
  //kite string
  stroke(0);
  line(xposa, ypos2a, 330, 365);
  
  
 
  
  
  
  
  
  
  }
