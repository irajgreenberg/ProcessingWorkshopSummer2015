class GameManager {
  Player player;
  ArrayList<Jump> jumps;
  ArrayList<Floor> floors;
  ArrayList<Powerup> powerups;
  boolean pressed;
  int framecounter;
  int framecounter2;
  int framecounter3;
  int framecounter5;
  int falling;
  int score;
  boolean lose;
  boolean stop;
  boolean pause;
  int lives;
  int gapy;
  int gapy2;
  int gapy3;
  int level;
  boolean levelup;
  boolean levelup2;
  int leveldist;
  int jumpsped;
  PImage pict; 
  int powerupcounter;
  int cash;
  boolean jump;
  float jumpspeed2;
  GameManager() {
    player = new Player(0, 0, 0);
    jumps = new ArrayList<Jump>();
    floors = new ArrayList<Floor>();
    jumps = new ArrayList<Jump>();
    powerups = new ArrayList<Powerup>();
    pressed = false;
    framecounter = 0;
    framecounter2 = 0;
    framecounter3 = 0;
    framecounter5 = 0;
    falling = 0;
    score = 0;
    lose = false;
    stop = false;
    pause = false;
    lives = 5; 
    gapy = 100;
    gapy2 = 200;
    gapy3 = 0;
    level = 1;
    levelup = false;
    levelup2 = false;
    leveldist = 3;
    jumpsped = 1;
    pict = loadImage("http://www.chriskarpyszyn.com/wp-content/uploads/2012/12/galacticcore.jpg");
    powerupcounter = 0;
    cash = 0;
    jump = false;
    jumpspeed2 = 1;
  }
  void pressed() {
    if (key == ' ') {
      jump = true;
    }
    if (key == 'p') {
      pause = true;
    }
    if (key == 'u') {
      pause = false;
    }
  }
  void update() { 
    if (stop == false) {
      jumpspeed2 = pow(1.0001, framecounter5);
      for (int i=powerups.size ()-1; i>=0; i--) {
        if (powerups.get(i).x<0) {
          powerups.remove(i);
          break;
        }
      }
      for (int i=jumps.size ()-1; i>=0; i--) {
        if (jumps.get(i).x<0) {
          jumps.remove(i);
          break;
        }
      }
      if (pause == false) {
        framecounter3++;
        player.update(jumpspeed2);
        framecounter5++;
        for (int i = 0; i<jumps.size (); i++) {
          jumps.get(i).move(-jumpsped, 0);
        }
        for (int i = 0; i<powerups.size (); i++) {
          powerups.get(i).move(-jumpsped, 0);
        }
        if (framecounter%(240/jumpsped)==0) {
          gapy3 = int(random(-gapy, (7*height/8 - 20*height/100)-gapy2-gapy));
          jumps.add(new Jump(gapy+gapy3, 20*height/100));
          jumps.add(new Jump(7*height/8-(20*height/100+gapy+gapy2)-gapy3, 7*height/8-(20*height/100+gapy)+gapy2-10+gapy3));     
          if (powerupcounter%2 == 0) {
            powerups.add(new Powerup(width, 7*height/8-(20*height/100+gapy)+gapy2-10+gapy3-150));
          }
          powerupcounter++;
          if (framecounter3>width/2-player.pwidth) { 
            score++;
          }
        }
        floors.add(new Floor(0, 7*height/8));
        floors.add(new Floor(0, 1*height/8));
        if (jump == true) {
          player.jump(-1.75);
          jump = false;
          framecounter5 = 1;
        }
        framecounter++;
        for (int i = 0; i<jumps.size ()-1; i++) {
          if (player.x - player.pwidth/2 < jumps.get(i).x && player.x+player.pwidth/2>jumps.get(i).x) {
            //if its a u jump
            if (jumps.get(i).y == 20*height/100) {
              if (player.y < 20*height/100+jumps.get(i).jheight+player.pheight/2) {
                //print("you died1"); 
                lives = lives-1;
                jumps.remove(i);
              }
            }
            //if its a d jump
            else {
              if (player.y>7*height/8-jumps.get(i).jheight-player.pheight/2) {
                //print("you died2"); 
                lives = lives-1;
                jumps.remove(i);
              }
            }
          }
        }
        for (int i = 0; i<powerups.size ()-1; i++) {
          if (player.x-player.pwidth/2<powerups.get(i).x && player.x+player.pwidth>powerups.get(i).x) {
            if (player.y-player.pwidth/2<powerups.get(i).y+powerups.get(i).puheight && player.y +player.pwidth/2> powerups.get(i).y) {
              cash++;
              powerups.remove(i);
            }
          }
        }        
        if (score%4 == 0 && score != 0) {
          levelup = true;
          level++;
          score = 0;
          jumpsped++;
        }
        if (player.y-player.pheight<floors.get(1).y+ floors.get(1).fheight|| player.y>floors.get(0).y - floors.get(0).fheight) {
          lose = true;
        }
        if (cash == 4) {
          lives++;
          cash = 0;
        }
      }//the stop bracket
    }//end of pause
    image(pict, 0, 0);
    if (lose == false) {
      if (framecounter<240) {
        fill(255, 255, 255);
        textSize(20);
        text("use space to jump over blue things, if you hit them you die", width/4, height*.25);
        fill(255, 255, 255);
        textSize(20);
        text("don't hit the floor or the ceiling - you will die", width/4, height/2); 
        fill(255, 255, 255);
        textSize(20);
        text("the jumps get faster with each level", width/4, 3*height/4);
      }
    }
    if (lives < 1) {
      lose = true;
    }
    if (lose==true) {
      fill(0, 255, 0);
      textSize(100);
      text("you lost:(", width/4, height/2);
      stop = true;
    }
    if (pause == true) {
      fill(255, 255, 255);
      textSize(44);
      text("paused", 7*width/10, height*0.15);
    }
  }
  void display() {
    fill(255, 255, 255);
    textSize(34);
    text("level:"+ level, width*.025, height*0.15);
    fill(255, 255, 255);
    textSize(34);
    text("lives:"+lives, width*.4, height*0.15);    
    fill(255, 255, 255);
    textSize(34);
    text("sublevel:"+ score, width*.175, height*0.15);
    fill(255, 255, 255);
    textSize(34);
    text("cash:"+ cash, width*.55, height*0.15);
    fill(255, 255, 255);  
    if (stop == false) {
      fill(255, 255, 255);
      textSize(13);
      text("p to pause, u to unpause", 7*width/10, height*0.05);
      fill(255, 255, 255);
      textSize(13);
      text("$4 cash into lives", 5*width/10, height*0.05);
      //textSize(15);
      //text("spamjumping kills you mwahahahah", width*.25, height*0.97);        
      player.display();
      for (int i = 0; i<floors.size (); i++) {
        floors.get(i).display();
      }
      for (int i = 0; i<jumps.size (); i++) {
        jumps.get(i).display();
      }
      for (int i = 0; i<powerups.size (); i++) {
        powerups.get(i).display();
      }
    }
  }
}

