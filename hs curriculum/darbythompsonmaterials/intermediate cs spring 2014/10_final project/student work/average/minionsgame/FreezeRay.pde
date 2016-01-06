class FreezeRay {
  int x;
  int y;
  int speed;
  int size;
 
 FreezeRay(int startx, int starty) {
   x=startx;
   y=starty;
   speed=15;
 }
  
  void move() {
    x=x-speed;

  }
  void draw() {
    fill(0,255,255);
    rect(x,y,200,40);
  }
}

