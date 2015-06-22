class MovingPlatform extends Platform {
  //combination in functionality bewteen a platform and enemy
  private int moveWay;//horizontal vs vertical
  private int moveSpeed;
  private int moveType;
  private int endPos;//endPos is always RIGHT of startPos for horizontal
  private int startPos;

  MovingPlatform() {
  }

  MovingPlatform(int startX, int startY, int wideIt, int tallIt, int moveSpeedIt, int endPosIt, int moveTypeIt, int typeIt) {
    x=startX;
    y=startY;
    speed=3;
    wide=wideIt;
    tall=tallIt;
    moveSpeed=moveSpeedIt;
    endPos=endPosIt;
    moveType=moveTypeIt;
    if (moveType==1) {
      startPos=x;
    } else {
      startPos=y;
    }
    type=typeIt;
  }

  public void move() {

    super.move();//just like a platform
    if (moveType==1) {//1=horizontal, 2=vertical
      x=x+moveSpeed;
      if (x>=endPos&&moveSpeed>0) {//but also has to move on its own
        moveSpeed=-moveSpeed;
      }
      if (x<=startPos&&moveSpeed<0) {
        moveSpeed=-moveSpeed;
      }
      if (way==1) {
        startPos=startPos-speed;//and has to update its startposition and endposition so they stay the same relative to the level, not the screen
        endPos=endPos-speed;
      }
      if (way==-1) {
        startPos=startPos+speed;
        endPos=endPos+speed;
      }
    } else {//for vertical, start and end pos are constant because relative y position does not change
      y=y+moveSpeed;
      if (y<=endPos) {
        moveSpeed=-moveSpeed;
      }
      if (y>=startPos) {
        moveSpeed=-moveSpeed;
      }
    }
  }
}

