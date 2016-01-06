class paint {
  ArrayList<DrawableObject> shapes;
  DrawableObject l;
  DrawableObject r;
  DrawableObject c;
  DrawableObject p;
  DrawableObject e;
  int mode;
  int clear;
  int undo;
  int colormode; 
  int x;
  int y;
  int red;
  int g;
  int b;
  int radius;

  paint() {
    shapes = new ArrayList();
    x=10;
    mode=1;
    clear=0;
    undo=0;
    y=30;
    colormode=7;
    radius=50;
  }

  void keyPressed() {
    if (keyPressed) {
      if (key == 'q' || key=='Q') {
        mode=1;
      }
    }
    if (keyPressed) {
      if (key == 'w' || key=='W') {
        mode=2;
      }
    }
    if (keyPressed) {
      if (key == 'e' || key=='E') {
        mode=3;
      }
    }
    if (keyPressed && shapes.size()>0) {
      if (key == 'r' || key=='R') {
        undo=1;
      }
    }
    if (keyPressed) {
      if (key == 't' || key=='T') {
        clear=1;
      }
    }
    if (keyPressed) {
      if (key == 'y' || key=='Y') {
        mode=4;
      }
    }
    if (keyPressed) {
      if (key == 'u' || key=='U') {
        mode=5;
      }
    }
  }


  void draw() {
    stroke(red, g, b);
    fill(red, g, b);
    for (DrawableObject l: shapes) {
      l.draw();
    }
    for (DrawableObject r: shapes) {
      r.draw();
    }
    for (DrawableObject p: shapes) {
      p.draw();
    }
    for (DrawableObject e: shapes) {
      e.draw();
    }
    for (DrawableObject c: shapes) {
      c.draw();
    }
    if (clear==1) {
      shapes.clear();
      clear=0;
    }
    if (undo==1 && shapes.size()>0) {
      shapes.remove(shapes.size()-1);
      undo=0;
    }

    for (DrawableObject e: shapes) {
      e.draw();
    }

    stroke(255, 0, 0);//red
    fill(255, 0, 0);
    rect(x, y, 50, 50);
    stroke(250, 125, 0);//orange
    fill(250, 125, 0);
    rect(x, y+50, 50, 50);
    stroke(249, 250, 8);//yellow
    fill(249, 250, 8);
    rect(x, y+100, 50, 50);
    stroke(0, 255, 0);
    fill(0, 255, 0);
    rect(x, y+150, 50, 50);//green
    stroke(0, 0, 255);
    fill(0, 0, 255);
    rect(x, y+200, 50, 50);//blue
    stroke(200, 0, 200);
    fill(200, 0, 200);
    rect(x, y+250, 50, 50);//purple
    stroke(0);
    fill(0);
    rect(x, y+300, 50, 50);
    stroke(255, 0, 0);
    fill(255);


    rect(x, y+350, 50, 50); //buttons
    rect(x, y+400, 50, 50);
    rect(x, y+450, 50, 50);
    rect(x, y+500, 50, 50);
    rect(x, y+550, 50, 50);
    rect(x, y+600, 50, 50);
    rect(x, y+650, 50, 50);
    fill(255, 0, 0);
    textSize(15);
    text("Line", 20, 385+20);
    text("(Q)", 25, 400+20);
    text("Rect.", 20, 385+50+20);
    text("(W)", 25, 400+50+20);
    text("Circle", 20, 385+100+20);
    text("(E)", 25, 400+100+20);
    text("Clear", 20, 385+200+20);
    text("(T)", 25, 400+200+20);
    text("Undo", 20, 385+150+20);
    text("(R)", 25, 400+150+20);
    text("Pen", 20, 385+250+20);
    text("(Y)", 25, 400+250+20);
    text("Eraser", 15, 385+300+20);
    text("(U)", 25, 400+300+20);
    stroke(255,0,0);
    fill(255);
    rect(x,y+700,50,20);
    rect(x,y+720,50,20);
    rect(x,y+740,50,20);
    textSize(12);
    fill(255,0,0);
    text("thin", 23, 745);
    text("thick", 20, 765);
    text("thicker", 15,785);


    if (colormode==1) {
      red=255;
      g=0;
      b=0;
    }
    if (colormode==2) {
      red=250;
      b=0;
      g=125;
    }
    if (colormode==3) {
      red=249;
      g=250;
      b=8;
    }
    if (colormode==4) {
      red=0;
      b=0;
      g=255;
    }
    if (colormode==5) {
      red=0;
      b=255;
      g=0;
    }
    if (colormode==6) {
      red=200;
      b=200;
      g=0;
    }
    if (colormode==7) {
      red=0;
      b=0;
      g=0;
    }
  }


  void createShape() {

    if (mode==1 && mouseX>60) {
      shapes.add(new Line(mouseX, mouseY, red, g, b));
    }
    if (mode==2 && mouseX>60 ) {
      shapes.add(new Rectangle(mouseX, mouseY, red, g, b));
    }
    if (mode==3 && mouseX>60) {
      shapes.add(new Circle(mouseX, mouseY, red, g, b));
    }
  }

  void Buttons() {
    if ((x<=mouseX && mouseX<=60) && (y+20-20<=mouseY && mouseY<y+70-20)) {
      colormode = 1;
    }
    if ((x<=mouseX && mouseX<=60) && (y+70-20<=mouseY && mouseY<y+120-20)) {
      colormode =2;
    } 
    if ((x<=mouseX && mouseX<=60) && (y+120-20<=mouseY && mouseY<y+170-20)) {
      colormode=3;
    } 
    if ((x<=mouseX && mouseX<=60) && (y+170-20<=mouseY && mouseY<y+220-20)) {
      colormode=4;
    } 
    if ((x<=mouseX && mouseX<=60) && (y+220-20<=mouseY && mouseY<y+270-20)) {
      colormode=5;
    }
    if ((x<=mouseX && mouseX<=60) && (y+270-20<=mouseY && mouseY<y+320-20)) {
      colormode=6;
    }
    if ((x<=mouseX && mouseX<=60) && (y+320-20<=mouseY && mouseY<y+370-20)) {
      colormode=7;
    }



    if ((x<=mouseX && mouseX<=60) && (y+370-20<=mouseY && mouseY<y+420-20)) {
      mode=1;
    }
    if ((x<=mouseX && mouseX<=60) && (y+420-20<=mouseY && mouseY<y+470-20)) {
      mode=2;
    }
    if ((x<=mouseX && mouseX<=60) && (y+470-20<=mouseY && mouseY<y+520-20)) {
      mode=3;
    }
    if ((x<=mouseX && mouseX<=60) && (y+520-20<=mouseY && mouseY<y+570-20) && shapes.size()>0) {
      undo=1;
    }
    if ((x<=mouseX && mouseX<=60) && (y+570-20<=mouseY && mouseY<y+620-20)) {
      clear=1;
    }
    if ((x<=mouseX && mouseX<=60) && (y+620-20<=mouseY && mouseY<y+670-20)) {
      mode=4;
    }
    if ((x<=mouseX && mouseX<=60) && (y+670-20<=mouseY && mouseY<y+730-20)) {
      mode=5;
   
    }
     if ((x<=mouseX && mouseX<=60) && (y+730-20<=mouseY && mouseY<y+750-20)) {
      radius=10;
    
    }
     if ((x<=mouseX && mouseX<=60) && (y+750-20<=mouseY && mouseY<y+770-20)) {
      radius=30;
    }
     if ((x<=mouseX && mouseX<=60) && (y+770-20<=mouseY && mouseY<y+790-20)) {
      radius=50;
    }
  }

  void update() {
    if (mode!=4 && mode!=5 && shapes.size()>0 && mouseX>60) {
      shapes.get(shapes.size()-1).update();
    }

    if (mode==4 && mouseX>60 ) {
      shapes.add(new Pen(mouseX, mouseY, red, g, b, radius));
    }
    if (mode==5 && mouseX>60 ) {
      shapes.add(new Eraser(mouseX, mouseY, radius));
    }
  }
}

