/*///////////////////////
//Sam Margolis         //
//3-20-2014            //
//Intermediate Comp Sci//
//Paint Program        //
///////////////////////*/




PaintProgram program;

void setup() {
  size(1000, 1000);
  program = new PaintProgram();
}

void draw() {
  background(255);
  
  //title
  textSize(12);
  fill(0);
  text("Paint Program by Sam Margolis", 400, 975);
  
  //instruct box
  line(100, 0, 100, 145);
  line(0, 145, 100, 145);
  
  textSize(16);
  fill(0);
  text("Instructions", 3, 20);
  line(0, 25, 100, 25);

  //Instructions
  textSize(14);
  fill(0);
  text("l: Line", 3, 45);
  text("r: Rectangle", 3, 60);
  text("e: Ellipse", 3, 75);
  text("t: Triangle", 3, 90);
  text("u: Undo", 3, 105);
  text("c: Clear", 3, 120);


  program.display();
}

void keyPressed() {
  program.action(key);
}

void mousePressed() {
  if (mouseX < 100 && mouseY < 500) {
    return;
  }
  else {
    program.createshape();
  }
}

void mouseDragged() {
  program.objectsize();
}

