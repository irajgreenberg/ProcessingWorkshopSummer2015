//Jack Hannah
//Fish Sketch Program

void setup(){
  size(800,800);
  background(41,174,224);
}

void draw(){
}

void mouseClicked(){
  drawFish(mouseX, mouseY);
}

void drawFish(int x, int y){
  fill(224,41,206);
  stroke(224,41,206);
  beginShape();
  vertex(x,y);
  vertex(x+20,y);
  vertex(x+5,y-30);
  endShape();
  fill(233, 240, 51);
  stroke(233, 240, 51);
  ellipse(x,y,85,40);
  beginShape();
  vertex(x,y);
  vertex(x-70,y+20);
  vertex(x-70,y-20);
  endShape();
  fill(224,111,41);
  stroke(0);
  ellipse(x+25,y-10,5,5);
  fill(0);
  stroke(0);
  line(x+20,y,x+42,y);
  line(x-70,y-10,x-40,y-5);
  line(x-70,y,x-40,y);
  line(x-70,y+10,x-40,y+5);
  fill(240);
  beginShape();
  vertex(x+35,y);
  vertex(x+37,y+7);
  vertex(x+40,y);
  endShape();
  beginShape();
  vertex(x+30,y);
  vertex(x+32,y+7);
  vertex(x+35,y);
  endShape();
  beginShape();
  vertex(x+25,y);
  vertex(x+27,y+7);
  vertex(x+30,y);
  endShape();
  line(x,y-3,x,y+3);
  line(x+3,y-3,x+3,y+3);
  line(x+6,y-3,x+6,y+3);
}
