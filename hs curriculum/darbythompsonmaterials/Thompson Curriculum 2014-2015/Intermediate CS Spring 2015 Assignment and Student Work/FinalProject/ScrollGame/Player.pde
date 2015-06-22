private class Player {
  float x;
  float y;
  float speedY;
  int Width;
  float Height;
  protected int lives;
  private int maxLives;
  private float score;
  private int[] highScore;
  private  int jumpCounter;
  private  float jumpMax;
  private  float jumpSpeed;
  private ArrayList<Life> lifes; //spelt wrong on purpose to distinguish


  private Player() {
    maxLives=5;
    lives=maxLives;
    x=width/6;
    Height=height/6;
    Width=int(Height)/2;
    y=height/4;
    speedY=10;
    jumpCounter=0;
    jumpMax=60;
    lifes = new ArrayList<Life>();
    highScore= new int[1];
    highScore[0]=0;
    highScore=int((loadStrings("highScore.dat")));
  }
  private void display() {
    character.resize(Width, int(Height)+1);
    image(character, x, y);
    fill(#835F30);
    textSize(20);
    text(int(score), width/2, 20);
    text(highScore[0], width/4, 20);
    for (Life l : lifes) {
      l.display();
    }
  }
  private   void move(boolean jump, boolean onGround) {
    //jump
    jumpCounter++;
    if (jump==true && jumpCounter<jumpMax) {
      y=y-jumpSpeed;
      jumpSpeed=jumpSpeed-0.5;
    }

    if (onGround==true && jump==false) {
      jumpCounter=0;
      jumpSpeed=speedY*3;
    }
  }
  private  void update(float ground, int gameMode) {
    jumpMax=ground/speedY;
    updateLives();
    highScore();
    if (lives>0) {
      score();
    } else {
      score=0;
    }
  }
  private void updateLives() {
    if (lifes.size()<lives) {
      lifes.add(new Life(lifes.size()));
    } else if (lifes.size()>lives) {
      lifes.remove(lifes.size()-1);
    }
  }
  private void highScore() {
    if (score>highScore[0]) {
      highScore[0]=int(score);
      saveStrings("highScore.dat", str(highScore));
      fill(0, 200, 0);
      text("NEW HIGHSCORE", width/2, height/2);
    }
  }
  private void score() {
    score=score+0.01;
  }
}

