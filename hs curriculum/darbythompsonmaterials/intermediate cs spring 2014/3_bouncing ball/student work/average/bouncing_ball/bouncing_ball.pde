/*
Patrick Lansdale
1/28/14
Bouncing Ball Program
*/

ball b;

void setup() {
  size(800, 800);
  b = new ball();
  b.rad = 100;
  b.x = (int)random(b.rad+1, width-b.rad-1);
  b.y = (int)random(b.rad+1, height-b.rad-1);
  b.speedX = 3;
  b.speedY = 2;

  b.draw();
}

void draw() {
  background(0);
  b.move();
  b.draw();
}

