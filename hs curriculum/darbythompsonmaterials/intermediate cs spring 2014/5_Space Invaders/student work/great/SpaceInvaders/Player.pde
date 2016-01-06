class Player {

  float x;
  float y;
  float v;
  float vi;
  int lives;
  int score;
  float w;
  float h;

  Player(float startx, float starty, float startvi, int startlives, int startscore, float startw, float starth) {
    x = startx;
    y = starty;
    vi = startvi;
    lives = startlives;
    score = startscore;
    w = startw;
    h = starth;
    v = 0;
  }

  void draw() {
    stroke(0);
    fill(255);
    rect(x, y, w, h);
  }

  // moves left, right, and when the keys left, right, and down are pressed, respectively
  void action() {
    if (keyCode==LEFT) {
      v=-vi;
    }
    if (keyCode==RIGHT) {
      v=vi;
    }
    if (keyCode==DOWN) {
      v=0;
    }
  }

  // will move within the bounds of the screen
  void move() {
    if (x>=800-w) {
      v=0;
      x=799-w;
    }
    if (x<=0) {
      v=0;
      x=1;
    }
    if (v>0) {
      v=vi;
    }
    x=x+v;
  }
}

