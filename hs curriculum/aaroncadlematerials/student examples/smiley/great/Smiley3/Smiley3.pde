

void setup()
{
  size(1366, 720);
  background(21, 90, 28);
  noStroke();
}

void draw()
{
  println(mouseX+" "+mouseY);
  fill(23, 136, 175);
  rect(0, 0, width, 400);
  noStroke();

  fill(104, 23, 175);
  ellipse(781, 360, 350, 350);
  noStroke();

  fill(217, 234, 31);
  ellipse(25, 25, 200, 200);
  noStroke();

  fill(255);
  ellipse(723, 287, 40, 50);
  noStroke();

  fill(255);
  ellipse(820, 287, 40, 50);
  noStroke();

  fill(0);
  ellipse(723, 295, 30, 35);
  noStroke();

  fill(0);
  ellipse(820, 295, 30, 35);
  noStroke();

  fill(0);
  ellipse(772, 408, 150, 115);
  noStroke();

  fill(104, 23, 175);
  ellipse(772, 369, 150, 115);
  noStroke();

  fill(0);
  beginShape();
  vertex(778, 333);
  vertex(761, 361);
  vertex(778, 360);
  endShape(CLOSE);
  noStroke();

  fill(217, 234, 31, 150);
  ellipse(25, 25, 225, 225);
  noStroke();

  fill(217, 234, 31, 100);
  ellipse(25, 25, 250, 250);
  noStroke();

  fill(211, 94, 184);
  noSmooth();
  stroke(178,38,145);
  strokeWeight(3);
  ellipse(675, 375, 25, 25);
  ellipse(860, 375, 25, 25);
  
  fill(255);
  smooth();
  noStroke();
  ellipse(422, 62, 100, 100);
  ellipse(460,112,100,100);
  ellipse(376,128,100,100);
  
  fill(0);
  stroke(0);
  strokeWeight(4);
  arc(719,248,15,15,PI,2*PI);
  arc(817,248,15,15,PI,2*PI);
  noStroke();
  
  fill(255);
  noStroke();
  rectMode(CENTER);
  rect(769,437,14,18);
}

