/*
Version of traditional Space Invaders game.
 Made by Nikhil Chaudhuri.
 */

GameManager spaceinvaders;

// creates background and GameManager
void setup() {
  size(800, 800);
  spaceinvaders = new GameManager();
}

// updates game and display
void draw() {
  background(0);
  spaceinvaders.update();
  spaceinvaders.display();
}

// handles key presses
void keyPressed() {
  if (key == CODED) {
    spaceinvaders.action(key);
  }
}

