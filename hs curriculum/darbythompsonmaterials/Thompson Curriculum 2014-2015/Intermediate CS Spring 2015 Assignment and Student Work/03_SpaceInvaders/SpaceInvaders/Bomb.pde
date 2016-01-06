class Bomb {
  int mwidth;
  int mheight;
  int mx;
  int my;
  int speed;
  
  Bomb(int startx, int starty){
    mwidth=10;
    mheight=10; 
    mx=startx;
    my=starty;
    speed=2; 
  }
  
 void move(){
    my=my+speed;
  }
  void display(){
    fill(255,0,0);
    rect(mx,my,mwidth,mheight);  
  }
} 
