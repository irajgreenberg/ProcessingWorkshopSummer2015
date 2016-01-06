class GameManager {
  //Declaring all the variables
  boolean startscreen = true;
  boolean isonplatform = false;
  boolean loss = false;
  int level = 0;
  int points = 0;
  int fade = 0;
  Player cube;
  PImage background1;
  PImage background2;
  int picx = 0;
  int picx2 = 1200;
  int picspeedx = 3;
  int highscore = 3;
  ArrayList<Platform> platforms;
  PFont font;

  GameManager() {
    cube = new Player();
    platforms = new ArrayList();
    background1 = loadImage("milky_way.jpg");
    background2 = loadImage("milky_way.jpg");
    font = loadFont("OCRAStd-48.vlw");
  }

  void update() {
    if (startscreen==false) {
      //Drawing the initial platform
      if (points==0) {
        platforms.add(new Platform(int(random(200)), int(random(200, 350)), 500, int(random(10, 100))));
      }
      //adding up points
      if (loss==false) {
        points++;
        //making a new platform with nice spacing based on the frame count, and making it harder
        if (points%(70)==0) {
          platforms.add(new Platform(600, int(random(220, 400)), int(random(100, 250)), int(random(10, 100))));
        }
        //if you are not on a platform you fall
        if (isonplatform==false) {
          cube.fall();
        }
        //removing blocks that go off the screen
        for (int i = platforms.size()-1; i>=0; i--) {
          if (platforms.get(i).x+platforms.get(i).pwidth<=0) {
            platforms.remove(i);
          }
        }
        for (Platform i: platforms) {
          //to shorten some of the if statements
          float a = cube.y+cube.pwidth;
          float b = cube.x+cube.pwidth;
          //Collision Detection
          //if it is on top of the platform
          if (cube.x<=i.x+i.pwidth && b>=i.x && cube.y<=i.y && a>=i.y) {
            cube.y = i.y-cube.pwidth;
            isonplatform = true;
            cube.hasjumped = 0;
            cube.speedy = 0;
            break;
          }
          //if it hits the left side
          if (b>i.x && cube.x<i.x && cube.y<i.y+i.pheight && a>i.y) {
            cube.x = i.x-cube.pwidth;
            cube.speedx = -i.speedx;
          }
          //if it hits the right side
          if (cube.x<i.x+i.pwidth && b>i.x+i.pwidth && cube.y<i.y+i.pheight && a>i.y) {
            cube.x = i.x+i.pwidth;
            cube.speedx = -i.speedx;
          }
          //if it hits the bottom
          if (cube.x<=i.x+i.pwidth && b>=i.x && cube.y<=i.y+i.pheight && a>=i.y+i.pheight) {
            cube.speedy = 0;
            cube.y = i.y+i.pheight;
          }
          else {
            isonplatform = false;
          }
        }
        //making it get harder
        if (points%2000==0) {
          level++;
        }
        //You lose if you go off the screen
        if (cube.x+cube.pwidth<0 || cube.x>width || cube.y>height) {
          loss = true;
        }
        cube.move();
      }
    }
  }
  //if you hit a key
  void action(char key) {
    cube.action();
    if (loss==true || startscreen==true) {
      if (key=='r') {
        startscreen = false;
        loss = false;
        platforms.clear();
        points = 0;
        level = 0;
        cube.hasjumped = 0;
        cube.x = 100;
        cube.y = 100;
        cube.speedx = 0;
        cube.speedy = 0;
      }
    }
  }

  void display() {
    //insert the background
    image(background1, picx, 0);
    image(background2, picx2, 0);
    if (picx<=-1200) {
      picx = 1200;
    }
    if (picx2<=-1200) {
      picx2 = 1200;
    }
    picx = picx-picspeedx;
    picx2 = picx2-picspeedx;
    if (startscreen==false) {
      //what shows up when you are playing
      if (loss==false) {
        //draw the player
        cube.draw();
        //instructions
        if (points<=255) {
          fill(fade);
          textFont(font, 9);
          text("Hit Up to jump (and hit it twice to double jump), Left and Right to move side to side", 5, 40);
          fade++;
        }
        if (points>=255 && points<510) {
          fill(fade);
          textFont(font, 9);
          text("Hit Up to jump (and hit it twice to double jump), Left and Right to move side to side", 5, 40);
          fade--;
        }
        //level and score display
        textSize(75);
        fill(150);
        text(str(points), 380, height-80);
        fill(150);
        text(str(level), 30, height-80);
      }
      //draw the blocks
      for (Platform i: platforms) {
        i.speedx = 4+level;
        picspeedx = i.speedx; 
        i.move();
        i.draw();
      }
      //what shows up when you lose
      if (loss==true) {
        fade = 0;
        textSize(30);
        fill(150);
        text("Game Over", 30, height/2);
        text("Score:", 30, height-80);
        text(str(points), 170, height-80);
        text("Hit 'r' to restart", 30, height-200);
        fill(random(255), random(255), random(255));
        textFont(font);
        text("Spaceboarding", 30, 100);
        if (points>=highscore) {
          highscore = points;
        }
        fill(150);
        text("High Score: " + highscore, 30, 200);
      }
    }
    if (startscreen==true) {
      textSize(30);
      fill(random(255), random(255), random(255));
      textFont(font);
      text("Spaceboarding", 60, 100);
      fill(150);
      text("Hit 'r' to start", 25, height-200);
      textSize(12);
      textSize(12);
      text("Instructions:", 40, height-470);
      text("1) Hit the Up arrow key to jump, double jumps are possible", 40, height-420);
      text("2) Use the Left and Right arrow keys to move side to side", 40, height-370);
      text("3) Have Fun!", 40, height-320);
    }
  }
}

