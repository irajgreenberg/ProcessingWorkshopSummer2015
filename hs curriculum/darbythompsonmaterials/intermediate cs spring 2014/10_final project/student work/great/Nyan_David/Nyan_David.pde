import ddf.minim.*;


GameManager boss;
nyanDavid kittens;
ArrayList<Earth> platforms;
ArrayList<Bomb> bombs;
boolean gameStarted;
Score score;
int counter;
AudioPlayer music;
Minim minim;

void setup() {
  boss = new GameManager();
  size(800, 800);
  minim = new Minim(this);
  music = minim.loadFile("Nyan David music.mp3", 2048);
  //music.play();
  noLoop();
}

void draw() {
  background(0);
  boss.draw();
  boss.update();
}

void keyPressed() {
  boss.action(key);
}

void mousePressed() {
  boss.click();
}

