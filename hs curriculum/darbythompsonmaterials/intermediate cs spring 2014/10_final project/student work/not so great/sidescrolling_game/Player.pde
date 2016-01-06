class Player {
  int x;
  int y;
  int width = 55;
  int height = 55;
  int speedy = 15;
  PImage flappy;

  
  Player() {
    x = 300;
    y = 450;
    flappy = loadImage("flappybird copy copy.png");
  }
   
   
  void draw() {
    image(flappy, x, y);
    //fill(255, 0, 0);
    //ellipse(x, y, width, height);
  }

  void move() {
    y=y+speedy;
    if (speedy<15){
      speedy=speedy+1;
      if (y+height>950){
        speedy=0;
      }
    }

  }
  
  void action(char key){
    if (key == CODED) {
      if (keyCode == UP) {
          speedy = -15;
        }
      }
    }
}
