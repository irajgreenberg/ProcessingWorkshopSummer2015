//Minions game
GameManager minions;
PImage m;

void setup() {
  size(1000, 1000);
  minions= new GameManager();
  m=loadImage("lotsofminions.jpg");
}

void draw() {
  background(0,0,255);
  image(m,0,0,width, height);
  fill(0);
  rect(0, 800, 1000, 200);
  minions.update();
  minions.display();
}
void keyPressed() {
  minions.action(key);
}
