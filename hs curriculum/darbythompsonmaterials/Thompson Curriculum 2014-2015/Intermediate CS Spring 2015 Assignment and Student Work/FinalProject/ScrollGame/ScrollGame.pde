/*
Name: 

 Project: 2D Scroll game IntCS Final Project
 
 Tasks:
 bugs:
 looks like player on platform but die?
 camels fall through ground √
 players glitches through/past holes 
 camel/eagle spawns to make game impossible
 */
//import minim for sound
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
private Minim minim;
//gameManager
private GameManager game;
//images ie characters and background
private PImage background;//playing images
private PImage character;
private PImage camel;//animal images
private PImage camel2;
private PImage eagle;
private PImage background2;//end game images
private PImage character2; //second copy for endgame to avoid distortion
//song to play
private AudioPlayer[] music;
void setup() {
  size(1000, 600);
  game= new GameManager();
  //images for animals and player
  character=loadImage("explorer2.png");
  camel=loadImage("camel.png");
  camel2=loadImage("camel2.png");
  eagle=loadImage("eagle5.png");
  character2=loadImage("explorer2.png");
  //background images
  background=loadImage("sahara copy.jpg");
  background.resize(width, height);
  background2=loadImage("tomp.jpg");
  background2.resize(width, height);
  //audio
  minim = new Minim(this);
  music=new AudioPlayer[5];
  music[0]= minim.loadFile("The Lion King - Circle of Life.mp3");
  music[1] = minim.loadFile("Ancient Egyptian Music - Desert Mercenaries.mp3");
  music[2]= minim.loadFile("Ancient Egyptian Music - Cleopatra.mp3");
  music[3] = minim.loadFile("Circle of Life (Instrumental) The Lion King Musical.mp3");
  music[4] = minim.loadFile("Ancient Egyptian Music - Desert Mercenaries.mp3");
}
void draw() {
  background(background);
  noStroke();
  //game manager methods:
  game.display();
  if (game.gameMode==1) {
    game.update();
  }
  game.gameMode();
}
void keyPressed() {
  game.input();
}

void keyReleased() {
  game.noInput();
}

