class Player {
  int x;
  int y;
  int lives;
  int score;
  int speed;
  int width;
  int height;
  PImage img;
  
  Player(){
  x = 500;
  y = 900;
  lives = 3;
  score = 0;
  speed = 2;
  width = 100;
  height = 60;

  }
  
  void draw() {
    stroke(0,255,0);
    fill(0,255,0);
    rect(x-width/2,y-height/2,width,height);


  }
  
  void move() {
    x = x + speed;
    y = y;
    if (x+width/2 > 1000 || x-width/2 < 0) {
      speed = 0;
    }
  }
}


