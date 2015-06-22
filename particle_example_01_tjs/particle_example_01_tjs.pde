float x = 0.0;
float y = 0.0;
float spdX, spdY;
float w = 20, h = 20;
void setup(){
  size(600, 400);
  background(255);
  spdX = .75;
  spdY = 1.5; 
}

void draw(){
  background(255);
  fill(255, 255, 0);
  stroke(255, 127, 0);
  ellipse(x, y, w, h);
  x = x + spdX;
  y = y + spdY;
}
