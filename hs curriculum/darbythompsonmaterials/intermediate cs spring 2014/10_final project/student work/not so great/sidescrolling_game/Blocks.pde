class Blocks {
  int x;
  int y=0;
  int yy;
  int speedx = -5;
  int r = int(random(100, 550));
  
  Blocks(int startx, int starty) {
    x = startx;
    y = starty;
    
    
    
  }
  

  void draw() {
    
    fill(115,191,46);
    rect(x, y, 110, r);

    yy=r+250;
    fill(115,191,46);
    stroke(0);
    rect(x, yy, 110, 900);

    
  }

  void move() {
   x=x+speedx;   
  }
}
