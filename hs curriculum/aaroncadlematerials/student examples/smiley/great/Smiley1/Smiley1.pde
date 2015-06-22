


void setup()
{
  size(1280, 680);
  background(0);
}

void draw()
{
  background(10, 95, 39);

  fill(255);
  text(mouseX + " " + mouseY, 682, 21);

  fill(255);
  stroke(0);
  beginShape();
  vertex(572, 79);
  vertex(449, 7);
  vertex(356, 352);
  vertex(327, 373);
  vertex(278, 373);
  vertex(246, 334);
  vertex(311, 15);
  vertex(449, 7);
  endShape(CLOSE);

  beginShape();
  vertex(458, 158);
  vertex(419, 118);
  vertex(449, 7);
  vertex(572, 79);
  endShape();

  fill(255);
  beginShape();
  vertex(793, 79);
  vertex(870, 7);
  vertex(1074, 352);
  vertex(1108, 373);
  vertex(1151, 373);
  vertex(1178, 334);
  vertex(1017, 15);
  vertex(870, 7);
  endShape(CLOSE);

  beginShape();
  vertex(907, 158);
  vertex(936, 118);
  vertex(870, 7);
  vertex(793, 79);
  endShape();

  fill(227, 158, 220);
  beginShape();
  vertex(815, 92);
  vertex(883, 29);
  vertex(921, 93);
  vertex(888, 142);
  endShape();

  beginShape();
  vertex(549, 92);
  vertex(443, 29);
  vertex(426, 93);
  vertex(476, 142);
  endShape();


  fill(255);
  ellipse(width/2+50, height/2, 600, 600);

  fill(0);
  stroke(0);
  arc(width/2+50, height/2, 448, 450, 0, PI);

  fill(254, 255, 196);
  beginShape();
  vertex(620, 340);
  vertex(752, 340);
  vertex(752, 412);
  vertex(620, 412);
  endShape(CLOSE);

  fill(20, 126, 216);
  stroke(20, 126, 216);
  ellipse(571, 255, 100, 100);
  ellipse(788, 255, 100, 100);

  fill(0);
  stroke(0);
  ellipse(571, 255, 50, 50);
  ellipse(788, 255, 50, 50);

  beginShape();
  vertex(686, 340);
  vertex(686, 412);
  endShape();

  fill(165, 153, 153);
  stroke(0);
  beginShape();
  vertex(450, 149);
  vertex(450, 116);
  vertex(426, 94);
  vertex(420, 118);
  endShape(CLOSE);

  beginShape();
  vertex(450, 33);
  vertex(449, 9);
  vertex(444, 29);
  endShape(CLOSE);

  beginShape();
  vertex(869, 7);
  vertex(877, 34);
  vertex(883, 29);
  endShape(CLOSE);

  beginShape();
  vertex(911, 108);
  vertex(923, 135);
  vertex(935, 118);
  vertex(921, 94);
  endShape(CLOSE);

  fill(165, 130, 160);
  beginShape();
  vertex(450, 116);
  vertex(450, 34);
  vertex(443, 29);
  vertex(426, 93);
  endShape(CLOSE);

  beginShape();
  vertex(877, 34);
  vertex(883, 29);
  vertex(921, 94);
  vertex(911, 108);
  endShape(CLOSE);
}

