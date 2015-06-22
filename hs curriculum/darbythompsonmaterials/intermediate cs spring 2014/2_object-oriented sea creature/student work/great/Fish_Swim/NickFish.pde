class NickFish {

  int x;
  float y;

  void appear() {
    noStroke();
    fill(100, 101, 102);
    triangle(x+40, y, x-20, y-70, x-30, y);
    triangle(x, y, x-85, y-30, x-85, y+30);
    ellipse(x, y, 120, 70);
    fill(0, 0, 0);
    ellipse(x+40, y-12, 8, 8);
  }

  void swim() {
    x = x+2;
    y = y+(2*sin(radians(x)));
    if (x+60 > width) {
      x = 0;
      y = (int)random(height);
    }
  }
} 

