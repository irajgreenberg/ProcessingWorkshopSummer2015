class CountryBall {

  int ranking;
  String name;
  float score;
  float x;
  float y;
  int speed;
  boolean pressed;


  CountryBall(String ranking, String name, String score) {

    this.name=name;
    this.score=float(score);
    this.ranking=int(ranking);
    y=height*9-this.score;
    speed=-1;
    pressed=false;
  }


  void display() {
    noStroke();
    fill(0);
    if (pressed) {

      stroke(255, 215, 0);
      strokeWeight(3);
    }

    ellipse(x, y, score, score);
  }

  void move() {

    if (y<=height-score*50) {

      speed=-speed;
    } else if (y>=height+score) {


      speed=-speed;
    }

    y=y+speed;
  }

  void mouseDisplay() {
    // if (mousePressed){
    if (sqrt(((mouseX-x)*(mouseX-x))+((mouseY-y)*(mouseY-y)))<=score/2) {
      fill(0);
      tempName=name;
      tempScore=score;
      tempRanking=ranking;
      pressed=true;

      ArrayList <CountryBall>tempList=new ArrayList();
      tempList=ballArray;
      //tempList.remove(this);
      for (int i=0; i<tempList.size (); i++) {
        if (tempList.get(i)!=this) {
          tempList.get(i).pressed=false;
        }
      }
    }

    //}
  }
}

