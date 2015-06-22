int ballx = 100;
int bally = 100;
int speedx = 3;
int speedy = 5;
int radius = 50;

void setup(){
  size(800,800);
}

void draw(){
  background(255);
  
  ballx = ballx+speedx;
  bally = bally+speedy;
  
  if(ballx<radius|| ballx>width-radius){
    speedx=-speedx;
  }
  if(bally<radius || bally>height-radius){
    speedy=-speedy;
  }
  
  fill(255,0,0);
  ellipse(ballx, bally, radius*2, radius*2);
  
}
