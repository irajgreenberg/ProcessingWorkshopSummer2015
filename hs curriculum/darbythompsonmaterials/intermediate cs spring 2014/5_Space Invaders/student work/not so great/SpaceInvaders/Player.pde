class Player {
  int x;
  int y;
  int speedx;
  int score=0;
  int lives=3;


  Player() {
    x=500;
    y=800;
    speedx= 0;
  }

  void draw() {
    stroke(255);
    fill(255);
    rect(x-40, y, 80, 40);
  }
  void move() {
    x= x+speedx;
    if (x-40<=0) {
      speedx=0;
    }
    if (x+40>=1000) {
      speedx=0;
    }
  }
  void action(char a) {
    if (a=='d') {
      speedx=5;
    }
    else if (a== 'a') {
      speedx=-5;
    }
    else if (a== 's') {
      speedx=0;
    }
  }
}

