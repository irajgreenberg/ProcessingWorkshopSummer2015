class Player {
  float x;
  float y;
  int pwidth;
  int pheight;
  PImage sship;
  float a;
  float b;
  float c;
  float speed;
  Player(float a2, float b2, float c2) {
    a = a2;
    b = b2;
    c = c2;
    speed = 0;
    x = width/2;
    y = height/2;
    pwidth = 50;
    pheight = 50;
    sship = loadImage("http://wscont1.apps.microsoft.com/winstore/1x/51398a67-b20c-4561-8e0c-cbd1468b91af/Icon.166163.png");
  }
  void update(float jumpspeed2) {
    y = y + speed;
    //speed = speed *jumpspeed2;
    speed = speed + gravity;
    //gravity = gravity *.95;
  }
  void jump(float jumpspeed) {
    speed = jumpspeed;
  }
  void display() {
    fill(255, 255, 255);
    rect(x-(pwidth/2), y-(pheight/2), pwidth, pheight);
    image(sship, x-(pwidth/2), y-(pheight/2));
  }
}

