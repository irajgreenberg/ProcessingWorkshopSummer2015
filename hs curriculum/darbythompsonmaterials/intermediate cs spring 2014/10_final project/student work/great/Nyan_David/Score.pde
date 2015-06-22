class Score {

  int value;
  int counter;
  int highScore;

  Score() {
    value=0;
    counter=0;
    highScore=0;
  }

  void update() {
    counter=counter+1;
    if (counter%20==0) {
      value=value+10;
    }
    highScore=max(highScore,value);
  }

  void draw() {
    stroke(255,150,100);
    fill(255,150,100);
    textSize(24);
    textAlign(LEFT, TOP);
    text(Integer.toString(value), 10, 10);
    textAlign(RIGHT, TOP);
    text("High Score: " + Integer.toString(highScore), width-10, 10);
  }
}
