int yPos = 460;
void setup()
{ 
  size(1366, 710);
  background(255);
}

void draw()
{ 

  background(7,245,231);
  stroke(0);
   fill(99, 59, 155);
  println(mouseX + " " + mouseY);
  ellipse(683, 440, 200, 50);
  fill(99, 59, 155);
  strokeWeight(3);
 rect(887,377,50,150);
 rect(479,377,50,150);
   fill(39,203,25);
  triangle(526, 265, 430, 285, 525, 345);
  triangle(840, 265, 936, 285, 841, 345);
    fill(99, 59, 155);
  beginShape();
  vertex(width/2, height/2-200);
  vertex(840, 265);
  vertex(750, 440);
  vertex(616, 440);
  vertex(526, 265);
  endShape(CLOSE);
  beginShape();
  curveVertex(720, 138);
  curveVertex(720, 138);
  curveVertex(683, 200);
  curveVertex(646, 138);
  curveVertex(646, 138);
  endShape(CLOSE);
  rectMode(CENTER);
  fill(39,203,25);
  quad(475, 200, 570, 225, 570, 325, 475, 305);
  quad(891, 200, 796, 225, 796, 325, 891, 305);
     fill(99, 59, 155);
  noStroke();
  ellipse(683, 440, 199, 49);
  stroke(0);
  noFill();
  arc(683, 430, 180, 49, 0, PI);
  arc(683, 420, 155, 36, 0, PI);
  stroke(255);
  arc(683, yPos, 170, 29, 0, PI);
  yPos=yPos+5;
  if (yPos>500)
  {
    yPos=460;
  }
  stroke(0);
  strokeWeight(1);
  fill(255,255,0);
  triangle(662,158,670,158,666,166);
  triangle(696,158,704,158,700,166);
  fill(99, 59, 155);
  arc(480,458,75,85,PI,2*PI,CLOSE);
  stroke(0);
  fill(7,245,231);
  arc(480,459,35,40,PI,2*PI);
 fill(99, 59, 155);
  arc(886,458,75,85,PI,2*PI,CLOSE);
  stroke(0);
  fill(7,245,231);
  arc(886,459,35,40,PI,2*PI);
  fill(0);
  rect(width/2,height/2-50,100,40);
  noFill();
  stroke(255,0,0);
  beginShape();
  vertex(635,317);
  vertex(642,317);
  vertex(655,296);
  vertex(668,321);
  vertex(676,295);
  vertex(682,312);
  vertex(691,296);
  vertex(700,315);
  vertex(711,296);
  vertex(723,315);
  vertex(728,315);
  endShape();
}
 
 
 
 
 
 
