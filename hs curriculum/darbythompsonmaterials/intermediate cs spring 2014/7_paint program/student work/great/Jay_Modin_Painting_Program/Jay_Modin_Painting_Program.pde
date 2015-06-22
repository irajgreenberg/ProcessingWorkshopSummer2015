//this is a Paint Program by Jay Modin started on March 5 2014

PaintProgram paint;

void setup() {
  size(900, 900);
  paint = new PaintProgram();
}

void draw() {
  background(255);
  paint.draw();
}

void keyPressed() {
  paint.key();
}

void mousePressed() {
  paint.MousePress();
  
}

void mouseReleased() {
  
}

void mouseDragged() {
  paint.MouseDrag();
}
