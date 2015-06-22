private class Eagle extends Animal {
  private Eagle(int gameSpeed) {
    super(gameSpeed);
    y=int(random(0, height/3));
    speed=gameSpeed+int(random(7, 9));
  }
   void display() {
    eagle.resize(Width, int(Height));
    image(eagle, x, y);
  }
  private float t=0.0;//sin wave variables
  private float amplitude=1;
  private void update() {
    y=amplitude*cos(t)+y;
    t=t+.05;
  }
}

