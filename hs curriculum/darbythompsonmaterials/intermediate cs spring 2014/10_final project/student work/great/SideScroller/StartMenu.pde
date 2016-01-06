class StartMenu{
  
  String highscore[] = loadStrings("HighScore.txt"); //loads the highscore to display in the beginning of the game
  
  void draw() {
    fill(0); //displays start menu
    textSize(36.4);
    textAlign(CENTER, TOP);
    text("Press 'Space' or 'Up' to jump. Avoid the red blocks.", width/2, 0);
    textSize(33.4);
    text("Press 'Shift' to start bullet time and 'Control' to end it.", width/2, 45);
    textSize(36.4);
    textAlign(LEFT);
    fill(255);
    rect(width/2-250, height/2-150, 500, 300);
    textSize(68);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Bit.Trip.Jumper", width/2, height/2-120);
    text("High Score: ", width/2, height/2-30);
    text(highscore[0], width/2, height/2+40);
    textSize(42);
    text("Click the screen to start.", width/2, height/2+118);
  }
  
}

