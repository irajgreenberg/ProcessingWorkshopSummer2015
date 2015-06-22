class Paint_Program {

  Palette pal;
  Artsulation curtain;
  Layout layout;
  int tool;
  ArrayList<DrawableObject> drawableObjects;
  ArrayList<DrawableObject> trash;
  int weight;
  color canvasColor;

  Paint_Program() {
    tool = 0;
    drawableObjects = new ArrayList();
    trash = new ArrayList();
    weight = 2;
    pal = new Palette();
    curtain = new Artsulation();
    layout = new Layout();
    canvasColor = 255;
  }

  void display() {
    // Creates the canvas.
    stroke(0);
    fill(canvasColor);
    rect(110, 10, 680, 740);

    // Draws all the objects in drawable objects.
    for (DrawableObject d: drawableObjects) {
      d.draw();
    }

    // Updates the hover color.
    pal.update();

    // Creates a white polygon that prevents shapes, such as ellipses and hexagons, from being drawn outside the designated canvas. 
    curtain.draw();

    // Draws the two squares that represent the color which is being hovered over and the chosen color.
    pal.draw();

    // Creates the whole composition of the on-screen software layout.
    layout.draw();
  }

  void handleKeyPress(char key) {
    if (key == '0') {
      tool = 0;
    }
  }

  void handleMousePress() {
    // Selects the correct DrawableObject to draw based on the currently selected tool.
    if (abs(mouseX-450)<339 && abs(mouseY-380)<370) {
      if (tool==1) {
        Line l = new Line(mouseX, mouseY, pal.chosenColor);
        drawableObjects.add(l);
      }
      if (tool==2) {
        Ellipse e = new Ellipse(mouseX, mouseY, pal.chosenColor);
        drawableObjects.add(e);
      }
      if (tool==3) {
        Rectangle r = new Rectangle(mouseX, mouseY, pal.chosenColor);
        drawableObjects.add(r);
      }
      if (tool==4) {
        Squiggly s = new Squiggly(mouseX, mouseY, pal.chosenColor);
        drawableObjects.add(s);
      }
      if (tool==5) {
        Hexagon h = new Hexagon(mouseX, mouseY, pal.chosenColor);
        drawableObjects.add(h);
      }
    }

    // Updates the tool variable based on which button the mouse clicked.
    else if (abs(mouseX-55)<45 && abs(mouseY-90)<10) {
      tool = 1;
    }
    else if (abs(mouseX-55)<45 && abs(mouseY-120)<10) {
      tool = 2;
    }
    else  if (abs(mouseX-55)<45 && abs(mouseY-150)<10) {
      tool = 3;
    }
    else  if (abs(mouseX-55)<45 && abs(mouseY-180)<10) {
      tool = 4;
    }
    else  if (abs(mouseX-55)<45 && abs(mouseY-210)<10) {
      tool = 5;
    }

    // Changes the weight with which lines and squigglies are drawn based upon which weight the user selects (clicks).
    else if (abs(mouseX-87.5)<7.5 && abs(mouseY-265)<7.5) {
      weight = 1;
    }
    else if (abs(mouseX-87.5)<7.5 && abs(mouseY-285)<7.5) {
      weight = 2;
    }
    else  if (abs(mouseX-87.5)<7.5 && abs(mouseY-305)<7.5) {
      weight = 3;
    }
    else  if (abs(mouseX-87.5)<7.5 && abs(mouseY-325)<7.5) {
      weight = 4;
    }

    // Dictates what happens when the "New" button is pressed: empties the old trash, adds all the current things
    // on the screen to the new trash, and clears all the things drawn on the screen, and resets certain variables.
    else if (abs(mouseX-30)<20 && abs(mouseY-22.5)<12.5) {
      for (int i=trash.size()-1; i>=0; i--) {
        trash.remove(trash.get(i));
      }
      for (int i=drawableObjects.size()-1; i>=0; i--) {
        trash.add(drawableObjects.get(i));
        drawableObjects.remove(drawableObjects.get(i));
      }
      pal.hoverColor = 0;
      pal.chosenColor = 0;
      tool = 0;
      weight = 2;
    }

    // Saves a picture in the program folder called "mypicture" when the save button is clicked.
    else if (abs(mouseX-80)<20 && abs(mouseY-22.5)<12.5) {
      save("mypicture.jpg");
    }

    // Dictates what happens when the "Undo" button is pressed: the trash receives the last drawn object
    // and that object is then cleared from the screen.
    else  if (abs(mouseX-30)<20 && abs(mouseY-57.5)<12.5 && drawableObjects.size()!=0) {
      trash.add(drawableObjects.get(drawableObjects.size()-1));
      drawableObjects.remove(drawableObjects.get(drawableObjects.size()-1));
    }

    // Dictates what happens when the "Redo" button is pressed: the screen (DrawableObjects) adds the last item in
    // the trash and the trash removes that item from itself.
    else  if (abs(mouseX-80)<20 && abs(mouseY-57.5)<12.5 && trash.size()!=0) {
      drawableObjects.add(trash.get(trash.size()-1));
      trash.remove(trash.get(trash.size()-1));
    }

    // Updates the chosen color square in the pallete.
    else {
      pal.selectColor();
    }
  }

  // Handles all mouse drags: basically altering the shape that is currently being drawn based upon where the mouse moves.
  void handleMouseDrag() {
    if (abs(mouseX-450)<339 && abs(mouseY-380)<370) {
      if (tool!=0) {
        drawableObjects.get(drawableObjects.size()-1).update();
      }
    }
  }
}

