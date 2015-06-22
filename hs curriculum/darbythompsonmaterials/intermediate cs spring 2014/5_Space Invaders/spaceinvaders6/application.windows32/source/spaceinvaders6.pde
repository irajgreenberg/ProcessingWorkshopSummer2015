SpaceInvaders game;

void setup(){
  size(1000,1000);
  game = new SpaceInvaders();  
}


void draw(){
  background(0);
  game.update();
  game.display();
}


void keyPressed(){
  game.action(key); 
}
