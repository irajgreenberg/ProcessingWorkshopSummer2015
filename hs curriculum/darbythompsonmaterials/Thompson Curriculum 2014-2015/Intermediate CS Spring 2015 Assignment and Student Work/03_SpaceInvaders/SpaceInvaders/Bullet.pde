class Bullet {
  int bwidth;
  int bheight;
  int bx;
  int by;
  int speed;
  
  Bullet(int startx){
    bwidth=3;
    bheight=25; 
    bx=startx;
    by=game.p.py - bheight;
    speed=5; 
  }
  
 void move(){
    by=by-speed;
  }
  void display(){
    fill(255);
    rect(bx,by,bwidth,bheight);  
  }
} 
