//Emily Davies-Holiday Card :)

void setup() {
  size(500,500);
  background(154,183,231);
  noLoop();
}

void draw(){
  stroke(255);
  beginShape();
  ellipse(400,425,130,130);
  ellipse(400,330,100,100);
  ellipse(400,255,75,75);
  fill(0);
  ellipse(385,245,13,13);
  fill(0);
  ellipse(415,245,13,13);
  beginShape();
  stroke(216,101,35);
  fill(216,101,35);
  vertex(385,245);
  vertex(415,245);
  vertex(400,250);
  endShape();

}
