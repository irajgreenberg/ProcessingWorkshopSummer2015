
//Paint
//Begun 2/27/15
//class tomorrow make a new copy
ArrayList<Drawable> shapes;
Drawable shapesb;
int mode;
float origx;
float origy;
float secondx;
float secondy;
float dis;
float red;
float green;
float blue;
int othermode;
void setup() {
  mode=1;
  size(500, 500);
  shapes=new ArrayList<Drawable>();
}


void mousePressed() {
  //get those first coordinates
  // also add to temp array list
  //various tool bars
   if (mouseY>height-40) {
     othermode=1;
      if (mouseX<width/5) {
        mode=1;
      } else if (mouseX<2*width/5) {
        mode=2;
      } else if (mouseX<3*width/5) {
        mode=3;
      }
      else if (mouseX<4*width/5) {
        if (shapes.size()>0){
        shapes.remove(shapes.size()-1);
        }
      } else {
        for (int i=shapes.size ()-1; i>=0; i--) {
          shapes.remove(i);
        }
      }
    }
  else if (mouseY>20) {
    origx=mouseX;
    origy= mouseY;
    if (mode==1) {
      shapesb=new Oval(origx, origy, mouseX, mouseY, red, green, blue);
    }
    if (mode==2) {
      shapesb=new Rectangle(mouseX, mouseY, origx, origy, red, green, blue );
    }
    if (mode==3) {
      shapesb=new Line(mouseX, mouseY, origx, origy, red, green, blue);
    }
   
  } else {
    red= red(get(mouseX, mouseY));
    blue= blue(get(mouseX, mouseY));
    green= green(get(mouseX, mouseY));
    othermode=1;
  }
}

void mouseDragged() {
  //update it
  if (othermode==0) {
    shapesb.inputchange();
  }
}
void mouseReleased() {
  if (othermode==0) {
    shapesb=null;
    if (mode==1) {
      shapes.add(new Oval(origx, origy, mouseX, mouseY, red, green, blue));
    }
    if (mode==2) {
      shapes.add(new Rectangle(mouseX, mouseY, origx, origy, red, green, blue ));
    }
    if (mode==3) {
      shapes.add(new Line(mouseX, mouseY, origx, origy, red, green, blue));
    }
  }
  othermode=0;
}



void draw() {
  //display the things
  background(255);
  //color bar
  stroke(0, 0, 0);
  fill(0, 153, 204);
  rectMode(CORNERS);
  rect(0, 0, width/6, 20);
  fill(153, 51, 204);
  rect(width/6, 0, 2*width/6, 20);
  fill(102, 153, 0);
  rect(2*width/6, 0, 3*width/6, 20);
  fill(255, 138, 0);
  rect(3*width/6, 0, 4*width/6, 20);
  fill(204, 0, 0);
  rect(4*width/6, 0, 5*width/6, 20);
  fill(253, 240, 53);
  rect(5*width/6, 0, width, 20);
  //tool bar
  fill(255);
  if (mode==1){
    fill(200);
  }
  rect(0, height-40, width/5, height);
  fill(255);
    if (mode==2){
    fill(200);
  }
  rect(width/5, height-40, 2*width/5, height);
  fill(255);
    if (mode==3){
    fill(200);
  }
  rect(2*width/5, height-40, 3*width/5, height);
  fill(255);
  rect(3*width/5, height-40, 4*width/5, height);
  rect(4*width/5, height-40, width, height);
  ellipseMode(CENTER);
  fill(150);
  ellipse(width/10, height-20, 40, 30);
  rect(width/5+10, height-30, 2*width/5-10, height-10);
  stroke(150);
  line(2*width/5+10, height-30, 3*width/5-10, height-10);
  text("undo", 3*width/5+30, height-15);
  text("clear", 4*width/5+30, height-15);
  stroke(0);
  for (Drawable shape : shapes) {
    shape.display();
  }
  if (shapesb==null) {
  } else {
    shapesb.display();
  }
}

