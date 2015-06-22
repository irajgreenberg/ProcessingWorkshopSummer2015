/* BeautyForCharlie was inspired by a petal created during the pilot sessions
 of Code Community: Montclair.  This was a collaboration between many 
 people of all ages.
 
 It was also inspired by Charlie Ortman's homily on June 14, 2015
 at the Unitarian Universalist Church of Montclair.
 
 It was created as a thank you to Charlie for being truly inspiring.
 
 Ursula Wolz,  June 20, 2015
 Please give attribution if you remix.   
 */

int apxt;  // anchor point
int apyt;   
color stemColor = #078643;

void setup() {
  size(288, 432);
}
void draw() {
  background(#AFEDB8); 

  // Next step is to do this with a data file.
  drawFlower(74, -52, 7, #EAE8FA, #FFFFCC, 240, 84);
  drawFlower(143, -127, 19, #F71985, #1400FF, 130, 70);
  drawFlower(63, 28, 7, #FF6400, #FF0044, 18, 181);
  drawFlower(63, 28, 7, #FF6400, #FF0044, 190, 80);
  drawFlower(63, 28, 7, #FF005E, #FF0044, 60, 260);
  drawFlower(85, 73, 60, #44D3CB, #FAFAFA, 80, 120); 
  drawFlower(85, 73, 60, #44D3CB, #FAFAFA, 200, 170); 
  drawFlower(143, -127, 19, #C800FF, #1400FF, 160, 250);
  drawFlower(8, 42, 12, #BB50E3, #506EE3, 25, 220); 
  drawFlower(40, 28, 7, #FF6400, #FF0044, 250, 140);
  drawFlower(8, 42, 12, #BB50E3, #506EE3, 250, 200); 
  drawFlower(34, 9, 5, #FF00A0, #F7C661, 13, 82);
  drawFlower(74, -52, 7, #FF50FA, #FFFFCC, 50, 160);
  drawFlower(40, 50, 60, #F0FF86, #50E35B, 260, 270);
  drawFlower(40, 50, 60, #F0FF86, #50E35B, 80, 200);
  drawFlower(63, 28, 7, #FF005E, #FF0044, 140, 180);
  drawFlower(74, -52, 7, #EAE8FA, #FFFFCC, 185, 250);
  drawFlower(34, 9, 5, #F00096, #F7C661, 215, 290);

  //Clover
  pushMatrix();
  rotate(radians(15));
  drawFlower(0, 50, 3, #37A20D, #D4D6D4, 145, 350);
  drawFlower(0, 50, 4, #37A20D, #D4D6D4, 133, 380);
  drawFlower(0, 50, 3, #37A20D, #D4D6D4, 165, 390);
  popMatrix();
  
  // Signature
  fill(stemColor);
  PFont font = loadFont("BrushScriptMT-8.vlw");
  textFont(font, 8);
  text("Ursula Wolz", width-40, height-10);

  noLoop();
}

void drawStem(int x, int y) {
  noFill();
  stroke(stemColor);
  strokeWeight(4);
  curve(-20, 0, x, y, width/2, height, -20, 50); 
  strokeWeight(1);
}

void drawFlower(int x, int y, int petalcount, color petalcolor, color edgecolor, int apx, int apy) {
  drawStem(apx, apy);
  stroke(edgecolor);
  fill(petalcolor);
  apxt = mouseX;
  apyt = mouseY;
  pushMatrix();
  if (apx == 0)  translate(apxt, apyt); 
  else translate(apx, apy);
  println(apxt + " " + apyt);
  for (int i = 0; i < petalcount; i ++) { 
    bezier(0, 0, x, y, y, x, 0, 0);
    rotate(radians(360/petalcount));
  }
  popMatrix();
}

void mouseReleased() {
  saveFrame();
}

