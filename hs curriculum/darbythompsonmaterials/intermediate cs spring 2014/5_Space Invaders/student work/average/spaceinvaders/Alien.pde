class Alien {
  int x;
  int y;
  int speed;
  int width;
  int height;
  PImage img;

  Alien(int startx, int starty) {
    x = startx;
    y = starty;
    speed = 1;
    width = 60;
    height = 40;
    img = loadImage("alien.gif");
  }

  void move() {
    x = x + speed;
  }

  void draw() {
    //stroke(255);
    //fill(255);
    //beginShape();
    //rect(x-width/2, y-height/2, width, height);
    image(img,x-width/2,y-height/2,width,height);
    
  }
}

