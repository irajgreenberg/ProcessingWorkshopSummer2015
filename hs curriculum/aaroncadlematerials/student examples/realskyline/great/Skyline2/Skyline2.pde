void setup()
{
size(1350,700);
 background(frameCount % 19,19,81);
 println(mouseX + " " + mouseY);
 }
// BACKGROUND
/* To draw the background I will be using a loop to draw horizontal lines
 which change RGB values to create the illusion of a gradient. */

void draw()
{

int x = 0;
float randomX;
float randomY;

stroke(255);
strokeWeight(2);
 

for (int i=0;i<50;i++){
  randomX = random(0,1600);
  randomY = random(0,850);
  point(randomX,randomY);
}


// MOON!!
stroke(200,200,200);
fill(200,200,200);
ellipseMode(CENTER);
smooth();
ellipse(400,200,150,150);
 
 fill(170,168,168);
 ellipse(400,200,20,20);
 
  fill(170,168,168);
 ellipse(415,211,10,10);
 
  fill(170,168,168);
 ellipse(425,248,10,10);
 
 noStroke();
 fill(170,168,168);
 ellipse(430,256,20,20);
 
  fill(170,168,168);
 ellipse(370,211,10,10);
 
  fill(170,168,168);
 ellipse(359,187,20,20);
 
  fill(170,168,168);
 ellipse(450,160,10,10);
 
// Initialization for the buildings
// Each building is hand coded. Perhaps in the future I can create a procedurally generated skyline.
stroke(0);
strokeWeight(2);
smooth();
 
// black buildings
fill(0);
 
//building 1
rect(0,700,200,600);
 
//building 2
rect(200,800,250,600);
 
//building 3
rect(450,500,300,500);
rect(500,450,200,100);
triangle(550,450,650,450,600,300);
 
//building 4
rect(800,800,100,200);
rect(850,600,100,400);
 
//building 5
rect(950,300, 300,700);
rect(1000,250,200,50);
 

 

 
//building 8
rect(1000,800,100,200);
rect(1000,200,200,800);
rect(1000,300,100,700);
rect(1000,400,50,600);
 
//building 9
rect(1400,0,20,900);
rect(1385,50,50,900);
rect(1370,75,80,900);
rect(1335,200,150,900);
rect(1325,210,170,900);
rect(1300,350,220,900);
}

