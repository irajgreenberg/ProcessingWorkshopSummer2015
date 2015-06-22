float x = 0.0;
float y = 0.0;
float spdX, spdY;
float w = 20, h = 120;
void setup(){
  size(800, 600);
  background(255);
  x = width/2;
  y = height/2;
  spdX = 2.75;
  spdY = 10.5; 
}

void draw(){
  //background(255);
  fill(255, 255, 0);
  noFill();
  stroke(255, 127, 0, 20);
  ellipse(x, y, w, h);
  x = x + spdX;
  y = y + spdY;
  
  if(x > width - w/2.0) {
    spdX = spdX * -1;
  } else
  
  if(x < w/2.0) {
    spdX = spdX * -1;
  }
  
  if(y > height - h/2.0) {
    spdY = spdY * -1;
  } else 
  
  if(y < h/2.0) {
    spdY = spdY * -1;
  }
  
  
}
