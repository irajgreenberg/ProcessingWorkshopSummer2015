class Pepe extends SquareThing {
//simple enough

  private int speed;

  private PImage pic;
  private int way;

  Pepe(int startX, int startY) {

    x=startX;
    y=startY;
    speed=3;
    tall=60;
    wide=60;
    pic=loadImage("pepe.png");
  }

  public void display() {
    imageMode(CENTER);
    image(pic, x, y);
  }

  public void move() {

    if (way==1) {//regular joe
      x=x-speed;
    }
    if (way==-1) {
      x=x+speed;
    }
  }

  public void changeDirection(int direction) {

    way=direction;
  }
}

