//Space Invaders game
//234450 at level 7 is my high score. See if you can beat it!

//this is basically your run-of-the-mill setup stuff
GameManager game;

void setup() {
  size(1000, 1000);
  game = new GameManager();
}


void draw() {
  //background(0);
  game.update();
  game.display();
}

