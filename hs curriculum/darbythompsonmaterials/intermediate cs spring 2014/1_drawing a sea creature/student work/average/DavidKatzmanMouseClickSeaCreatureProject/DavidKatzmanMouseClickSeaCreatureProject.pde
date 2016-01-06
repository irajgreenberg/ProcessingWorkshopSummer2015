//David Katzman Mouse Click Sea Creature Project

void setup(){
  size(800,800);
  background(0,0,255);
}

void draw(){
  
}

void mouseClicked(){
  drawUnderTheSea(mouseX,mouseY);

}

void drawUnderTheSea(int x, int y){
  fill(255, 255, 0);
  stroke(255, 255, 0);
  ellipse(x,y,50,40);
  fill(0);
  stroke(0);
  ellipse(x+8,y-4,4,4);
  fill(255,0,255);
  stroke(255,0,255);
  beginShape();
  vertex(x-25,y);
  vertex(x-40,y+15);
  vertex(x-40,y-15);
  endShape();
}


  
    
  
