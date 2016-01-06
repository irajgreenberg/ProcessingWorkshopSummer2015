//Trisha Miglani's final project game
GameManager game;

void setup() {
  size (1500, 800);
  game=new GameManager();
} 
void draw() {
  background(0);
  game.display();
  game.update();
}
void keyPressed() {
  game.action(key);
}

