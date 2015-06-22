class Game {
  int scoreFor;
  int scoreAgainst;
  int theSize;
  String oppon;
  Boolean NatLe;
  Boolean NLEast;
  Game(int a, int b, String c) {
    scoreFor = a;
    scoreAgainst = b;
    theSize=5;
    oppon = c;
    NLEast=false;
    if (oppon.equals("MIA")||oppon.equals("PHI")||oppon.equals("ATL")||oppon.equals("NYM")) {
      NLEast=true;
    }
    NatLe=false;
    if (NLEast==true||oppon.equals("SFG")||oppon.equals("LAD")||oppon.equals("COL")||oppon.equals("CDP")||oppon.equals("ARI")||oppon.equals("CIN")||oppon.equals("CHC")||oppon.equals("STL")||oppon.equals("PIT")||oppon.equals("MIL")) {
      NatLe=true;
    }
    for (int i=0;i<Games.size();i++) {
      if (Games.get(i).scoreFor==scoreFor&&Games.get(i).scoreAgainst==scoreAgainst) {
        theSize=theSize+5;
      }
    }
  }

  void plot() {
    ellipse(scoreFor*50+15, height-scoreAgainst*50-15, theSize, theSize);
  }
}

