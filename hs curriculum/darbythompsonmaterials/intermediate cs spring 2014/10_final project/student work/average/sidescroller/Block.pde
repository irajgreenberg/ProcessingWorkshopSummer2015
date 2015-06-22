class Block{
  int x;
  int y;
  int w;
  int speed;
  int l;
  
  Block(int startx, int starty, int startw, int startspeed, int startl){
    x=startx;
    y=starty;
    w=startw;
    speed=startspeed;
    l=startl;
  }
  
  void draw(){
    rect(x,y,w,20);
  }
  
  void move(){
    x=x+speed;
  }
  
  
}
