class Gamemanager {


  public float gravity;
  private Player p;
  private ArrayList<Level> levels;
  private int gameMode;  //-5 is instructions, -4 through -1 are the story, 0 is title, 1 is gameplay, 2 is death, 3 is beat level, 4 is pause, 5 is win
  private int whichLevel;//keeps track of which level is being played
  private int hitCount;//keeps track of if the player has recently been hit by an enemy, in which case, the player loses control
  private int way;//which was is the level moving
  private boolean sound;//is sound turned on
  private PFont font;//comic sans (sorry)
  private PImage deathPic;//and a lot of other resources
  private PImage levelEnd;
  private PImage story1;
  private PImage story2;
  private PImage story3;
  private PImage story4;
  private PImage title;
  private PImage instructions;
  private PImage backGround;


  public Gamemanager() {
    deathPic=loadImage("angrypepe.png");//loads resources
    levelEnd=loadImage("yee.png");
    story1=loadImage("story1.png");
    story2=loadImage("story2.png");
    story3=loadImage("story3.png");
    story4=loadImage("story4.png");
    instructions=loadImage("instructions.png");
    title=loadImage("title.png");
    backGround=loadImage("background.png");
    levels=new ArrayList<Level>();//arraylist of levels
    levels.add(new Level(loadStrings("level1.txt")));//makes the levels
    levels.add(new Level(loadStrings("level2.txt")));
    whichLevel=0;//start at first level
    p=new Player();
    gravity=0.4;//gravity constant
    gameMode=-4;//starts off with the story
    font=loadFont("ComicSansMS-48.vlw");
    sound=true;
  }

  public void displayStory() {
    if (gameMode==-4) {//shows the backstory
      imageMode(CORNER);
      image(story1, 0, 0);
    } else if (gameMode==-3) {
      imageMode(CORNER);
      image(story2, 0, 0);
    } else if (gameMode==-2) {
      imageMode(CORNER);
      image(story3, 0, 0);
    } else if (gameMode==-1) {
      imageMode(CORNER);
      image(story4, 0, 0);
    }
  }

  public void display() {
    textFont(font);
    if (gameMode<0&&gameMode>=-4) {
      displayStory();
    } else if (gameMode==-5) {//shows instructions
      imageMode(CORNER);
      image(instructions, 0, 0);
    } else if (gameMode==0) {//title menu
      imageMode(CORNER);
      image(title, 0, 0);
      stroke(161, 88, 51);
      strokeWeight(3);
      fill(5, 69, 254);
      rectMode(CORNERS);
      if (width/3<=mouseX&&width*2/3>=mouseX&&height/3<=mouseY&&height/3+70>=mouseY) {
        strokeWeight(8);//"mouseover" display for the buttons
      }
      rect(width/3, height/3, width*2/3, height/3+70);
      strokeWeight(3);
      if (width/3<=mouseX&&width*2/3>=mouseX&&height/3+100<=mouseY&&height/3+170>=mouseY) {
        strokeWeight(8);
      }
      rect(width/3, height/3+100, width*2/3, height/3+170);
      fill(255, 255, 0);
      textSize(20);
      textAlign(CENTER);
      text("begin level 1", width/2, height/3+45);//the buttons text
      text("instructions", width/2, height/3+145);
    } else if (gameMode==1) {
      imageMode(CORNER);
      image(backGround, 0, 0);
      p.display();//display the player and level
      levels.get(whichLevel).display();
      fill(0);
      textAlign(LEFT);
      textSize(20);
      text("Level "+(whichLevel+1), width-150, 40);//stats up in corner
      text("Score: "+p.score, width-150, 80);
      text("Lives:", width-150, 125);
      text("Pepes:", width-150, 165);
      for (int i=0; i<p.lives; i++) {
        ellipseMode(CENTER);
        fill(191, 29, 0);
        ellipse(width-80+30*i, 120, 20, 20);//visually shows lives
      }
      for (int i=0; i<p.pepes; i++) {
        ellipseMode(CENTER);
        fill(90, 141, 61);
        ellipse(width-80+30*i, 160, 20, 20);//visually shows pepes
      }
    } else if (gameMode==2) {
      imageMode(CORNER);//death screen
      image(deathPic, 0, 0);
    } else if (gameMode==3) {
      imageMode(CORNER);//in between level screen
      image(levelEnd, 0, 0);
    } else if (gameMode==4) {
      background(255);//pause screen
      textSize(20);
      fill(0);
      textAlign(CENTER);
      text("press p to return to game", width/2, height/2);
      textSize(15);
      text("press s to toggle sound", width/2, height/2+200);
    } else if (gameMode==5) {
      background(255);//win screen
      textSize(20);
      fill(0);
      textAlign(CENTER);
      text("you win...for now", width/2, height/2);
    }
  }

