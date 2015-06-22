int speedX=5;
int xPos=400;

void setup(){
  size(800,500);
  
}



void draw(){
  xPos=xPos+speedX;
  stroke(0);
  if (xPos<=150||xPos>=650){
   speedX=-speedX;
  
  }
  
  background(0,210,255);
  fill(100,0,0);
  ellipse(xPos,200,90,50);
  fill(0,180,0);
  noStroke();
  rect(0,350,800,150);
  fill(0);
  stroke(0);
  fill(255);
  rectMode(CENTER);
  rect(xPos,200,45,5);
  
  rectMode(CORNER);
  fill(251,79,20);
  rect(60,250,40,150);
  fill(0,34,68);
  ellipse(80,250,80,80);
  noStroke();
  fill(0,210,255);
  rect(105,255,30,30);
  fill(0);
  rect(125,255,5,28);
  rect(105,255,25,5);
  rect(105,278,25,5);
  rect(105,270,25,5);
  
  fill(0,34,68);
  rect(70,305,20,40);
  fill(251,79,20);
  rect(75,310,10,30);
  fill(0,34,68);
  rect(70,322,20,5);
  
  
  stroke(0);
  fill(32,55,49);
  rect(700,250,40,150);
  fill(255,182,18);
  ellipse(720,250,80,80);
  noStroke();
  fill(0,210,255);
  rect(665,255,30,30);
  fill(0);
  rect(670,255,5,28);
  rect(670,255,25,5);
  rect(670,278,25,5);
  rect(670,270,25,5);
  
  
  fill(255,182,18);
  rect(715,305,20,40);
  fill(32,55,49);
  rect(720,310,10,30);
  fill(255,182,18);
  rect(705,305,5,40);
 
 
  stroke(0);
  line(80,300,120,300);
  line(720,300,680,300);
  if (xPos<=200){
    line(120,300,xPos-50,200);
  }
  
  if (xPos>=600){
    line(680,300,xPos+50,200);
  }
  
  if (xPos>200) {
    line(120,300,155,200);
    
  }
  
  if (xPos<600) {
    line(680,300,645,200);
  }
}
