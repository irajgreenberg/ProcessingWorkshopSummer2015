private class Camel extends Animal {  
  private Camel(int gameSpeed) {
    super(gameSpeed);
    speed=gameSpeed+int(random(4, 6));
  }
  void display() {
    camel.resize(Width, int(Height));
    image(camel, x, y);
  }
}

