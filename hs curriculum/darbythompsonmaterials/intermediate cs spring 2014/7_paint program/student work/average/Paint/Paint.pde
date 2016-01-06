PaintProgram paint;

void setup() {
  size(950, 950);
  paint = new PaintProgram();
}
void draw() {
  background(255);
  paint.display();
  paint.toolbar();
}


void keyPressed() {
  paint.kpressed();
}

void mousePressed() {
  paint.mpressed();
}

void mouseReleased() {
  paint.released();
}

void mouseDragged() {
  paint.dragged();
}

