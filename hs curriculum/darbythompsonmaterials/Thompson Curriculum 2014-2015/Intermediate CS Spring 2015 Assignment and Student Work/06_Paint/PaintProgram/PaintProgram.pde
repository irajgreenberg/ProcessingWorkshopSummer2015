//Paint Program

ArrayList<Drawable> shapes;

int mode=1;

int r=100;
int g=100;
int b=100;
int s=0;
int smode=1;

void setup() {

  shapes= new ArrayList<Drawable>();

  size(700, 700);
}

void draw() {
  background(255);

  for (Drawable i : shapes) {
    i.display();
  }
  strokeWeight(1);
  stroke(0);
  fill(0,255,0);
  if (smode==2){
    ellipse(18,70,7,7);
  }
  if (mode==1){
    ellipse(18,20,7,7);
  }
  if (mode==2){
    ellipse(225,20,7,7);
  }
  if (mode==3){
    ellipse(490,20,7,7);
  }

  noStroke();
  fill(100);
  textSize(15);
  text("press l for line mode            press r for rectangle mode               press c for circle mode", 25, 25);
  text("press z to undo last action", 25, 50);
  text("press space to clear screen", 475, 50);
  text("press s to toggle outline", 25, 75);
  text("press p to save picture", 500, 75);
  text("1", 253, 50);
  text("2", 278, 50);
  text("3", 303, 50);
  text("4", 328, 50);
  text("5", 353, 50);
  text("6", 378, 50);
  text("7", 403, 50);
  text("8", 428, 50);
  
  
  stroke(0);
  fill(255,0,0);
  rect(250,60,15,15);
  fill(0,255,0);
  rect(275,60,15,15);
  fill(0,0,255);
  rect(300,60,15,15);
  fill(230,230,0);
  rect(325,60,15,15);
  fill(0,255,255);
  rect(350,60,15,15);
  fill(255,0,255);
  rect(375,60,15,15);
  fill(255,255,255);
  rect(400,60,15,15);
  fill(0,0,0);
  rect(425,60,15,15);
}

void keyPressed() {
  if (key=='p'){
    save("pic.jpg");
  }
  if (key=='s'){
    if (smode==1){
      s=1;
      smode=2;
    }
    else if (smode==2){
      s=0;
      smode=1;
    }
  }
  if (key=='1'){
    r=255;
    g=0;
    b=0;
  }
  if (key=='1'){
    r=255;
    g=0;
    b=0;
  }
  if (key=='2'){
    r=0;
    g=255;
    b=0;
  }
  if (key=='3'){
    r=0;
    g=0;
    b=255;
  }
  if (key=='4'){
    r=230;
    g=230;
    b=0;
  }
  if (key=='5'){
    r=0;
    g=255;
    b=255;
  }
  if (key=='6'){
    r=255;
    g=0;
    b=255;
  }
  if (key=='7'){
    r=255;
    g=255;
    b=255;
  }
  if (key=='8'){
    r=0;
    g=0;
    b=0;
  }
  if (key=='l') {
    mode=1;
  }
  if (key=='r') {
    mode=2;
  }
  if (key=='c') {
    mode=3;
  }
  if (shapes.size()>0) {
    if (key=='z') {
      shapes.remove(shapes.size()-1);
    }
    if (key==' '){
      for (int i=shapes.size()-1; i>=0; i--){
        shapes.remove(i);
      }
    }
  }
}

void mousePressed() {
  if (mode==1) {
    shapes.add(new Line(mouseX, mouseY,r,g,b));
  }
  if (mode==2) {
    shapes.add(new Rectangle(mouseX, mouseY,r,g,b,s));
  }
  if (mode==3) {
    shapes.add(new Circle(mouseX, mouseY,r,g,b,s));
  }
}
void mouseDragged() {
  if (shapes.size()>0) {
    shapes.get(shapes.size()-1).update(mouseX, mouseY);
  }
}

void mouseReleased() {
  shapes.get(shapes.size()-1).update(mouseX, mouseY);
}

