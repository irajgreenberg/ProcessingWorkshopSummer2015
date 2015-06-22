private class Camel2 extends Animal {
  private Camel2(int gameSpeed) {
    super(gameSpeed);
    speed=gameSpeed+int(random(7, 9));//faster than regular camel
  }
   void display() {
    camel2.resize(Width, int(Height));
    image(camel2, x, y);
  }
}

