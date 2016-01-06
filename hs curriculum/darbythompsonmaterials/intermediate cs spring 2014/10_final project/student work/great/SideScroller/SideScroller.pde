GameManager game;

import ddf.minim.*;

AudioPlayer player;
Minim minim;

void setup() {
  size(900, 900);
  game = new GameManager(); //creates game
  minim = new Minim(this); //creates music player
  player = minim.loadFile("BlackoutCity.mp3", 2048); //loads music
  player.loop(); //loops music
}

void draw() {
  game.update(); //updates the games
  game.display(); //displays things in the game
}

void keyPressed() {
  game.action(key); //checks what key has been pressed
}

void stop(){
  player.close(); //stops the music when the game is closed
  minim.stop();
  super.stop();
}
