/*

 Wintry Scene - Nicolas Jimenez
 This program is supposed to show some form of some wintry scene...
 ...in hopes of more snow in DC
 
 */
PImage bulba;
PImage squirtle;
PImage charmander;
void setup() {
  size(500, 500);
  background(255);

  String url = "http://pldh.net/media/pokemon/gen4/hgss/001.png";
  bulba = loadImage(url, "gif");


  String urll = "http://hydra-media.cursecdn.com/pokemon.gamepedia.com/c/c6/Squirtle%28DPP%29Sprite.png";
  squirtle = loadImage(urll, "gif");

  charmander = loadImage("CharmanderSprite.gif");

  for (int i=0; i<10; i=i+1) {
    ellipse(i*1.50, 200, 10, 10);
  }
}
int counterthing = 0;

void draw() {
  counterthing = counterthing+1;
    if (counterthing%30==0) {
    background(255);
    
  stroke(136, 200, 120);
  fill(136, 200, 120);
  rect(0, 350, 500, 150);

  stroke(102, 278, 255);
  fill(102, 278, 255);
  rect(0, 0, 500, 350);

  image(bulba, 100, 400);
  image(squirtle, 140, 400);
  image(charmander, 180, 400);

  fill(0, 102, 153);
  textSize(32);
  text("Happy (Pokemon) Christmas!!", 20, 40);



  stroke(255, 0, 0);
  fill(255, 0, 0);
  beginShape();
  vertex(128, 435);
  vertex(138, 425);
  vertex(148, 435);
  vertex(128, 435);
  endShape();
  stroke(255);
  fill(255);

  stroke(0);
  fill(255);
  ellipse(138, 425, 5, 5);

  stroke(255, 0, 0);
  fill(255, 0, 0);
  beginShape();
  vertex(185, 425);
  vertex(175, 415);
  vertex(165, 425);
  vertex(185, 425);
  endShape();

  stroke(0);
  fill(255);
  ellipse(175, 415, 5, 5);

  fill(0, 0, 0);
  rect(300, 480, 70, 10);
  rect(290, 470, 10, 10);
  rect(280, 420, 10, 50);
  rect(290, 410, 10, 10);
  rect(300, 400, 10, 10);
  rect(310, 410, 50, 10);
  rect(360, 400, 10, 10);
  rect(370, 410, 10, 10);
  rect(380, 420, 10, 50);
  rect(370, 470, 10, 10);
  rect(370, 360, 10, 40);
  rect(360, 350, 10, 10);
  rect(340, 340, 20, 10);
  rect(360, 300, 10, 40);
  rect(340, 310, 10, 10);
  rect(320, 310, 10, 10);
  rect(290, 290, 90, 10);
  rect(310, 250, 50, 40);
  rect(300, 300, 10, 40);
  rect(310, 340, 20, 10);
  rect(300, 350, 10, 10);
  rect(290, 360, 10, 40);
  rect(330, 390, 10, 10);
  rect(330, 370, 10, 10);
  rect(330, 430, 10, 10);
  rect(330, 450, 10, 10);
  rect(250, 370, 40, 10);
  rect(260, 360, 10, 30);
  rect(380, 370, 40, 10);
  rect(400, 360, 10, 30);

  stroke(0);
  fill(236, 120, 0);
  rect(330, 320, 10, 30);

  //christmas tree
  stroke(60, 131, 13);
  fill(60, 131, 13);
  beginShape();
  vertex(100, 150);
  vertex(140, 150);
  vertex(120, 100);
  vertex(100, 150);
  endShape();

  beginShape();
  vertex(75, 225);
  vertex(165, 225);
  vertex(120, 130);
  vertex(75, 225);
  endShape();

  beginShape();
  vertex(55, 310);
  vertex(185, 310);
  vertex(120, 190);
  vertex(55, 310);
  endShape();


  // trunk of tree
  stroke(83, 53, 10);
  fill(83, 53, 10);
  rect(110, 310, 20, 40);

  //random snowballs
  stroke(0);
  fill(255);





    ellipse(random(500), random(500), 3, 3);
    ellipse(random(500), random(500), 3, 3);
    ellipse(random(500), random(500), 3, 3);
    ellipse(random(500), random(500), 3, 3);
    ellipse(random(500), random(500), 3, 3);
    ellipse(random(500), random(500), 5, 5);
    ellipse(random(500), random(500), 5, 5);
    ellipse(random(500), random(500), 4, 4);
  }


}

