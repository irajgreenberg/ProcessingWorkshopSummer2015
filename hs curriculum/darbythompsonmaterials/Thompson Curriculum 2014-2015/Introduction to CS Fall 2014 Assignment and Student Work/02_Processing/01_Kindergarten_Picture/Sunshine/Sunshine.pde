float xpos=80;
float ypos=80;
float xspeed=1;
float yspeed=1;
int n=0;

void setup() {
  size(800, 500);
  background(0, 191, 255);
}



void draw() {
  yspeed=cos(n)+1;
  if (xpos>=300 || ypos>=300) {
    xspeed=0;
    yspeed=0;
  }
  stroke(255, 255, 0);
  fill(255, 255, 0);
  ellipse(30, 30, 150, 150);
  xpos=xpos+xspeed;
  ypos=ypos+yspeed;
  n=n+1;
  stroke(255, 255, 0);
  point(xpos, ypos);
  stroke(0);
  line(300, 425, 400, 400);
  line(400, 400, 500, 425);
  line(400, 300, 400, 600);
  fill(0, 191, 255);
  ellipse(400, 300, 100, 100);
  fill(0);
  ellipse(380, 280, 5, 5);
  ellipse(420, 280, 5, 5);
  noFill();
  arc(400, 300, 50, 60, 0, PI);
  if (xpos<=300 & ypos<=300) {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(300, 300, 50, 50);
    rect(275, 300, 50, 100);
    stroke(0);
    line(300, 350, 300, 450);
  } else {
    background(0, 191, 255);
    stroke(0);
    line(300, 350, 300, 450);
    line(400, 400, 500, 425);
    stroke(255, 255, 0);
    fill(255, 255, 0);
    ellipse(30, 30, 150, 150);
    stroke(0);
    line(300, 425, 400, 400);
    line(400, 300, 400, 600);
    fill(0, 191, 255);
    ellipse(400, 300, 100, 100);
    fill(0);
    ellipse(380, 280, 5, 5);
    ellipse(420, 280, 5, 5);
    noFill();
    arc(400, 330, 50, 60, PI, PI+PI);
  }
}

