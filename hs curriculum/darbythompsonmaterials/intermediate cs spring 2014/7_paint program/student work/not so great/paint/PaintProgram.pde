class PaintProgram {

  int shape = 0;

  ArrayList<DrawableObject> d;
  PaintProgram() {
    d = new ArrayList<DrawableObject>();
  }



  void display() {
    for (DrawableObject q: d) {
      q.draw();
    }
  }


  void action(char key) {
    if (key == 'l') {
      shape = 1;
    }
    if (key == 'r') {
      shape = 2;
    }
    if (key == 'e') {
      shape = 3;
    }
    if (key == 't') {
      shape = 4;
    }
    if (key == 'c') {
      d.clear();
    }
    if (key == 'u') {
      for (int a = 0; a < d.size() - 1; a++) {
        d.remove(d.size() - 1);
      }
    }
  }

  void createshape() {
    if (shape == 0) {
    }
    if (shape == 1) {
      d.add(new Line());
    }
    if (shape == 2) {
      d.add(new Rectangle());
    }
    if (shape == 3) {
      d.add(new Circle());
    }
    if (shape == 4) {
      d.add(new Triangle());
    }
  }

  void objectsize() {
    if (d.size() > 0) {
      d.get(d.size()-1).update();
    }
  }
  }