  private void checkPlayer() {//all the player-related update stuff
    for (int i=0; i<levels.get (whichLevel).coins.size (); i++) {
      if (levels.get(whichLevel).collide(p, levels.get(whichLevel).coins.get(i))==true) {//coin collision
        p.addScore(100);
        levels.get(whichLevel).removeCoin(i);
      }
    }
    for (int i=1; i<levels.get (whichLevel).platforms.size (); i++) {
      if (levels.get(whichLevel).topCollide(p, levels.get(whichLevel).platforms.get(i))==false&&p.ground==true) {//if not on a platform, drop
        p.drop();
      }
    }
    for (int i=1; i<levels.get (whichLevel).platforms.size (); i++) {
      if (levels.get(whichLevel).topCollide(p, levels.get(whichLevel).platforms.get(i))==true&&p.keepJump<0) {//if on a platform, land  
        p.land(levels.get(whichLevel).platforms.get(i).y-levels.get(whichLevel).platforms.get(i).tall/2);
      }
    }
    for (int i=0; i<levels.get (whichLevel).platforms.size (); i++) {
      if (levels.get(whichLevel).platforms.get(i).type==2) {
        if (levels.get(whichLevel).bottomCollide(p, levels.get(whichLevel).platforms.get(i))==true&&p.keepJump>0) {//if you hit a gray platform, then you can bump off the bottom
          p.bump(levels.get(whichLevel).platforms.get(i).y+levels.get(whichLevel).platforms.get(i).tall/2);
        }
        if (levels.get(whichLevel).collide(p, levels.get(whichLevel).platforms.get(i))==true) {//and bump off the sides
          changeDirection(0);
        }
      }
    }
    for (int i=0; i<levels.get (whichLevel).pepes.size (); i++) {
      if (levels.get(whichLevel).collide(p, levels.get(whichLevel).pepes.get(i))==true) {//touch a pepe
        p.addPepe();
        p.addScore(500);
        levels.get(whichLevel).removePepe(i);
      }
    }
    for (int i=0; i<levels.get (whichLevel).enemies.size(); i++) {
      if (levels.get(whichLevel).topCollide(p, levels.get(whichLevel).enemies.get(i))==true&&p.keepJump<0&&p.ground==false) {//jump on an enemy
        levels.get(whichLevel).removeEnemy(i); 
        p.addScore(300);
        p.bounce();
      }
    }
    for (int i=0; i<levels.get (whichLevel).enemies.size(); i++) {
      if (levels.get(whichLevel).collide(p, levels.get(whichLevel).enemies.get(i))==true) {//get hit by an enemy
        if (hitCount==0) {
          p.getHit();
          if (way==0) {//if stationary, you get bumped the way the enemy is going
            changeDirection(abs(levels.get(whichLevel).enemies.get(i).moveSpeed)/levels.get(whichLevel).enemies.get(i).moveSpeed);
          } else {
            changeDirection(-way);//if moving, you get bumped the opposite of where you are already moving
          }
          hitCount=1;
        }
      }
    }
    if (levels.get(whichLevel).collide(p, levels.get(whichLevel).goal)==true) {
      if (levels.get(whichLevel).goal.howManyPepesLeft()==0) {//if you collect all the pepes, you win the level
        gameMode=3;
        if (sound) {
          yee.play();
        }
      } else {
        showPepesLeft(levels.get(whichLevel).goal.howManyPepesLeft());//otherwise you get shown how many you need to collect
      }
    }
    if (p.hitBottom()) {
      gameMode=2;//die from falling
      p.addScore(-2000);
    }
    if (p.lives==0) {
      gameMode=2;//die from enemy hits
    }
  }

  private void checkEnemies() {
    for (int i=0; i<levels.get (whichLevel).enemies.size(); i++) {
      for (int i2=0; i2<levels.get (whichLevel).platforms.size(); i2++) {
        if (!(levels.get(whichLevel).topCollide(levels.get(whichLevel).enemies.get(i), levels.get(whichLevel).platforms.get(i2))==true)&&levels.get(whichLevel).enemies.get(i).ground==true) {
          levels.get(whichLevel).enemies.get(i).drop();//if enemy is no longer on a platform, drop
        }
      }
      for (int i2=0; i2<levels.get (whichLevel).platforms.size(); i2++) {
        if (levels.get(whichLevel).topCollide(levels.get(whichLevel).enemies.get(i), levels.get(whichLevel).platforms.get(i2))==true) {
          levels.get(whichLevel).enemies.get(i).land(levels.get(whichLevel).platforms.get(i2).y-levels.get(whichLevel).platforms.get(i2).tall/2);//if enemy is on a platform, land
        }
      }
    }
  }

