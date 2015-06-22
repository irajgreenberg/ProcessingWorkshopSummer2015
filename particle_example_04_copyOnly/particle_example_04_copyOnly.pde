int polyCount = 200;
Polygon[] polys = new Polygon[polyCount];

void setup() {
  size(800, 580);
  background(255);

  //Polygon(int sides, PVector loc, float radius, PVector spd, float gravity)
  for (int i=0; i<polys.length; i++) {
    polys[i] = new Polygon(int(random(3, 10)), 
    new PVector(random(width), random(10, 100)), 
    random(2, 25), new PVector(random(-1.5, 1.5), random(-1.5, 1.5)), 
    random(.05, 1.2)
      );
  }
}

void draw() {
  fill(255, 180);
  noStroke();
  rect(0, 0, width, height);

  fill(255, 0, 0);
  for (int i=0; i<polys.length; i++) {
    polys[i].move();
    polys[i].polyRotate();
    polys[i].display();
    polys[i].collide();
  }
}

