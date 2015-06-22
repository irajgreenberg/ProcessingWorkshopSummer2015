
void setup()
{
  size(1366, 700);
  background(9, 208, 224);
} 

void draw()
{
  background(9, 208, 224);
  fill(255);
  text(mouseX+ " "+ mouseY, 100, 100);

  rectMode(CENTER);
  fill(131,135,139);
  triangle(width/2, 25, 710, 105, 648, 105);
  fill(13, 7, 222);
  ellipse(width/2, 25, 45, 45);
  fill(131,135,139);
  rect(525, 173, 20, 60); // earL
  rect(840, 172, 20, 60); // earR  
  rect(width/2, 180, 300, 150); // head
  line(620, 216, 740, 216);
  ellipse(560, 285, 50, 50);// shoulder
  beginShape(); // hand
  vertex(470, 390);
  vertex(480, 436);
  vertex(425, 400);
  endShape(CLOSE); 
  ellipse(475, 385, 40, 40);// palm
  beginShape();// arm2
  vertex(503, 330);
  vertex(522, 341);
  vertex(490, 380);
  vertex(474, 368);
  endShape(CLOSE);
  beginShape();// arm1
  vertex(540, 290);
  vertex(560, 308);
  vertex(523, 344);
  vertex(500, 331);
  endShape(CLOSE);
  beginShape(QUAD); // hand
  vertex(425, 400);
  vertex(440, 406);
  vertex(415, 441);
  vertex(400, 430);
  endShape(CLOSE);
  beginShape(); // hand
  vertex(480, 436);
  vertex(462, 426);
  vertex(445, 453);
  vertex(461, 461);
  endShape(CLOSE); 
  ellipse(805, 285, 50, 50);// shoulder
  beginShape();// arm2
  vertex(832, 348);
  vertex(851, 342);
  vertex(870, 380);
  vertex(845, 385);
  endShape(CLOSE);
  beginShape();// arm1
  vertex(810, 303);
  vertex(826, 290);
  vertex(856, 345);
  vertex(830, 351);
  endShape(CLOSE);
  beginShape(); // palm
  vertex(865, 400);
  vertex(910, 415);
  vertex(858, 440);
  endShape(CLOSE); 
  ellipse(862, 398, 40, 40); // wrist
  beginShape(); // hand
  vertex(858, 441);
  vertex(873, 433);
  vertex(890, 471);
  vertex(875, 475);
  endShape(CLOSE);
  beginShape(); // hand
  vertex(910, 415);
  vertex(896, 422);
  vertex(912, 465);
  vertex(930, 459);
  endShape(CLOSE);
  rect(width/2, 262, 80, 15); // neck1
  rect(width/2, 270, 100, 15); //neck2
  rect(width/2, 376, 230, 200);// body
  fill(234,2,2);
  ellipse(775,305,30,30);
  ellipse(590,305,30,30); // button
  ellipse(590, 450,30,30);
  ellipse(780,450,30,30);
  fill(255);
  ellipse(630, 165, 50, 50);//eyeL
  ellipse(740, 165, 50, 50);//eyeR
  fill(13, 7, 222);
  ellipse(622, 171, 30, 30); //eyeballL
  ellipse(732, 171, 30, 30); //eyeballR
  fill(131,135,139);
  rect(640, 485, 60, 20, 15);//legsL
  rect(640, 505, 60, 20, 15);//legsL
  rect(640, 525, 60, 20, 15);//legsL
  rect(640, 545, 60, 20, 15);//legsL
  rect(640, 565, 60, 20, 15);//legsL
  rect(740, 485, 60, 20, 15);//legsR
  rect(740, 505, 60, 20, 15);//legsR
  rect(740, 525, 60, 20, 15);//legsR
  rect(740, 545, 60, 20, 15);//legsR
  rect(740, 565, 60, 20, 15);//legsR
  rect(635, 580, 85, 40, 30, 2, 0, 40); // Lfoot
  rect(745, 580, 85, 40, 2, 30, 40, 2); // Rfoot
}  

