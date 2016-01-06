class Bomb {

  PImage bomb;
  int x;
  int y;
  int v;

  Bomb(int startx, int starty) {
    bomb = loadImage("bomb.png");
    x=startx;
    y=starty;
    v=platforms.get(0).v;
  }

  void update() {
    x=x-v;
    v=platforms.get(0).v;
  }

  void draw() {
    noTint();
    image(bomb, x-25, y-25, 50, 50);
  }
}

