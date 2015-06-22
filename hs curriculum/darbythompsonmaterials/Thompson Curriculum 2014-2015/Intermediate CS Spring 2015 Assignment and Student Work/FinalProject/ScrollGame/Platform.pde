private class MovingPlatform {
  float x;
  float y;
  int Width;
  float speed;

  private MovingPlatform(float newX, float newY, float gameSpeed) {
    y=height-height/6;
    y=newY;
    Width=width/int  (random(4, 5));
    x=newX;
    speed=gameSpeed;
  }
  private void display() {
    noStroke();
    fill(#F0BD5E);
    rect(x, y, Width, height, 50);
  }
  private void move(float gameSpeed) {
    speed=gameSpeed;
    x=x-speed;
  }
}  

