class GameManager {

  Player charecter;
  StartMenu menu;
  ArrayList<Block> blocks;
  ArrayList<Cloud> clouds; 
  String[] highscoresavelist = new String[1]; //List used to save the highscore
  String[] highscoreloadlist = new String[1]; //List used to load the highscore
  int blockspeed=6; //sets the speed of the blocks and clouds
  int starting=1; //Used in check to find out if the player is just starting

  GameManager() {
    charecter = new Player(); //Creates a player
    blocks = new ArrayList(); //Creates the arraylist of blocks
    clouds = new ArrayList(); //Creates the arraylist of clouds
    menu = new StartMenu(); //Creates the start menu
  }

  void update() {
    if (charecter.lives>0 && starting<1) {
      if (charecter.bullettime==true) { //changes the framerate if bullettime is true
        frameRate(40);
        charecter.score=charecter.score-2;
      }
      else { //if bullettime is false, then the frame rate is normal
        frameRate(60);
        charecter.score++;
      }
      charecter.move(); //moves the charecter
      int random = int(random(0, 100)); //random variable used by blocks and clouds to know when to create one
      if (random==1 && blocks.size()<1) { //creates blocks
        blocks.add(new Block(blockspeed));
      }
      if (clouds.size()<1 && random<90) { //creates clouds
        clouds.add(new Cloud(blockspeed));
      }
      for (int i=0; i<blocks.size(); i++) { //moves the list of blocsks
        blocks.get(i).move();
        if (blocks.get(i).coor.x<-50) {
          blocks.remove(i);
          blockspeed++;
        }
      }
      for (int i=0; i<clouds.size(); i++) { //moves the list of clouds
        clouds.get(i).move();
        if (clouds.get(i).coor.x<-383) {
          clouds.remove(i);
        }
      }
      for (int i=blocks.size()-1; i>=0; i--) { //collision detection
        if ((charecter.coor.x+81>blocks.get(i).coor.x && charecter.coor.x<blocks.get(i).coor.x+50) && charecter.coor.y+189>blocks.get(i).coor.y) {
          charecter.lives--;
          blocks.remove(i);
        }
      }
    }
  }

  void display() {
    background(0, 91, 235); //displays the background
    if (starting>0) { //checks if the screen has been clicked
      menu.draw(); //draws the menu
      if (mousePressed==true) { //stops the start menu from showing throughout the game if the screen is clicked and resets any button presses
        starting--;
      }
    }
    else if (charecter.lives>0) { //checks if the charecter is still alive
      charecter.draw(); //draws the charecter
      charecter.score++; //adds to the score
      for (int i=0; i<blocks.size(); i++) {
        blocks.get(i).draw(); //draws the blocks
      }
      for (int i=0; i<clouds.size(); i++) {
        clouds.get(i).draw(); //draws the clouds
      }
      fill(0); //This code shows the instructions, score, and lives
      textSize(36.4);
      textAlign(CENTER, TOP);
      text("Press 'Space' or 'Up' to jump. Avoid the red blocks.", width/2, 0);
      textSize(33.4);
      text("Press 'Shift' to start bullet time and 'Control' to end it.", width/2, 45);
      textSize(36.4);
      textAlign(LEFT);
      text("Score: " + charecter.score, 12, 120);
      textAlign(RIGHT);
      text("Lives: " + charecter.lives, width-20, 120);
    }
    else {
      highscoreloadlist=loadStrings("HighScore.txt"); //loads the highscore
      if(charecter.score>Integer.valueOf(highscoreloadlist[0])){ ///saves the score if its the highscore
        highscoresavelist[0] = ""+charecter.score;
        saveStrings("HighScore.txt", highscoresavelist);
      }
      fill(0); //This code is the death screen
      textSize(200);
      textAlign(CENTER, TOP);
      text("You died", width/2, 50);
      textAlign(CENTER, CENTER);
      text("Score: ", width/2, height-550);
      textAlign(CENTER, CENTER);
      text(charecter.score, width/2, height-350);
      textAlign(CENTER, BOTTOM);
      textSize(40);
      text("Press 'Space' or 'Up' to play again", width/2, height-150);
    }
  }

  void action(char key) {
    if (charecter.lives>0 && starting<1) { //checks if the game has be started or restarted
      charecter.action(); //this makes the charecter jump
    }
    if (charecter.lives==0 && (keyCode==' ' || keyCode==UP)) { //this restarts the game and resets everything
      charecter.lives=3;
      blockspeed=6;
      charecter.score=0;
      charecter.bullettime=false;
      for (int i=0; i<blocks.size(); i++) {
        blocks.remove(i);
      }
      for (int i=0; i<clouds.size(); i++) {
        clouds.remove(i);
      }
    }
  }
}

