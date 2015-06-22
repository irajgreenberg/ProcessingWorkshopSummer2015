private class GameManager {
  private Player P1;
  private ArrayList<Animal> animals;
  private ArrayList<Eagle>eagles;
  private ArrayList<MovingPlatform> platforms;
  private ArrayList<Obstacle> obstacles;
  private float groundProximity;
  private float playerGroundY;
  private int gameMode;
  private boolean gameModeChange;
  private boolean jump;
  private float gameSpeed;//having a gameSpeed here allows for one increasing game speed
  private float minimumSpeed;

  private GameManager() {
    P1= new Player();
    animals= new ArrayList<Animal>();
    eagles=new ArrayList<Eagle>();
    platforms= new ArrayList<MovingPlatform>();
    obstacles=new ArrayList<Obstacle>();
    gameMode=0;
    minimumSpeed=5;
    gameSpeed=minimumSpeed;
  }

  private void display() {
    for (MovingPlatform p : platforms) {
      p.display();
    }
    for (Obstacle o : obstacles) {
      o.display();
    }
    P1.display();
  }

  private void update() {
    obstacleArrayList();
    move();
    P1.update(playerGroundY, gameMode);
    groundProximity=P1.speedY;
    groundPosition();
    gravity();
    addObstacle();
    removeObstacle(); 
    collisions();
    playerDeath();
    platformManager();
    //obstacles
    for (Animal a : animals) {
      a.update(groundFinder(a.x), groundFinder(a.x+a.Width));
    }
    for (Eagle e : eagles) {
      e.update();
    }
    gameSpeed();
  }
  private void obstacleArrayList() {
    obstacles.clear();
    obstacles.addAll(animals);
    obstacles.addAll(eagles);
  }
  private void move() {
    for (MovingPlatform p : platforms) {
      p.move(gameSpeed);
    }
    for (Obstacle o : obstacles) {
      o.move();
    }
    P1.move(jump, onGround());
  }
  private void gravity() {
    if (aboveGround()==true) {
      P1.y=P1.y+P1.speedY;
    }
  }

  //add obstacles randomly on a timer 
  private void obstacleManager() {
    addObstacle();
    removeObstacle();
  }
  private int obstacleCounter=0;      //counter for random introduction of animals
  private int obstacleCounterMax;
  private void addObstacle() {
    obstacleCounterMax=int(gameSpeed*random(20, 30));
    int obstacleType=int(random(0, 5));
    obstacleCounter++;
    if (obstacleCounter>=obstacleCounterMax) {
      if (obstacleType==0) {
        animals.add(new Camel(int(gameSpeed)));
      } else if (obstacleType==1) {
        animals.add(new Camel2(int(gameSpeed)));
      } else if (obstacleType==2) {
        platforms.add(new MovingPlatform(platforms.get(platforms.size()-1).x + platforms.get(platforms.size()-1).Width, height*2, gameSpeed));
      } else if (obstacleType==3) {
        eagles.add(new Eagle(int(gameSpeed)));
      }
      obstacleCounter=0;
    }
  }
  private void removeObstacle() {
    if (obstacles.size()>0) {
      for (int a=animals.size ()-1; a>=0; a--) {
        if (animals.get(a).x+animals.get(a).Width<-P1.Width || animals.get(a).y>height) {
          animals.remove(a);
        }
      }
      for (Eagle e : eagles) {
        if (e.x+e.Width<-P1.Width) {
          eagles.remove(e);
          //grabbed=false;
          break;
        }
      }
    }
  }

  //collision between characters and obstacles:
  private void collisions() {
    if (hitPlatform()==true) {
      P1.x=P1.x-platforms.get(0).speed;
    } else if (caught()==true) {
      P1.x=P1.x-animals.get(0).speed;
      P1.y=animals.get(0).y-P1.Height;
    } else if (hitAnimal()==true) {
      P1.x=P1.x-animals.get(0).speed;
    } else if (grabbed()==true) {
      P1.x=eagles.get(0).x;
      P1.y=eagles.get(0).y+eagles.get(0).Height*4/5;
    } else if (P1.x+P1.Width>0 && P1.x+P1.Width<width/6) {
      P1.x++;//move player forward wen pushed back
    }
  }
  private boolean grabbed() {
    boolean grabbed=false;
    for (Eagle e : eagles) {
      if (aboveGround()==true) {
        if (trueCollision(P1.x, P1.Width, e.x, e.Width)==true) {
          if (P1.y+P1.Height>e.y && P1.y<e.y+e.Height) {
            grabbed=true;
          }
        }
      }
    }
    return grabbed;
  }
  private boolean hitPlatform() {
    boolean hitPlatform=false;
    for (MovingPlatform m : platforms) {
      if (P1.y+P1.Height>groundFinder(P1.x+P1.Width)) {
        hitPlatform=true;
      } else {
        hitPlatform=false; //allow to jump over after getting stuck
      }
    }
    return hitPlatform;
  }
  private boolean hitAnimal() {
    boolean hitAnimal=false;
    for (Animal a : animals) {
      if (minorCollision(P1.x, P1.Width, a.x, a.Width)==true) {
        if (P1.y+P1.Height>a.y) {
          hitAnimal=true;
        }
      }
    }
    return hitAnimal;
  }
  private boolean caught() {
    boolean caught=false;
    for (Animal a : animals) {
      if (trueCollision(P1.x, P1.Width, a.x, a.Width)==true) {
        if (P1.y+P1.Height>a.y && aboveGround()==true) {
          caught=true;
        }
      }
    }
    return caught;
  }
  private boolean minorCollision(float point1, int size1, float point2, int size2) {//partially within boundaries of other
    boolean collided;
    if (P1.x<point2 + size2 && P1.x+P1.Width>point2) {
      collided=true;
    } else {
      collided=false;
    }
    return collided;
  }
  private boolean trueCollision(float point1, int size1, float point2, int size2) {//actual collisions within boundaries of other
    boolean collided;
    if (point2<point1 && point1+size1<point2 + size2) {
      collided=true;
    } else {
      collided=false;
    }
    return collided;
  }

  //character death manager
  private void playerDeath() {
    if (P1.x+P1.Width<=0 || P1.y>=height) {
      obstacleCounter=0;//stop adding obstacles
      if (P1.lives<=1) {
        gameSpeed=5;
        P1.score=0;
        gameModeChange=true;
      }
      if (obstacles.size()==0 && groundFinder(width/6)<height) {//make sure no obstacles and not land in hole
        P1.lives--;
        reset();
      }
    }
  }
  private void reset() {
    P1.x=width/6;
    P1.y=height/2;
  }

  //groundfinding function for finding ground y  beneath objects:
  private float groundY=0;
  private float groundFinder(float objectX) {
    for (MovingPlatform p : platforms) {
      if (objectX>p.x && objectX<p.x + p.Width) {
        groundY=p.y;
      }
    }
    return groundY;
  }

  //functions to find characters position relative to ground:
  private boolean onGround() {
    boolean onGround;
    if (P1.y+P1.Height+groundProximity>=playerGroundY && P1.y+P1.Height-groundProximity<=playerGroundY) {
      onGround=true;
    } else {
      onGround=false;
    }
    return onGround;
  }
  private boolean belowGround() {
    boolean belowGround;
    if (P1.y+P1.Height-groundProximity>playerGroundY) {
      belowGround=true;
    } else {
      belowGround=false;
    }
    return belowGround;
  }
  private boolean aboveGround() {
    boolean aboveGround;
    if (onGround()==false && belowGround()==false) {
      aboveGround=true;
    } else {
      aboveGround=false;
    }
    return aboveGround;
  }
  private void groundPosition() {
    onGround();
    belowGround();
    aboveGround();
    playerGroundY=groundFinder(P1.x);//find ground under character
  }

  //platforms:
  private void platformManager() {
    addPlatforms();
    removePlatforms();
  }
  private void addPlatforms() {
    if (platforms.size()<1) {
      platforms.add(new MovingPlatform(0, platformY(), int(gameSpeed)));
    } else if (platforms.get(platforms.size()-1).x<width) {
      platforms.add(new MovingPlatform(platforms.get(platforms.size()-1).x + platforms.get(platforms.size()-1).Width, platformY(), int(gameSpeed)));
    }
  }

  private void removePlatforms() {
    for (int p=platforms.size ()-1; p>=0; p--) {
      if (platforms.get(p).x+platforms.get(p).Width<0) {
        platforms.remove(p);
      }
    }
  }
  private float t=0.0;
  private float amplitude=30;
  private float platformY=height*3/4;
  private float platformY () {//decide where to place platform to conform with sin wave pattern
    platformY=amplitude*sin(t)+platformY;
    t=t+.8;
    return platformY;
  }


  private void gameMode() {
    int lineSpace=height/30*2;//space between lines
    int columnX; //x for columns of text
    playMusic();
    if (gameMode==0) {
      background(#C47826);
      textAlign(CENTER);
      textSize(lineSpace);
      text("DESERT RUNNER", width/2, height*3/8);
      textSize(lineSpace/2);
      text("press [SPACEBAR] to continue", width/2, height*6/8);
      text("press T to see Instructions/Score", width/2, height*7/8);
      reset();
      gameSpeed=minimumSpeed;
    } else if (gameMode==2) {
      background(background2);
      //character looking
      int x=width*47/100;
      int y=height*59/100;
      character2.resize(P1.Width/2, int(P1.Height)/2);//base width height off players to keep ration
      image(character2, x, y);
      //text
      textAlign(CENTER);
      text("Game Over", width/2, height/2);
      text("press [SPACEBAR] to try again", width/2, height*3/4);
    } else if (gameMode==3) { //game instructions
      textAlign(CENTER);
      textSize(lineSpace/2);
      text("INSTRUCTIONS", width/2, lineSpace); 
      columnX=width/3;
      textAlign(LEFT);
      text("Hold [SPACEBAR]  Jump", columnX, lineSpace*2);
      text("P  Pause", columnX, lineSpace*3);
      text("Q  Quit", columnX, lineSpace*4);
      text("Avoid sand dunes", columnX, lineSpace*5);
      text("Avoid cliffs", columnX, lineSpace*6);
      text("Avoid getting carried away by a bird", columnX, lineSpace*7);
      text("Avoid being trampled by a camel", columnX, lineSpace*8);
      textAlign(CENTER);
      text("Press T again to exit", width/2, height-lineSpace);//allow to press T again because of convenicne could also press spacebar
    } else if (gameMode==4) { //pause mode
      fill(0, 0, 0, 100);
      rect(0, 0, width, height);
      fill(#67450E);
      textAlign(CENTER);
      text("PAUSE", width/2, height/2);
      text("P  Unpause", width/2, height-lineSpace*2);
      text("[SPACEBAR]  Restart", width/2, height-lineSpace);
    }
    if (gameModeChange==true) {
      if (gameMode<2) {
        gameMode++;
      } else {
        gameMode=0;
        P1.lives=P1.maxLives;
      }
      gameModeChange=false;
    }
  }
  private void playMusic() {
    for (int song=0; song<music.length; song++) {
      if (song!=gameMode) {
        stopMusic(music[song]);
      } 
      if (music[gameMode].isPlaying()==false) {
        music[gameMode].rewind();
        music[gameMode].play();
      }
    }
  }
  private void stopMusic(AudioPlayer sound) {
    sound.pause();
    sound.rewind();
  }
  private void input() {
    if (key==' ') {//change gameMode
      if (gameMode==1) {
        if (onGround()==true) {
          jump=true;
        }
      } else {
        gameModeChange=true;//when moving to next gameMode not special gameModes (eg instruction)
      }
    }
    if (key=='t') {//change to and from instructions
      if (gameMode==3) {
        gameMode=0;
      } else {
        gameMode=3;
      }
    }
    if (key=='p') {//pause menu
      if (gameMode==1) {
        gameMode=4;
      } else {
        gameMode=1;
      }
    }
    if (key=='q') {//quitting
      gameMode=2;
    }
  }
  private void noInput() {
    jump=false;
    gameModeChange=false;
  }
  private void gameSpeed() {
    if (gameSpeed<=20) {//unplayable over spped 20
      gameSpeed=gameSpeed+ 0.001;
    }
  }
}

