class Layout {
  PImage palette;
  PImage undo;
  PImage redo;


  Layout() {
    palette = loadImage("palette.png");
    undo = loadImage("undo.png");
    redo = loadImage("redo.png");
  }

  void draw() {
    // Draws the gradient of colors to choose from.
    stroke(0);
    fill(255);
    rect(9, 339, 91, 141);
    image(palette, 10, 340 );

    // Creates the "New", "Save", "Undo", and "Redo" buttons.
    textSize(12);
    stroke(0);
    fill(224, 255, 255);
    rect(10, 10, 40, 25);
    fill(127, 255, 212);
    rect(60, 10, 40, 25);
    fill(72, 209, 204);
    rect(10, 45, 40, 25);
    rect(60, 45, 40, 25);
    image(undo, 19, 48);
    image(redo, 71, 48);

    // Creates the buttons for tool selection.
    fill(220);
    for (int i=0; i<5; i++) {
      rect(10, 80+i*30, 90, 20);
    }

    // Creates the line weight selection button.
    rect(10, 230, 90, 100);
    for (int i=0; i<4; i++) {
      fill(0);
      strokeWeight(i+1);
      line(20, 257.5+i*20, 70, 257.5+i*20);
      fill(255);
      strokeWeight(1);
      rect(80, 250+i*20, 15, 15);
    }

    // Creates the set color tabs.
    fill(255, 0, 0);
    rect(10, 530, 90, 10);
    fill(255, 128, 0);
    rect(10, 545, 90, 10);
    fill(255, 255, 0);
    rect(10, 560, 90, 10);
    fill(128, 255, 0);
    rect(10, 575, 90, 10);
    fill(0, 255, 0);
    rect(10, 590, 90, 10);
    fill(0, 255, 128);
    rect(10, 605, 90, 10);
    fill(0, 255, 255);
    rect(10, 620, 90, 10);
    fill(0, 128, 255);
    rect(10, 635, 90, 10);
    fill(0, 0, 255);
    rect(10, 650, 90, 10);
    fill(128, 0, 255);
    rect(10, 665, 90, 10);
    fill(255, 0, 255);
    rect(10, 680, 90, 10);
    fill(255, 0, 128);
    rect(10, 695, 90, 10);
    fill(128);
    rect(10, 710, 90, 10);
    fill(255);
    rect(10, 725, 90, 10);
    fill(0);
    rect(10, 740, 90, 10);
    fill(0);

    // Names/labels the various buttons.
    textAlign(LEFT);
    text("Weight:", 18, 248);
    textAlign(CENTER);
    text("New", 30, 27.5);
    text("Save", 81, 27.5);
    text("Line", 55, 95);
    text("Ellipse", 55, 125);
    text("Rectangle", 55, 155);
    text("Squiggly", 55, 185);
    text("Hexagon", 55, 215);

    // Moves a little black circular cursor to the currently selected tool.
    if (ArtPatron.tool !=0) {
      stroke(0);
      fill(0);
      ellipse(18, 61+ArtPatron.tool*30, 5, 5);
    }

    // Moves another little black circular cursor to the currently selected line weight.
    stroke(0);
    fill(0);
    ellipse(87.5, 237.5+20*ArtPatron.weight, 5, 5);
  }
}

