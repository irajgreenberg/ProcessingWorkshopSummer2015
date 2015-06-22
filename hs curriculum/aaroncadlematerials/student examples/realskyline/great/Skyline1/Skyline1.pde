void setup()
{
  color topColor = color(129, 54, 7);
  color bottomColor = color(0, 0, 0);
  float gradeFactor;

  size(1366, 710);
  background(topColor);
  //NOTE GRADIENT CODE BELOW CAN BE LEFT OUT IF DESIRED
  loadPixels();
  for (int i = 0;i<pixels.length; i++)
  {
    float r= red(pixels[i]);
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    //
    float r2 = red(bottomColor);
    float g2 = green(bottomColor);
    float b2 = blue(bottomColor);
    //
    r = r * (pixels.length - i) / pixels.length + ((r2 * i) / pixels.length);
    g = g * (pixels.length - i) / pixels.length + ((g2 * i) / pixels.length);
    b = b * (pixels.length - i) / pixels.length + ((b2 * i) / pixels.length);
    pixels[i] = color(r, g, b);
  }
  updatePixels();
}

void draw()
{

  color topColor = color(129, 54, 7);
  color bottomColor = color(0, 0, 0);
  float gradeFactor;

  background(topColor);
  //NOTE GRADIENT CODE BELOW CAN BE LEFT OUT IF DESIRED
  loadPixels();
  for (int i = 0;i<pixels.length; i++)
  {
    float r= red(pixels[i]);
    float g= green(pixels[i]);
    float b= blue(pixels[i]);
    //
    float r2 = red(bottomColor);
    float g2 = green(bottomColor);
    float b2 = blue(bottomColor);
    //
    r = r * (pixels.length - i) / pixels.length + ((r2 * i) / pixels.length);
    g = g * (pixels.length - i) / pixels.length + ((g2 * i) / pixels.length);
    b = b * (pixels.length - i) / pixels.length + ((b2 * i) / pixels.length);
    pixels[i] = color(r, g, b);
  }
  updatePixels();



  println(mouseX + " " + mouseY);
  rectMode(CORNER);

  noStroke();
  fill(237, 123, 69, 90);
  ellipse(width/2, 518, 500, 500);
  fill(255, 255, 255, 150);
  ellipse(422, 94, 100, 50);
  ellipse(452, 104, 100, 50);
  ellipse(482, 94, 100, 50);
  ellipse(792, 94, 100, 50); 
  ellipse(822, 84, 100, 50);
  ellipse(852, 94, 100, 50);



  smooth();
  strokeWeight(10);
  noFill();
  stroke(98, 41, 15, 40);
  ellipse(width/2, 518, 500, 500);
  stroke(0);


  rectMode(CORNER);
  strokeWeight(1);
  fill(52, 18, 2);
  quad(0, 565, 0, 389, 204, 118, 600, 565);

  quad(768, 572, 1061, 62, 1366, 364, 1366, 600);
  triangle(369, 583, 634, 195, 890, 580);
  noStroke();
  fill(255, 255, 255, 150);
  ellipse(167, 156, 100, 50); 
  ellipse(197, 166, 100, 50);
  ellipse(227, 156, 100, 50);

  ellipse(570, 188, 100, 50); 
  ellipse(600, 178, 100, 50);
  ellipse(630, 188, 100, 50);


  stroke(0);
  fill(0);
  rect(55, 355, 100, 350);
  triangle(65, 335, 145, 335, 105, 305);
  rect(65, 335, 80, 30);
  rect(104, 265, 2, 50);

  rect(265, 355, 100, 350);
  triangle(275, 335, 355, 335, 315, 305);
  rect(275, 335, 80, 30);
  rect(314, 265, 2, 50);
  noFill();
  strokeWeight(4);
  arc(210, 450, 112, 50, PI, 2*PI);
  line(155, 422.5, 265, 422.5);
  line(155, 400, 265, 400);

  beginShape();
  curveVertex(1015, 550);
  curveVertex(1015, 550);
  curveVertex(1062, 435);
  curveVertex(1080, 270);
  curveVertex(1080, 270);
  endShape();

  beginShape();
  curveVertex(1100, 270);
  curveVertex(1100, 270);
  curveVertex(1118, 435);
  curveVertex(1165, 550);
  curveVertex(1165, 550);
  endShape();
  fill(0);
  strokeWeight(1);

  rect(1057, 432, 66, 15);
  arc(1090, 260, 37, 60, 0, PI); 
  rectMode(CENTER);
  rect(1090, 255, 30, 10);
  noFill();
  strokeWeight(5);
  beginShape();
  curveVertex(1077, 250);
  curveVertex(1077, 250);
  curveVertex(1086, 235);
  curveVertex(1089, 183);
  curveVertex(1089, 183);
  endShape();

  beginShape();
  curveVertex(1091, 183);
  curveVertex(1091, 183);
  curveVertex(1094, 235);
  curveVertex(1103, 250);
  curveVertex(1103, 250);
  endShape();
  strokeWeight(2);
  fill(0); 
  rectMode(CENTER);

  line(1090, 290, 1090, 433);
  line(1083, 466, 1067, 505);
  line(1096, 465, 1134, 539);
  line(1055, 463, 1125, 463);


  rect(1090, 463, 12, 5);
  rect(1040, 530, 40, 70);
  rect(1025, 545, 40, 70);
  rect(1065, 530, 40, 70);
  rect(1080, 545, 40, 70);
  rect(1160, 545, 80, 70);


  triangle(1078, 250, 1102, 250, 1090, 217);
  rectMode(CENTER);
  rect(width/2, 530, 150, 120);
  rect(width/2, 470, 120, 20);
  arc(width/2, 460, 120, 60, PI, PI*2);
  rect(width/2, 410, 2, 50);
  rectMode(CORNER);
  rect(width/2, 385, 20, 15);
  rect(0, 566, 1400, 500);

  line(1064, 420, 1115, 420);
  line(1115, 420, 1069, 400);
  line(1064, 420, 1111, 400);
  line(1069, 400, 1111, 400);
  line(1111, 400, 1072, 380);
  line(1069, 400, 1110, 380);
  line(1072, 380, 1110, 380);
  line(1110, 380, 1075, 360);
  line(1072, 380, 1106, 360);
  line(1075, 360, 1106, 360);
  line(1106, 360, 1076, 340);
  line(1075, 360, 1105, 340);
  line(1076, 340, 1105, 340);
  line(1105, 340, 1076, 320);
  line(1076, 340, 1105, 320);
  line(1076, 320, 1105, 320);
  line(1105, 320, 1077, 300);
  line(1076, 320, 1103, 300);
  line(1077, 300, 1103, 300);

  line(1064, 420, 1090, 431);
  line(1115, 420, 1090, 431);
  line(1060, 444, 1090, 462);
  line(1120, 443, 1090, 462);
  line(1054, 462, 1090, 445);
  line(1126, 462, 1090, 445);

  line(1049, 478, 1079, 478);
  line(1049, 478, 1090, 462);
  line(1104, 478, 1131, 478);
  line(1131, 478, 1090, 462);
  line(1043, 493, 1077, 477);
  line(1137, 494, 1110, 494);
  line(1139, 493, 1104, 478);
  line(1144, 508, 1110, 495);

  rect(1105, 489, 55, 100);
  rectMode(CENTER);
  rect(873, 450, 100, 350);
  rect(873, 450, 80, 370);
  rect(873, 450, 60, 390);

  rect(962, 514, 85, 100);
  rectMode(CORNER);
  rect(961, 456, 43, 100);
  line(945, 463, 945, 423);
  rectMode(CENTER);
  rect(781, 490, 75, 275);
  quad(745, 351, 773, 332, 818, 332, 818, 351);
  rect(445, 492, 90, 225);
  rect(445, 492, 80, 245);
  rect(445, 492, 70, 265);
  rect(445, 492, 60, 285);
  rect(445, 492, 50, 305);
  line(426, 341, 426, 311);
  line(464,341,464,311);
  rect(368,544,70,100);
  rect(364,482,20,50);
  rect(518,535,80,100);
  rect(578,541,100,80);
  rect(531,535,20,110);
  rect(531,535,15,130);
  
  rect(1284,490,200,200);
  rect(1245,490,55,223);
  rect(1245,490,15,253);
  rect(23,513,65,100);
  rect(23,513,55,120);
  rect(192,552,70,90);
   rect(232,532,70,80);
  fill(255,255,0,50);
  noStroke();
  ellipse(1279,174,75,75);
  quad(1242,174,1317,174,1252,362,1237,362);
  arc(1279,174,75,75,PI,2*PI);
  
  
}
