class TrishaFish {
  int x;
  int y;
  void draw() {
    fill(138, 43, 226);
    stroke(0, 0, 0);
    ellipse(x, y, 70, 30);
    fill(255, 20, 147);
    stroke(0, 0, 0);
    triangle(x-35, y, x-60, y+15, x-60, y-15);
    fill(255, 20, 147);
    fill(0, 0, 0);
    ellipse(x+25, y-3, 5, 5);
    fill(0, 255, 255);
    stroke(255, 255, 255);
    ellipse(x+40, y-20, 10, 10);
    ellipse(x+42, y-40, 8, 8);
  }
  void swim() {
    if (x>width) {
      x=0;
    }
    else {
      x=x+1;
    }
  }
}

