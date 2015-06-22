float x = 0.0;
float y = 0.0;
float spdX, spdY;
float w = 20, h = 20;
float gravity = .42;
float damping = .97;
float friction = .95;

Polygon p;

void setup(){
  size(800, 580);
  background(255);
  x = width/2;
  y = height/2;
  spdX = 1.75;
  spdY = -13; 
  
  // Polygon(int sides, PVector loc, float radius)
  p = new Polygon(5, new PVector(), 100.0);
  println(p);
}

void draw(){
  fill(255, 180);
  noStroke();
  rect(0, 0, width, height);
  
  //background(255);
  fill(255, 0, 0);
  
  //stroke(255, 127, 0);
  //ellipse(x, y, w, h);
 
  p.move();
  p.polyRotate();
 
  p.display();
   //rotate(frameCount*PI/180.0);
  x = x + spdX;
  spdY += gravity;
  y = y + spdY;
  
  if(x > width - w/2.0) {
    x = width - w/2.0;
    spdX = spdX * -1;
  } else
  
  if(x < w/2.0) {
    x = w/2.0;
    spdX = spdX * -1;
  }
  
  if(y > height - h/2.0) {
    y = height - h/2.0;
    spdY = spdY * -1;
    spdY *= damping;
    spdX *= friction;
  } else 
  
  if(y < h/2.0) {
    y = h/2.0;
    spdY = spdY * -1;
  }
  
  
}




