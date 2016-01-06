class Player {

  float x;
  float y;
  float speed;
  int wide;
  int tall; 
  int lives;  //lives
  int score;  //score
  int runCount;//this is from a stupid easter egg that I pulled because it interfered with gameplay
  int speedCount;//this is the counter that is activated when picking up a Detriment, when it reaches the threshold, the player regains their speed
  float speedStore;//this stores the absolute value of what the speed SHOULD be, while speed is the actual speed the ship uses to move
  int ammoCount;//this counts how much ammo the player has

  Player() {
    x=width/2;
    y=height-50;
    wide=100;
    tall=30;
    speed=0;
    lives=3;
    score=0;
    runCount=0;
    speedStore=2.5;
    ammoCount=0;
  }


  void move() {



    x=x+speed;

    if (keyPressed) {
      if (key=='a'||key=='A'||keyCode==LEFT) {//I made it compatible with different control schemes and still works in the event that someone presses CAPSLOCK by accident
        speed=-speedStore;
      }
      if (key=='d'||key=='D'||keyCode==RIGHT) {
        speed=speedStore;
      }
      if (key=='s'||key=='S'||keyCode==DOWN) {
        speed=0;
      }
    }

    if (x-(wide/2)<=0) {
      speed=0;
      x=x+1;//this moves the ship away from the wall by a pixel so it doesn't get stuck forever
    }
    if (x+(wide/2)>=width) {
      speed=0;
      x=x-1;
    }
    if (x+wide/2==width) {
      runCount=runCount+1;//this is from that easter egg. Basically, if the player kept trying to force themself off the right side of the screen, the game would react accordingly
    }
  }

  void display() {

    image(game.ship, x-wide/2, y-tall/2);
  }

  void loseLife(int amt) {

    lives=lives-amt;//simply subtracts "amt" number of lives from the player. picking up a life pack runs player.loseLife(-1);
  }

  void reset(boolean winner) { //resets the player before each level, or after losing. the state of "winner" determines if the score and lives should be reset or carried over

    x=width/2;
    y=height-50;
    wide=100;
    tall=30;
    speed=0;
    if (winner==false) {
      lives=3;  
      score=0;
      ammoCount=0;
    }
    runCount=0;
  }

  void gainPoints(int points) {
    score=score+points;//adds/subtracts a desired number of points from the player
  }

  void loseSpeed() {//this sets the desired speed to 1 and starts the counter

    speed=0;
    speedStore=1;
    speedCount=1;
  }

  void regainSpeed() {//this resets the counter and returns the stored speed to 2.5

    speedStore=2.5;
    speedCount=0;
  }

  void addAmmo(int amt) {
    ammoCount=ammoCount+amt; //similar to loseLife() and gainPoints()
  }
}

