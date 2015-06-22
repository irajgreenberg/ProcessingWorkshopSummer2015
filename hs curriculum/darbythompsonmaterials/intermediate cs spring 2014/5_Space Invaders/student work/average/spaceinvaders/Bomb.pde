class Bomb {
  
  int x;
  int y;
  int speed;
  int width;
  int height;  
  
  Bomb(int startx, int starty) {
    x = startx;
    y = starty;
    speed = 2;
    width = 4;
    height = 6;
  }
  
  void draw() {
    stroke(255, 0, 0);
    fill(255, 0, 0);
    rect(x-width/2, y-height/2, width, height);    
  }
  
  void move() {
    y = y + speed;
  }
}
