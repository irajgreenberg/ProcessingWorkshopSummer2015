protected class Animal implements Obstacle {
  float x;
  float y;
  int Width;
  float speed;
  protected float Height;
  private float speedY;


  protected Animal(int gameSpeed) {
    Height=height/5;
    Width=int(Height)*6/5;//keep scale when change size
    x=width*3/2;
    y=height*5/6;
    speed=gameSpeed;
    speedY=20;
  }
  protected void update(float newY, float newY2) { //newY2 is the y for the rear of the camel newY is the front of the camel both needed to make sure never fall through ground
    if (y+Height-speedY>newY) {
      y=y-speedY;
    } else if (y+Height+speedY<newY2 && y+Height+speedY<newY) {//gravity
      y=y+speedY;
    }
  }
  void display() {
  }
  void move() {
    x=x-speed;
  }
}

