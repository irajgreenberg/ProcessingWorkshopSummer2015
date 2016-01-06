class PaintProgram {
  ArrayList<DrawableObject> d;
  int selection=0;
  int r;
  int g;
  int b;
  ArrayList<DrawableObject> deleted;
  PaintProgram() {
    d = new ArrayList();
    r=0;
    g=0;
    b=0;
    deleted = new ArrayList();
  }

  void draw() {

    for (DrawableObject e: d) {
      e.display();
    }
    SecondFormat();
  }
  void MousePress() {
    if (selection==1) {
      d.add(new Rectangle(mouseX, mouseY, r, g, b));
    }
    if (selection==2) {
      d.add(new Line(mouseX, mouseY, r, g, b));
    }
    if (selection==3) {
      d.add(new Ellipse(mouseX, mouseY, r, g, b));
    }
    if (mouseY>.9*height && mouseY<.95*height) {
      if (mouseX>.05*width && mouseX<.1*width) {
        r=0;
        g=0;
        b=0;
      }

      if (mouseX>.1*width && mouseX<.15*width) {
        r=255;
        g=0;
        b=0;
      }
      if (mouseX>.15*width && mouseX<.2*width) {
        r=209;
        g=92;
        b=89;
      }
      if (mouseX>.2*width && mouseX<.25*width) {
        r=226;
        g=105;
        b=89;
      }
      if (mouseX>.25*width && mouseX<.3*width) {
        r=239;
        g=206;
        b=16;
      }
      if (mouseX>.3*width && mouseX<.35*width) {
        r=172;
        g=214;
        b=42;
      }
      if (mouseX>.35*width && mouseX<.4*width) {
        r=0;
        g=255;
        b=0;
      }
      if (mouseX>.4*width && mouseX<.45*width) {
        r=32;
        g=178;
        b=170;
      }
      if (mouseX>.45*width && mouseX<.5*width) {
        r=0;
        g=0;
        b=255;
      }
      if (mouseX>.5*width && mouseX<.55*width) {
        r=31;
        g=29;
        b=109;
      }
      if (mouseX>.55*width && mouseX<.6*width) {
        r=166;
        g=53;
        b=112;
      }
      if (mouseX>.6*width && mouseX<.65*width) {
        r=188;
        g=113;
        b=137;
      }
      if (mouseX>.65*width && mouseX<.7*width) {
        r=255;
        g=255;
        b=255;
      }
    }
  }

  void MouseDrag() {
    if (d.size()>0) {
      DrawableObject s=d.get(d.size()-1);
      s.update();
    }
  }
  void key() {
    if (key=='1') {
      selection=1;
    }
    if (key=='2') {
      selection=2;
    }
    if (key=='3') {
      selection=3;
    }
    if (key=='z' && d.size()>0) {
      deleted.add(d.get(d.size()-1));
      d.remove(d.size()-1);
    }
    if (key=='y' && deleted.size()>0) {
      d.add(deleted.get(deleted.size()-1));
      deleted.remove(deleted.size()-1);
    }
    if (key=='c' && d.size()>0) {
      for (int i=d.size()-1; i>=0; i--) {
        d.remove(i);
      }
    }
  }

 void SecondFormat() {

    fill(57, 255, 20);
    stroke(57, 255, 20);
    rect(0, 0, width, height*.1);

    fill(57, 255, 20);
    rect(0, 0, width*.05, height);

    rect(0, height*.8, width, height*.201);

    rect(width*.95, 0, width*.05, height);


    fill(0, 0, 0);
    stroke(0);
    rect(.05*width, .9*height, width*.05, height*.05);

    fill(255, 0, 0);   //255 0 0
    stroke(0);
    rect(.1*width, .9*height, width*.05, height*.05);

    fill(209, 92, 89);   //209  92  89
    stroke(0);
    rect(.15*width, .9*height, width*.05, height*.05);

    fill(226, 105, 89);    //226  105  39
    stroke(0);
    rect(.2*width, .9*height, width*.05, height*.05);

    fill(239, 206, 16);    //239  206  16
    stroke(0);
    rect(.25*width, .9*height, width*.05, height*.05);

    fill(172, 214, 42);    
    stroke(0);
    rect(.3*width, .9*height, width*.05, height*.05);

    fill(0, 255, 0);    
    stroke(0);
    rect(.35*width, .9*height, width*.05, height*.05);

    fill(32, 178, 170);    
    stroke(0);
    rect(.4*width, .9*height, width*.05, height*.05);

    fill(0, 0, 255);    
    stroke(0);
    rect(.45*width, .9*height, width*.05, height*.05);

    fill(31, 29, 109);    
    stroke(0);
    rect(.5*width, .9*height, width*.05, height*.05);

    fill(166, 53, 112);    
    stroke(0);
    rect(.55*width, .9*height, width*.05, height*.05);

    fill(188, 113, 137);    
    stroke(0);
    rect(.6*width, .9*height, width*.05, height*.05);

    fill(255, 255, 255);
    stroke(0);
    rect(.65*width, .9*height, width*.05, height*.05);

    fill(0);
    textSize(20);
    text("Canvas:", width*.45, height*.09);

    textSize(14);
    text("1:Rectangle", width*.8, height*.84);
    text("2:Line", width*.8, height*.86);
    text("3:Ellipse", width*.8, height*.88);
    text("Z:Undo", width*.8, height*.90);
    text("Y:Redo", width*.8, height*.92);
  }
}

