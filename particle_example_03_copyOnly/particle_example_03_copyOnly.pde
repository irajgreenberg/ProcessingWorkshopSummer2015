

Polygon p;

void setup() {
  size(800, 580);
  background(255);

  // Polygon(int sides, PVector loc, float radius)
  p = new Polygon(5, new PVector(400, 100), 10.0);
}

void draw() {
  fill(255, 180);
  noStroke();
  rect(0, 0, width, height);

  //background(255);
  fill(255, 0, 0);

  p.move();
  p.polyRotate();
  p.display();
  p.collide();
}



