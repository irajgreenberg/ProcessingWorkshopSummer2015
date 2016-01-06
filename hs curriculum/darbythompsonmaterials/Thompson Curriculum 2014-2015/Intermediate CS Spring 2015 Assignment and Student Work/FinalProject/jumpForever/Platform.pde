class Platform extends SquareThing{

  
  public int speed;
  public int way;
  public int type;//do you collide with bottom or not?
  
  Platform(){
    
  }

  Platform(int startX, int startY, int wideIt, int tallIt, int typeIt) {

    x=startX;
    y=startY;
    wide=wideIt;
    tall=tallIt;
    speed=3;
    type=typeIt;
  }

  public void move() {

    if (way==1) {
      x=x-speed;
      
    }
    if (way==-1) {
      x=x+speed;
     
    }
  }

  public void display() {
    if (type==1) {//1 is "open" bottom, 2 is solid bottom
      fill(139, 66, 10);//brown
    }
    else if (type==2){
      fill(157, 157, 157);//gray
    }
    noStroke();
    rectMode(CENTER);
    rect(x, y, wide, tall);
  }

  public void changeDirection(int direction) {

    way=direction;
  }
}

