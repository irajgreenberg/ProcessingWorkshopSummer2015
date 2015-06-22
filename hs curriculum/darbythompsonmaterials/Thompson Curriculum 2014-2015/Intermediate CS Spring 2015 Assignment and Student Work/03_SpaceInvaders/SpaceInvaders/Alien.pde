class Alien {
  int awidth;
  int aheight;
  int ax;
  int ay;
  int speed;
  
  Alien(int startx, int starty){
    awidth=40;
    aheight=40; 
    ax=startx;
    ay=starty;
    speed=1; 
  }
  
 void move(){
    ax=ax+speed;
  }
  void bounce(){
    speed=-speed;
    ay=ay+aheight;  
  }
  void display(){
    fill(255);
    rect(ax,ay,awidth,aheight);  
  }
} 
