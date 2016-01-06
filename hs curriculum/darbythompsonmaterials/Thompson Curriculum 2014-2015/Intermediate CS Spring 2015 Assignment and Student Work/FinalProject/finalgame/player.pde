class Player {
  int x;
  float y;
  int w;
  int h;
  int speedx;
  float speedy;
  int speed2;
  boolean fall;
  int score;
  int life;
  



  Player( int startx, int starty) {
    x=startx;
    y=starty; 
    w=50;
    h=50;
    speedy=10;
    speedx=10;
    fall=true;
    score=0;
   
  }

  void fall(float gravity) {
    y=y-speedy;
    speedy=speedy-gravity;

    if (y+h>=760 && fall==true) {
      speedy=0;
      y=760-h;
    }
  }

  void jump() {

 
    if (y>-(w+10)){
      if (keyPressed && key==' ') {
        speedy=15;
      
      }
  }
}

void move() {
  if (keyPressed && key== CODED && keyCode==RIGHT && x+w<=width) {
    x=x+speedx;
  }
  if(keyPressed && key== CODED && keyCode==LEFT && x>=0){
     x=x-speedx; 
    
  }
}


void forced() {
  x=x+speed2;
}

void display() {
  fill(232, 62, 28);
  stroke(232, 62, 28);
  rect(x, y, w, h);
}
}
