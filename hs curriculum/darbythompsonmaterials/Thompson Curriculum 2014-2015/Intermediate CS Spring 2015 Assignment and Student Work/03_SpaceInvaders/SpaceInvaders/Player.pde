class Player {
  int px;
  int py;
  int lives;
  int score;
  int speed;
  int pwidth;
  int pheight;
  boolean shots; 
  Player(){
    pwidth=100;
    pheight=50; 
    px=(width-pwidth)/2;
    py=height-pheight;
    lives=3;
    score=0;
    speed=3;
  }
  
 void move(){
    px=px+speed;
    if (key=='a'){
      speed=-3;        
    }
    if (key=='d'){
      speed=3;    
    }
    if (key=='s'){
      speed=0;  
    } 
    if (px>width-pwidth){
      speed=0;
      px=px-1; 
    }
    if (px<0){
      speed=0;
      px=px+1;  
    }
  }
  void display(){
    fill(0,255,0);
    rect(px,py,pwidth,pheight);  
  }
} 
