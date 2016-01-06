class Palette {

  color hoverColor;
  color chosenColor;

  Palette() {
    hoverColor = 0;
    chosenColor = 0;
  }

  void draw() {
    stroke(0);
    fill(hoverColor);
    rect (57.5, 485, 42.5, 40);
    stroke(0);
    fill(chosenColor);
    rect (10, 485, 42.5, 40);
  }

  void update() {
    if (abs(mouseX-55)<45 && (abs(mouseY-410)<70 || abs(mouseY-640)<110)) {
      hoverColor = pixels[mouseY*width+mouseX];
    }
  }

  void selectColor() {
    if (abs(mouseX-55)<45 && (abs(mouseY-410)<70 || abs(mouseY-640)<110)) {
      chosenColor = pixels[mouseY*width+mouseX];
    }
  }
}

