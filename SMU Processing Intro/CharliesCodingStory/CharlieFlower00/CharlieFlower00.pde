
int apx1 = 0;  // anchor point
int apy1 = 0;   
int cpx1 = 150;  // control point
int cpy1 = 0;
int cpx2 = 0;
int cpy2 = 150;
int apx2 = 0;
int apy2 = 0;
int petalcount = 5;  // Change this for the number of petals
int petalcolor = #F00096;  // Change this for the color
int edgecolor = #F7C661;

void setup() {
  size(400, 400);
  //  noFill();
}
void draw() {
  background(#9BE5B1);
  //  bezier(30, 20, 80, 5, 80, 75, 30, 75);
  int x = cpx1;
  int y = cpy1;
  fill(0);
  text(x + " " + y, 20, 20);
  translate(width/2, height/2);
  stroke(255, 102, 0);

  stroke(255, 102, 0);
  line(apx1, apy1, x, y);
  stroke(255, 0, 255);
  line(apx2, apy2, y, x);
  noStroke();
  stroke(edgecolor);
  fill(petalcolor);
  bezier(apx1, apy1, x, y, y, x, apx2, apy2);
    
  }


