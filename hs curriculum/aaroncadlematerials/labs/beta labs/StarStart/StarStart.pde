void setup()
{
  size(800, 600);
  background(0);
}

void draw()
{
  star();
}

void star()
{
  noFill();
  stroke(0,255,0);
  strokeWeight(7);
  
  pushMatrix();
  translate(width/2,height/2);
  rotate(-PI/2);
  beginShape();
  for(float theta = 0; theta < 2 * PI; theta += 2 * PI / 5 )
  {
      float x = 100 * cos(theta);
      float y = 100 * sin(theta);
      vertex(x,y);
  }
  endShape(CLOSE);
  popMatrix();
  
}

