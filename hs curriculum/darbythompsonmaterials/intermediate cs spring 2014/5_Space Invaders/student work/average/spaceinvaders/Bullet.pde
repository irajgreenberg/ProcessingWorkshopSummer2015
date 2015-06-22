class Bullet {
  
  int x;
  int y;
  int speed = -5;
  int width = 2;
  int height = 6;
  
  Bullet(int startx, int starty) {
    x = startx;
    y = starty;
  }



  void draw() {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    rect(x-width/2, y-height/2, width, height);
  }
  void move() {
    x = x;
    y = y + speed;
  }
}

