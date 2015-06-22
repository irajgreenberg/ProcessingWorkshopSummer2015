/*
Riley has a crayon
 the house has white walls
 mom will be angry...
 */

//creates a tree at given coor
void tree(int a, int b) { 
  for (int i=0; i<3; i=i+1) {
    stroke(0, 120, 35);           
    fill(0, 120, 35);          
    beginShape();         
    vertex(a-8, b+375+i*10);
    vertex(a+8, b+375+i*10);
    vertex(a, b+365+i*10);
    endShape();
  }
}

//init santa
PImage santa;

/*setup:*/
void setup() {
  //i just liked the way it looked at 5fps
  frameRate(5);
  //loads santa
  String url = "http://www.publicdomainpictures.net/pictures/10000/nahled/1453-1249837266vll3.jpg";
  santa =loadImage(url, "jpg");
  santa.resize(140, 80);
  //window
  size(500, 500);
  background(0);
  //snowscape
  stroke(255);
  fill(255); 
  beginShape(); 
  vertex(0, 300);
  vertex(150, 350);
  vertex(360, 375);
  vertex(450, 375);
  vertex(500, 345);
  vertex(500, 500);
  vertex(0, 500);
  endShape(); 
  //places 30-50 trees
  for (int i=0; i<random(30,50); i=i+1) {
    tree(int(random(500)), int(random(120)));
  }
}
//makes red sledder at give x,y coor
void sledder1(int x, int y) {
  //the sled
  stroke(80, 30, 10);
  fill(120, 70, 50); 
  beginShape();
  vertex(x-3, y-1);
  vertex(x+9, y+2);
  vertex(x+10, y-1);
  vertex(x-2, y-4);
  endShape();
  //the person
  stroke(240, 0, 0);
  fill(240, 0, 0); 
  beginShape();
  vertex(x, y-3);
  vertex(x+3, y-3);
  vertex(x+3, y-9);
  vertex(x, y-9);
  endShape();
}
//makes pink sledder at give x,y coor
void sledder2(int x, int y) {
  //sled
  stroke(80, 30, 10);
  fill(120, 70, 50); 
  beginShape();
  vertex(x-3, y-1);
  vertex(x+9, y+2);
  vertex(x+10, y-1);
  vertex(x-2, y-4);
  endShape();
  //person
  stroke(240, 0, 240);
  fill(240, 0, 240); 
  beginShape();
  vertex(x, y-3);
  vertex(x+3, y-3);
  vertex(x+3, y-9);
  vertex(x, y-9);
  endShape();
}

//animation
int counter=0;
void draw() {
  counter=counter+1;
  //wipes the black portion of the screen clean each time
  stroke(0);
  fill(0); 
  beginShape(); 
  vertex(0, 300);
  vertex(150, 350);
  vertex(360, 375);
  vertex(450, 375);
  vertex(500, 345);
  vertex(500, 0);
  vertex(0, 0);
  endShape(); 
  //move santa across the screen repeatedly 
  image(santa, 500-counter%67*9, 0);

  //snow :)
  for (int k=0; k<counter; k=k+1) {
    for (int i=1; i<20; i=i+1) {
      stroke(255);
      fill(255); 
      point(random(500), k*10);
    }
  }
  //text
  textSize(32);
  text("WISHING YOU", 120, 100);
  text("A VERY", 120, 150);
  text("MERRY CHRISTMAS!", 120, 200);
  //creates white space for sledder animation
  stroke(255);
  fill(255); 
  beginShape(); 
  vertex(0, 300);
  vertex(150, 350);
  vertex(350, 375);
  vertex(350, 390);
  vertex(150, 365);
  vertex(0, 330);
  endShape(); 


  //sledder downhill
  if (counter%150<=50) {
    sledder1(counter%150*3, counter%150+303); 
    sledder2((counter)%150*4, ((counter)%150+320));
  };
  //sledders uphill
  if (counter%150>50) {
    sledder1(int(200-counter%150*3/2), int(65-counter%150/2+303));
    sledder2(int(275-counter%150*2), int(65-counter%150/2+320));
  };
}

