
/* Nicole Profit Pd. 3 */

paint program;


void setup(){
  size(900,800);
  program = new paint();
}

void draw(){
  
  background(255);
  program.draw();
  
}
void mousePressed(){
  program.createShape();
  program.Buttons();
 
}
void mouseReleased(){
}
void mouseDragged(){
  program.update();
}
void keyPressed(){
  program.keyPressed();
}


