class Lava {
  int x;
  int y;
  int w;
  int h;

  Lava() {
    x=0;
    y=760;  
    w=lava.width;
    h=lava.height;
  }




  void display() {
    image(lava, x, y);
  }
}

