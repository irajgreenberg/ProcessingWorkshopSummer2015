// Something's Fishy - Nick WM

NickFish f ;

void setup() {
  size(800, 800);
  f = new NickFish();
  f.x = 0;
  f.y = (int)random(height);
  f.appear();
}

void draw() {
  background (28, 107, 160);
  f.swim();
  f.appear();
}

