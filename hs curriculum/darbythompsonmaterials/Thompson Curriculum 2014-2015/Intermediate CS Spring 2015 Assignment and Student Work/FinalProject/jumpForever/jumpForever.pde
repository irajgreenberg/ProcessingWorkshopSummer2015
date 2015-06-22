//Sidescrolling game
//TO DO: 
//move the collision things
//title menu??
//make actual levels

//bug list:
//FIXED: do not jump if you are touching the left wall?? you will DIE
//now you can force yourself into the left wall so try not to do that :( sorry
//moving platform is glitchy
//snoo can can bump you past the back wall and you will DIE

//NOTE: Second level is unfinished. It is beatable, but third pepe is not in right place/coins are not done
//also thanks to darby for allowing me to basically turn in an internet meme as my final project

import ddf.minim.spi.*;//sorry darby if this stuff should be in gamemanager
import ddf.minim.signals.*;//this imports the minim library, which handles sound stuff
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;

Gamemanager g;

AudioPlayer yee;  //sets up my yee wound effect
AudioPlayer soundtrack;//and the background music


void setup() {
  minim=new Minim(this);
  yee=minim.loadFile("yee.wav");
  soundtrack=minim.loadFile("You're Correct Horse.mp3");//loads that music
  size(900, 700);//window
  g=new Gamemanager();//gamemanager
}

void draw() {

  g.display();
  g.update();
}

void keyPressed() {
  g.keyPress();
}

void keyReleased() {
  g.keyRelease();
}

void mousePressed() {
  g.click();
}

