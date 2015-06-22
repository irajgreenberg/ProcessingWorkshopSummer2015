//James Sams SpaceBoarding; it's like skateboarding, BUT IN SPACE!!!
import ddf.minim.*;
GameManager game;
AudioPlayer player;
Minim minim;
void setup() {
  size(600, 600);
  game = new GameManager();
  minim = new Minim(this);
  player = minim.loadFile("greenhillzone.mp3",2048);
  player.play();
  player.loop();
}

void draw() {
  background(0);
  game.update();
  game.display();
}

void keyPressed() {
  game.action(key);
}
