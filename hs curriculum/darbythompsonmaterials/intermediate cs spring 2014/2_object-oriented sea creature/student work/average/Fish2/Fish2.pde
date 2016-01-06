//Trisha Miglani's beautiful sea creature
TrishaFish f;
void setup() {
  size(800, 800);
  f=new TrishaFish();
  f.x=(int)random(width);
  f.y=(int)random(height);
  f.draw();
}
void draw() {
  background(0, 0, 255);
  f.draw();
  f.swim();
}
void mouseClicked() {
}