  private void showPepesLeft(int howMany) {
    textAlign(CENTER);//displays to the player how many pepes need to be found
    fill(0);
    textSize(20);
    text("My child, you must find "+howMany+" more pepes before you may enter the light.", levels.get(whichLevel).goal.x, levels.get(whichLevel).goal.y-levels.get(whichLevel).goal.tall/2);
  }

  public void update() {
    if (gameMode==1) {
      p.move(gravity);//move player
      levels.get(whichLevel).goal.setPepe(p.pepes);//set goal's pepes to equal player's pepes
      levels.get(whichLevel).move(gravity);//move level
      checkPlayer();//do the checky things
      checkEnemies();

      if (hitCount>0) {
        hitCount++;//as long as hitcount is greater than 0, player has no control
      }
      if (hitCount==40) {
        hitCount=0;
        changeDirection(0);
      }
      if (levels.get(whichLevel).platforms.get(0).x>=-70) {//this is supposed to prevent passing the left wall but it doesnt work too well???
        changeDirection(0);
      }
    }
  }

  private void changeDirection(int direction) {
    way=direction;
    if (hitCount==0) {//as long as player has control, change direction
      p.changeDirection(direction);
      if (!(levels.get(whichLevel).platforms.get(0).x+levels.get(whichLevel).platforms.get(0).wide/2>=p.x-p.wide/2&&direction==-1)) {
        levels.get(whichLevel).changeDirection(direction);
      }
    }
  }

  private void resetLevel() {
    gameMode=1;//resets the current level after death
    levels.get(whichLevel).reset();
    p.reset();
  }

  private void nextLevel() {
    whichLevel++;//goes to the next level
    gameMode=1;
    p.reset();
  }

  public void keyPress() {
    if (gameMode<0&&gameMode>=-4) {//scrolls through the story
      if (key==' ') {
        gameMode++;
      }
    } else if (gameMode==0) {
      if (key==' ') {//starts the game from the title menu
        gameMode=1;
        soundtrack.play();
        soundtrack.loop();
        sound=true;
      }
    } else if (gameMode==2) {
      if (key==' ') {//resets the level after death
        resetLevel();
      }
    } else if (gameMode==1) {//moves the player
      if (key==' '||key=='w'||key=='W'||keyCode==UP) {
        p.jump();
      } else if (key=='a'||key=='A'||keyCode==LEFT) {
        changeDirection(-1);
      } else if (key=='d'||key=='D'||keyCode==RIGHT) {
        changeDirection(1);
      } else if (key=='p'||key=='P') {//pause
        gameMode=4;
      }
    } else if (gameMode==3) {
      if (key==' ') {//goes to nect level, if there is one
        if (whichLevel<levels.size()-1) {
          nextLevel();
        } else {//otherwise you win
          gameMode=5;
        }
      }
    } else if (gameMode==4) {
      if (key=='p'||key=='P') {//unpause
        gameMode=1;
      }
      if (key=='s') {
        if (sound) {//turn sound off if on
          soundtrack.pause(); 
          sound=false;
        } else {//turn sound on if off
          sound=true;
          soundtrack.play();
          soundtrack.loop();
        }
      }
    } else if (gameMode==-5) {
      if (key==' ') {//go back to title from instructions
        gameMode=0;
      }
    }
  }

  public void keyRelease() {
    if (key=='a'||key=='A'||keyCode==LEFT||key=='d'||key=='D'||keyCode==RIGHT) {
      changeDirection(0);//stops the player once movement keys are no longer pressed
    }
  }

  public void click() {
    if (gameMode<0&&gameMode>=-4) {
      gameMode++;//scroll through story
    }
    if (gameMode==0) {//button pressing on title
      if (width/3<=mouseX&&width*2/3>=mouseX&&height/3<=mouseY&&height/3+70>=mouseY) {//start game
        gameMode=1;
        soundtrack.play();
        soundtrack.loop();
      } else if (width/3<=mouseX&&width*2/3>=mouseX&&height/3+100<=mouseY&&height/3+170>=mouseY) {//go to instructions
        gameMode=-5;
      }
    }
  }
}

