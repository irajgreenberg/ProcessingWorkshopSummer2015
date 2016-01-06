class Enemy extends SquareThing {//this is a little more complicated

  private int speed;
  private float downSpeed;
  private int way;
  private int startPos;
  private int endPos;//endPos is always LEFT of startPos
  private int moveSpeed;//this generally should be set to a negative value if above is true 
  public boolean ground;
  private PImage pic1;
  private PImage pic2;
  private PImage currentPic;
  private int picCount;

  Enemy(int startX, int startY, int moveSpeedIt, int endPosIt) {
    x=startX;
    y=startY;
    startPos=x;
    downSpeed=0.8;//this is same as player, because it is also affected by gravity
    wide=43;
    tall=60;
    moveSpeed=moveSpeedIt;
    endPos=endPosIt;
    speed=3;
    ground=false;
    pic1=loadImage("reddit.png");
    pic2=loadImage("reddit2.png");
    currentPic=pic1;
    picCount=0;
  }

  public void move(float grav) {
    if (way==1) {
      x=x-speed;
    } else if (way==-1) {//yep
      x=x+speed;
    }
    if (ground==false) {
      y=int(y+downSpeed);
      downSpeed=downSpeed+grav;//this is landing stuff just like the player
    }
    x=x+moveSpeed;
    if (x>=startPos&&moveSpeed>0) {
      moveSpeed=-moveSpeed;
    }
    if (x<=endPos&&moveSpeed<0) {
      moveSpeed=-moveSpeed;
    }
    if (way==1) {
      startPos=startPos-speed;// has to update its startposition and endposition so they stay the same relative to the level, not the screen
      endPos=endPos-speed;
    }
    if (way==-1) {
      startPos=startPos+speed;
      endPos=endPos+speed;
    }
  }

  public void land(int spot) {
    y=spot-tall/2;
    ground=true;//more detail in player
  }

  public void drop() {
    ground=false;  //more detail in player
    downSpeed=0.8;
  }

  public void changeDirection(int direction) {
    way=direction;//yep
  }

  public void display() {
    imageMode(CENTER);
    image(currentPic, x, y);
    if (picCount==30) {
      currentPic=pic2;
    } else if (picCount==60) {//switched between the left foot and right foot being raised
      currentPic=pic1;
      picCount=0;
    }
    picCount++;
  }
}

