/* 
 Kiley Jarymiszyn's Holiday Picture
 This pictures creates a winter wonderland 
 */

void  setup() {
  size(800, 800); 

}

void draw() {
  background(230, 230, 250);
  fill(254, 222, 179);
  rect(0, 535, 800, 800);
  fill(220, 220, 220);
  rect(150, 150, 500, 240);
  stroke(210, 105, 30);
  fill(220, 20, 60);
  ellipse(400, 575, 200, 100);
  fill(210, 105, 30);
  rect(350, 500, 100, 70);
  stroke(240,248,255);
  fill(255,182,193);
  rect(200,550,120,70);
  fill(255,215,0);
  rect(290,560,60,60);
  fill(0,139,139);
  rect(250,575,60,60);
  fill(255);
  draw2();
  stroke(0, 100, 0);
  fill(0, 100, 0);
  triangle(400, 190, 500, 300, 300, 300);
  triangle(400, 250, 550, 400, 250, 400);
  triangle(400, 300, 600, 500, 200, 500);
  fill(255, 255, 0);
  beginShape();
  vertex(390, 190);
  vertex(397, 190);
  vertex(400, 185);
  vertex(403, 190);
  vertex(410, 190);
  vertex(407, 193);
  vertex(409, 196);
  vertex(400, 193);
  vertex(391, 196);
  vertex(393, 193);
  endShape();
  fill(220,20,60);
  textSize(50);
  text("Merry Christmas!", 200, 735);
  fill(255,99,71);
  beginShape();
  vertex(151,150);
  vertex(210,150);
  vertex(160,260);
  vertex(210,390);
  vertex(151,390);
  endShape();
  beginShape();
  vertex(650,150);
  vertex(590,150);
  vertex(640,260);
  vertex(590,390);
  vertex(650,390);
  endShape();


}


void draw2() {
  frameRate(3);
  int counter=0;
  if (counter<20) {
    for (int i=0; i<10; i=i+1) {
    ellipse((random(154,645)),(random(151,370)), 10, 10);
    }
  counter=counter+1;
  }
  
}

