//Game 
GameManager game;
float gravity = 0.03;
void setup() {
  size(1000, 500); 
  game = new GameManager();
}
void draw() {
  background(0);
  game.update();
  game.display();
}
void keyPressed() {
  game.pressed();
}

