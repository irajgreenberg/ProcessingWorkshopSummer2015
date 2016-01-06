

void setup()
{
  background(0);
  size(1366, 700);
}

void draw()
{
  println(mouseX+ " " + mouseY);
  color topColor = color(88,214,26);
  color bottomColor = color(21,18,10);
  float gradeFactor;
  background(topColor);
  //NOTE GRADIENT CODE BELOW CAN BE LEFT OUT IF DESIRED
  loadPixels();
  for (int i = 0;i<pixels.length; i++)
  {
    float r= red(pixels[i]);
    float g= green(pixels[i]);
    float b= blue(pixels[i]);

    float r2 = red(bottomColor);
    float g2 = green(bottomColor);
    float b2 = blue(bottomColor);

    r = r * (pixels.length - i) / pixels.length + ((r2 * i) / pixels.length);
    g = g * (pixels.length - i) / pixels.length + ((g2 * i) / pixels.length);
    b = b * (pixels.length - i) / pixels.length + ((b2 * i) / pixels.length);
    pixels[i] = color(r, g, b);
  }
  updatePixels();

  // Grey
  fill(94, 103, 121);
  // outline
  stroke(54, 60, 72);
  strokeWeight(10);
  //head
  beginShape();
  vertex(633, 165);
  vertex(843, 180);
  vertex(815, 369);
  vertex(665, 369);
  endShape(CLOSE);
  //antenna
  line(742, 92, 735, 116);
  line(735, 116, 762, 138);
  line(762, 138, 723, 143);
  line(723, 143, 735, 152);
  line(735, 152, 734, 167);
  strokeWeight(10);
  ellipse(661, 251, 75, 75);
  // Eyes
  fill(148, 222, 101);
  strokeWeight(5);
  ellipse(661, 251, 45, 45);
  strokeWeight(10);
  fill(94, 103, 121);
  ellipse(807, 264, 60, 60);
  fill(148, 222, 101);
  strokeWeight(5);
  ellipse(807, 264, 35, 35);
  //nose
  fill(94, 103, 121);
  strokeWeight(15);
  line(720, 287, 747, 290);
  //eyebrows
  strokeWeight(5);
  fill(94, 103, 121);
  stroke(54, 60, 72);
  beginShape();
  vertex(672, 187);
  vertex(674, 198);
  vertex(612, 216);
  vertex(610, 207);
  endShape(CLOSE);
  beginShape();
  vertex(787, 209);
  vertex(788, 220);
  vertex(845, 231);
  vertex(852, 222);
  endShape(CLOSE);
  //mouth
  fill(148, 222, 101);
  stroke(54, 60, 72);
  strokeWeight(3);
  rectMode(CENTER);
  rect(688, 332, 5, 25);
  strokeWeight(5);
  rect(706, 332, 10, 40);
  rect(729, 330, 20, 48);
  rect(758, 331, 15, 44);
  rect(782, 330, 10, 35);
  rect(803, 330, 10, 20);
  //arms
  fill(54, 60, 72);
  beginShape();
  vertex(657, 460);
  vertex(648, 445);
  vertex(613, 580);
  vertex(638, 589);
  endShape(CLOSE);
  beginShape();
  vertex(814, 460);
  vertex(820, 445);
  vertex(870, 574);
  vertex(846, 590);
  endShape(CLOSE);
  fill(94, 103, 121);
  ellipse(626, 580, 35, 35);
  ellipse(858, 579, 35, 35);
  //Legs
  fill(54, 60, 72);
  beginShape();
  vertex(686, 595 );
  vertex( 704, 633 );
  vertex( 695, 663 );
  vertex( 715, 669 );
  vertex( 715, 607 );
  endShape(CLOSE);
  beginShape();
  vertex(759, 604 );
  vertex( 763, 667 );
  vertex( 777, 670 );
  vertex( 777, 578 );
  endShape(CLOSE);
  fill(94, 103, 121);
  ellipse(706, 633, 30, 30);
  ellipse(767, 633, 30, 30);
  arc(696, 681, 75, 45, PI, 2*PI);
  arc(782, 681, 75, 45, PI, 2*PI);
  line(660, 680, 730, 681);
  line(745, 682, 818, 680);
  //body
  fill(94, 103, 121);
  strokeWeight(5);
  ellipse(665, 435, 45, 45);
  ellipse(806, 435, 45, 45);
  beginShape();
  vertex(665, 414);
  vertex(800, 410);
  vertex(835, 566);
  vertex(645, 566);
  endShape(CLOSE);
  arc(740, 570, 150, 75, 0, PI);
  //neck
  fill(94, 103, 121);
  ellipse(740, 406, 50, 50);
  strokeWeight(22);
  line(735, 377, 740, 400);
  //heart
  strokeWeight(5);
  ellipse(734, 462, 40, 40);
  fill(148, 222, 101);
  ellipse(734, 462, 23, 23);
}

