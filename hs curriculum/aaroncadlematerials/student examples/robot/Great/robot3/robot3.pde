

void setup()
{
  size(1366, 720);
  background(0);
    w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues = new float[w/xspacing];
}

void draw()
{
    background(0);
//  fill(255);
//  text(mouseX+" "+mouseY,width/2,100);
  calcWave();
  renderWave();
  fill(3, 40, 255);
  stroke(0);
  rect(461, 672, 62, 10);

  fill(3, 40, 255);
  stroke(0);
  rect(773, 672, 62, 10);

  fill(3, 46, 255);
  noStroke();
  quad(462, 672, 483, 640, 539, 641, 523, 672);

  fill(3, 46, 255);
  noStroke();
  quad(835, 672, 819, 640, 758, 640, 774, 672);

  fill(4, 48, 118);
  rect(525, 673,17, 10);
 
  fill(4,48,118);
  rect(755,673,17,10);
  
  fill(4,48,118);
  triangle(525,673,542,640,542,675);
  
  fill(4,48,118);
  triangle(772,673,755,673,755,640);
  
  fill(4,48,118);
  rect(543,500,50,183);
  fill(4,48,118);
  beginShape();
  vertex(565,500);
  vertex(576,449);
  vertex(592,449);
  vertex(593,500);
  endShape(CLOSE);
  
  fill(4,48,118);
  rect(704,500,50,183);
  fill(4,48,118);
  beginShape();
  vertex(733,500);
  vertex(717,449);
  vertex(704,449);
  vertex(704,500);
  endShape(CLOSE);
  
  fill(0);
  triangle(543,515,565,499,543,499);
  
  fill(0);
  triangle(732,499,754,499,754,515);
  
  fill(3,46,255);
  stroke(0);
  quad(505,516,483,640,542,640,542,515);
  fill(0);
  
  
  fill(3,46,255);
  quad(790,515,817,639,755,639,754,515);
  
  fill(3,46,255);
  noStroke();
  quad(541,515,505,515,531,497,565,497);
  
  fill(3,46,255);
  noStroke();
  quad(789,515,756,515,732,497,765,497);
  
  fill(3,46,255);
  noStroke();
  quad(749,449,718,449,733,497,764,497);
  
  fill(3,46,255);
  noStroke();
  quad(544,449,575,449,564,497,531,497);

  stroke(3,46,255);
  strokeWeight(2);
  fill(245);
  quad(591,448,616,400,571,400,550,448);
  
  stroke(3,46,255);
  strokeWeight(2);
  fill(245);
  quad(704,448,683,400,725,400,743,448);
  
  stroke(3,46,255);
  strokeWeight(1.5);
  fill(245);
  rect(610,400,77,10);
  //center rect
  fill(184);
  stroke(0);
  strokeWeight(1);
  rect(619,290,60,110);
  
  //center rectangle details.
//  strokeWeight(1.5);
//  stroke(1);
//  line(619,300,645,300);
//  line(619,310,645,310);
//  line(619,320,645,320);
//  line(619,330,645,330);
//  line(619,340,645,340);
//  line(619,350,645,350);
//  line(619,360,645,360);
//  line(619,370,645,370);
//  line(619,380,645,380);
//  line(619,390,645,390);
 
  fill(209,19,19);
  rect(595,325,24,75);
  
  fill(209,19,19);
  rect(679,325,24,75);
  
  fill(165);
  noStroke();
  rect(560, 300, 59, 25);
  fill(165);
  triangle(536,300,570,300,560,325);
  
  fill(165);
  noStroke();
  rect(680,300,59,25);
  fill(165);
  triangle(755,300,738,300,739,325);
  
  fill(209,19,19);
  noStroke();
  rect(515,150,104,150);
  
  fill(209,19,19);
  noStroke();
  rect(618,250,62,40);
  
  fill(209,19,19);
  noStroke();
  rect(680,150,104,150);
  
  fill(209,19,19);
  noStroke();
  rect(615,150,70,105);
  
  stroke(0);
  strokeWeight(3);
  line(650,289,650,150);
  strokeWeight(1);
  
  fill(124,207,245);
  stroke(139,4,22);
  strokeWeight(2);
  rect(535,170,90,66);
  strokeWeight(1);
  
  //cornercutters
  fill(0);
  noStroke();
  triangle(515,286,515,300,527,300);
  triangle(784,286,784,300,769,300);
  triangle(530,150,515,150,500,165);
  triangle(769,150,784,150,784,157);
  
  fill(124,207,245);
  stroke(139,4,22);
  strokeWeight(2);
  rect(675,170,90,66);
  strokeWeight(1);
  
 //mask
 fill(163);
 noStroke();
 beginShape();
 vertex(650,140);
 vertex(625,120);
 vertex(625,100);
 vertex(675,100);
 vertex(675,120);
 endShape(CLOSE);
 
 triangle(650,95,657,100,643,100);
 fill(3,46,255);
 noStroke();
 triangle(650,95,657,88,643,88);
 rect(625,110,8,12);
 rect(667,110,8,12);
 
 fill(3,46,255);
 triangle(650,95,657,88,643,88);
 
 //helmet
 fill(3,46,255);
 noStroke();
 rect(617,65,8,57);
 rect(675,65,8,57);
 ellipse(621,65,8,8);
 ellipse(679,65,8,8);
 arc(650,88,60,49,PI,2*PI);
 
 fill(3,46,255);
 noStroke();
 beginShape();
 vertex(643,88);
 vertex(644,57);
 vertex(656,57);
 vertex(657,88);
 endShape(CLOSE);
 ellipse(650,57,12,6);
 
 
 //neck
 fill(184);
 noStroke();
 beginShape();
 vertex(635,128);
 vertex(648,139);
 vertex(648,150);
 vertex(635,150);
 endShape(CLOSE);
 
 fill(184);
 noStroke();
 beginShape();
 vertex(666,128);
 vertex(652,139);
 vertex(652,150);
 vertex(666,150);
 endShape(CLOSE);
 
 fill(184);
 noStroke();
 rect(640,140,20,10);
 
 //eyes
 fill(100,200,255);
 noStroke();
 ellipse(637.5,95,13,8);
 
 fill(100,200,255);
 noStroke();
 ellipse(662.5,95,13,8);
 
 //arms
 noStroke();
 fill(165);
 rect(490,160,25,70);
 fill(162,16,21);
 rect(410,147,90,90);
 
 fill(0);
 stroke(0);
 triangle(425,145,410,145,410,160);
 
 fill(0);
 stroke(0);
 triangle(875,145,890,145,890,160);
 
 noStroke();
 fill(165);
 rect(784,160,25,70);
 fill(162,16,21);
 rect(799,147,90,90);
 
 stroke(0);
 fill(165);
 rect(425,237,60,63);
 stroke(0);
 fill(165);
 rect(815,237,60,63);
 
 fill(209,19,19);
 stroke(162,16,21);
 strokeWeight(3);
 rect(420,270,70,100);
 rect(810,270,70,100);
 strokeWeight(1);
 
 fill(0);
 stroke(0);
 triangle(875,145,890,145,890,160);
 
 //wrists
 stroke(0);
 fill(4,48,118);
 rect(425,372,60,5);
 rect(815,372,60,5);
 
 //hands
 fill(3,30,215);
 stroke(0);
 rect(420,377,70,58);
 rect(810,377,70,58);  
}
int xspacing = 16;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave

float theta = 0.0;  // Start angle at 0
float amplitude = 100.0;  // Height of wave
float period = 50.0;  // How many pixels before the wave repeats
float dx;  // Value for incrementing X, a function of period and xspacing
float[] yvalues;  // Using an array to store height values for the wave





void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.02;

  // For every x value, calculate a y value with sine function
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255,2,230);
  // A simple way to draw the wave with an ellipse at each location
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 15,15);
  }
}
