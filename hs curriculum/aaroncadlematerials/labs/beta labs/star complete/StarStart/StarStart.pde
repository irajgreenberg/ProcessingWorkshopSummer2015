void setup()
{
  size(800, 600);
  background(0);
}

void draw()
{
//  star(200,300,5,100,50);
//  star(500,300,5,100,60);
sprocket(200,100,5,100,60, 60);
//sprocket(400,300,5,100,100, 60);
sprocket(400,300,6,200,100, 50);
}

void star(float x, float y, int side, float out, float in)
{
  noFill();
  stroke(0,255,0);
  strokeWeight(7);
  
  pushMatrix();
  translate(x,y);
  rotate(-PI/2);
  float gap = 2 * PI / side;
  beginShape();
  for(float theta = 0; theta < 2 * PI; theta += gap )
  {
      float pX = out * cos(theta);
      float pY = out * sin(theta);
      vertex(pX,pY);
      
      float pX2 = in * cos(theta + gap/2);
      float pY2 = in * sin(theta + gap/2);
      vertex(pX2,pY2);
  }
  endShape(CLOSE);
  popMatrix();
  
}

void sprocket(float x, float y, int side, float one, float two, float three)
{
  noFill();
  stroke(0,255,0);
  strokeWeight(7);
  
  pushMatrix();
  translate(x,y);
  rotate(-PI/2);
  float gap = 2 * PI / side;
  beginShape();
  for(float theta = 0; theta < 2 * PI; theta += gap )
  {
      float pX = one * cos(theta);
      float pY = one * sin(theta);
      vertex(pX,pY);
      
      float pX2 = two * cos(theta + gap/3);
      float pY2 = two * sin(theta + gap/3);
      vertex(pX2,pY2);
      
      float pX3 = three * cos(theta + 2 * gap/3);
      float pY3 = three * sin(theta + 2 * gap/3);
      vertex(pX3,pY3);
  }
  endShape(CLOSE);
  popMatrix();
  
}
