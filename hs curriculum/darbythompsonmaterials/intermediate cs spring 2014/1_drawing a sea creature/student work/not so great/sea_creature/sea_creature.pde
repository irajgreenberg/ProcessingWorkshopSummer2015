
void setup() {
  size(800,800);
}
void draw() {
}
void mouseClicked() {
  drawFish(mouseX,mouseY);
}
void drawFish(int x, int y) {
  ellipse(x,y,250,150);
  ellipse(x+170,y,100,100);
  beginShape();
  vertex(x,y-150);
  vertex(x+50,y-70);
  vertex(x-50,y-70);
  endShape();
  beginShape();
  vertex(x-110,y);
  vertex(x-200,y+80);
  vertex(x-200,y-80);
  endShape();
  beginShape();
  vertex(x,y+150);
  vertex(x+50,y+70);
  vertex(x-50,y+70);
  endShape();
}
