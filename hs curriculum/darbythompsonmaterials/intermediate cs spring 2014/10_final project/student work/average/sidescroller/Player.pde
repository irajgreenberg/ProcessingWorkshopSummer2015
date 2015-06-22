class Player{
  int x;
  int y;
  int speed;
  int a=0;
  int score;
  int lives;
  
  Player (int startx, int starty, int startspeed, int startscore, int startlives){
    x=startx;
    y=starty;
    speed=startspeed;
    score=startscore;
    lives=startlives;
  }
  
  void draw(){
    fill(255,0,0);
    rect(x,y,15,15);
  }
  
  void move(){
    y=y+speed;
    if (speed<10){
      speed++;
    }
  }
  
  void jump(){
    if (a==0||a==1){
      speed=-15;
      a++;
    }
  }
}
