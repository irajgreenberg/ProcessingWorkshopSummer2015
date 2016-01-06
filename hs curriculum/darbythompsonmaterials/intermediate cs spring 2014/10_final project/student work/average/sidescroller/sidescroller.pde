GameManager game;

void setup(){
  size(800,800);
  game = new GameManager();
}

void draw(){
  background(0);
  game.update();
  game.display();
}

void keyPressed(){
  game.action(key);
}
