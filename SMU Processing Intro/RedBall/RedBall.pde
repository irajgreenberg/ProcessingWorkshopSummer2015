int x, y;

void setup() {
  size(400, 400);
  smooth();
  
  x = 0;
  y = height/2;
  frameRate(100);
}

void draw() {
  background(255);
  fill(255, 0, 0);
  stroke(255, 0, 0);
  ellipse(x, y, 50, 50);
  x++;
}

