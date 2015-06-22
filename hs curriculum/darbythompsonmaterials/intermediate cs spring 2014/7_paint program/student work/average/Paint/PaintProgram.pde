class PaintProgram {

  ArrayList<DrawableObject> objects;
  int type=1;
  int R;
  int G;
  int B;


  PaintProgram() {
    objects = new ArrayList();
  }

  void display() {
    for (int i=0; i<objects.size(); i=i+1) {
      objects.get(i).draw();
    }
  }
  void toolbar() {
    fill(0);
    stroke(0);
    rect(0, height-30, 30, 30);
    fill(255, 0, 0);
    rect(31, height-30, 30, 30);
    fill(255, 255, 0);
    rect(62, height-30, 30, 30);
    fill(0, 255, 255);
    rect(93, height-30, 30, 30);
    fill(0, 255, 0);
    rect(124, height-30, 30, 30);
    fill(0, 0, 255);
    rect(155, height-30, 30, 30);
    fill(255, 140, 0);
    rect(186, height-30, 30, 30);
    fill(153, 50, 204);
    rect(216, height-30, 30, 30);
    text("Line: 1", width-300, height-45);
    text("Circle: 2", width-300, height-25);
    text("Square: 3", width-300, height-5);
    text("Pen: 4", width-200, height-45);
    text("Undo: z", width-200, height-25);
    text("Clear: 0", width-200, height-5);
    text("Eraser: 5", width-100, height-5);
  }

  void kpressed() {
    if (key=='1') {
      type=1;
    }
    if (key=='2') {
      type=2;
    }
    if (key=='3') {
      type=3;
    }
    if (key=='4') {
      type=4;
    }
    if (key=='5'){
      type=5;
    }
    if (key=='z') {
      objects.remove(objects.size()-1);
    }
    if (key=='0') {
      for (int i=objects.size()-1; i>=0; i--) {
        objects.remove(i);
      }
    }
  }

  void mpressed() {
    if (type==1) {
      objects.add(new Line(mouseX, mouseY, mouseX, mouseY, R, G, B));
    }
    if (type==2) {
      objects.add(new Circle(mouseX, mouseY, mouseX, mouseY, R, G, B));
    }
    if (type==3) {
      objects.add(new Square(mouseX, mouseY, mouseX, mouseY, R, G, B));
    }
    if (mouseY>height-30 && mouseX<31 && mouseX>0) {
      R=0;
      G=0;
      B=0;
    }
    if (mouseY>height-30 && mouseX<62 && mouseX>31) {
      R=255;
      G=0;
      B=0;
    }
    if (mouseY>height-30 && mouseX<93 && mouseX>62){
      R=255;
      G=255;
      B=0;
    }
    if (mouseY>height-30 && mouseX<124 && mouseX>93){
      R=0;
      G=255;
      B=255;
    }
    if (mouseY>height-30 && mouseX<155 && mouseX>124){
      R=0;
      G=255;
      B=0;
    }
    if (mouseY>height-30 && mouseX<186 && mouseX>155){
      R=0;
      G=0;
      B=255;
    }
    if (mouseY>height-30 && mouseX<217 && mouseX>186){
      R=255;
      G=140;
      B=0;
    }
    if (mouseY>height-30 && mouseX<248 && mouseX>217){
      R=153;
      G=50;
      B=204;
    }    
  }

  void released() {
  }

  void dragged() {
    if (type==4) {
      objects.add(new Pen(mouseX, mouseY, R, G, B));
    }
    if (type==5){
        objects.add(new Eraser(mouseX, mouseY));
    }
    objects.get(objects.size()-1).update();
  }
}

