class Artsulation {

  Artsulation() {
  }

  void draw() {
    stroke(255);
    fill(255);
    beginShape();
    vertex(0, 0);
    vertex(800, 0);
    vertex(800, 760);
    vertex(0, 760);
    vertex(0, 751);
    vertex(791, 751);
    vertex(791, 9);
    vertex(109, 9);
    vertex(109, 751);
    vertex(0, 751);
    vertex(0, 0);
    endShape();
  }
}

