class GameManager {
  boolean paused;
  boolean gameOver;
  Background background;
  Explosion explosion;
  int gcCounter;
  ArrayList<Stars> stars;
  boolean showInstructions;

  GameManager() {
    kittens = new nyanDavid();
    platforms = new ArrayList();
    bombs = new ArrayList();
    stars = new ArrayList();
    for (int i=0; i<800; i++) {
      for (int j=0; j<800; j++) {
        if ((int)random(900)==(int)random(900)) {
          Stars s = new Stars(i, j);
          stars.add(s);
        }
      }
    }
    paused=false;
    gameStarted=false;
    gameOver=false;
    score = new Score();
    counter=0;
    background = new Background();
    explosion = new Explosion();
    gcCounter=0;
    showInstructions=false;
  }

  void update() {
    //background.update();
    for (Stars s: stars) {
      s.update();
    }
    score.update();
    kittens.update();
    if (platforms.size()>=1) {
      Earth p = platforms.get(platforms.size()-1);
      if (p.x+p.w<=width) {
        Earth newP= new Earth(p.x+p.w+(int)random(60+0.22*counter, 210+0.22*counter), (int)random(410, 610), (int)random(200, 450), 10);
        platforms.add(newP);
      }
    }
    for (int i=platforms.size()-1; i>=0; i--) {
      Earth p = platforms.get(i);
      if (p.x<-p.w) {
        platforms.remove(i);
      }
      p.update();
    }
    for (Bomb b: bombs) {
      b.update();
    }
    if (kittens.y>height+kittens.s) {
      if (kittens.lives>0) {
        kittens.lives=kittens.lives-1;
        kittens.y=400;
        kittens.v=10;
        platforms.clear();
        bombs.clear();
        counter=0;
        Earth p = new Earth(200, 510, 500, 10);
        platforms.add(p);
      }
      else {
        gameOver=true;
      }
    }
    if (platforms.size()>1) {
      float r=50-0.001*counter;
      if ((int)random(r)==(int)random(r)) {
        int k=platforms.size()-1;
        if (platforms.get(k).x>=500) {
          Bomb b = new Bomb(15+platforms.get(k).x+(int)random(0, platforms.get(k).w-45), platforms.get(k).y-30);
          bombs.add(b);
        }
      }
    }
    for (int i=bombs.size()-1; i>=0; i--) {
      Bomb b=bombs.get(i);
      if (kittens.x+0.18*kittens.s>b.x-20 && kittens.x-0.12*kittens.s<b.x+20 && kittens.y+0.1*kittens.s>b.y-20 && kittens.y-0.1*kittens.s<b.y+20) {
        bombs.remove(i);
        if (platforms.get(0).boost==1) {
          score.value=score.value+50;
        }
        else {
          if (kittens.lives>0) {
            kittens.lives=kittens.lives-1;
          }
          else {
            gameOver=true;
          }
        }
      }
      if (b.x<-30) {
        bombs.remove(i);
      }
    }
    counter=counter+1;
  }

  void draw() {
    //background.draw();
    for (Stars s: stars) {
      s.draw();
    }
    if (gameStarted==true) {
      score.draw();
      if (gameOver==false) {
        kittens.draw();
      }
    }
    for (Earth p: platforms) {
      p.draw();
    }
    for (Bomb b: bombs) {
      b.draw();
    }
    if (gameStarted==false && showInstructions==false) {
      stroke(0);
      fill(255, 255, 255, 225);
      rect(-1, -1, width+2, height+2);
      textAlign(CENTER, CENTER);
      textSize(40);
      noStroke();
      fill(0);
      text("NYAN DAVID", width/2, height/2-40);
      textSize(25);
      fill(255, 0, 0);
      text("Play", width/2, height/2+25);
      textSize(20);
      fill(0, 0, 255);
      text("Instructions", width/2, height/2+125);
      noLoop();
    }
    if (gameOver==true && gcCounter!=18) {
      gcCounter=gcCounter+1;
      explosion.draw();
      explosion.update();
    }
    if (gcCounter==18) {
      noLoop();
      stroke(0);
      fill(100, 0, 0, 200);
      rect(-1, -1, width+2, height+2);
      textAlign(CENTER, CENTER);
      textSize(40);
      noStroke();
      fill(255, 200, 0);
      text("GAME OVER", width/2, height/2-40);
      textSize(25);
      fill(255);
      text("Play Again?", width/2, height/2+25);
      fill(0, 255, 0);
      text("Main Menu", width/2, height/2+75);
      gcCounter=0;
      explosion.frame=0;
    }
    if (showInstructions==true) {
      fill(200, 200, 255);
      rect(-1, -1, width+2, height+2);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(20);
      text("INSTRUCTIONS", width/2, 60);
      textSize(16);
      textAlign(TOP, LEFT);
      text("Up arrow to jump, right arrow to boost.", 20, 140);
      text("Jump from platform to platform either avoiding the bombs or boosting through them.", 20, 180);
      text("Green platforms will spring you into the air.", 20, 220);
      text("Using green platforms and boosting through bombs increases your score.", 20, 260);
      text("Score can also increase over time, and likewise with the speed of the platforms,", 20, 300);
      text("the distance between them, and the frequency of the bombs.", 20, 340);
      text("You have 3 lives. Good luck!", 20, 380); 
      textSize(20);
      textAlign(CENTER, CENTER);
      text("Return to Main Menu", width/2, height/2+200);
    }
  }

  void action(char key) {
    if (key == CODED) {
      kittens.action(key);
      for (Earth p: platforms) {
        p.action(key);
      }
    }
    if (key==' ') {
      if (paused==false) {
        noLoop();
        paused=true;
        stroke(0);
        fill(0, 100, 100, 200);
        rect(-1, -1, width+2, height+2);
        noStroke();
        fill(255);
        rect(width/2-50, height/2-50, 35, 100);
        rect(width/2+15, height/2-50, 35, 100);
      }
      else {
        loop();
        paused=false;
      }
    }
  }

  void click() {
    if (showInstructions==false) {
      if (abs(mouseX-width/2)<55 && abs(mouseY-(height/2+25))<10 && (gameOver==true||gameStarted==false)) {
        if (gameStarted==false) {
          gameStarted=true;
        }
        kittens.y=400;
        kittens.v=10;
        kittens.lives=3;
        platforms.clear();
        counter=0;
        Earth p = new Earth(200, 510, 500, 10);
        platforms.add(p);
        bombs.clear();
        gameOver=false;
        score.value=0;
        loop();
      }
      if (abs(mouseX-width/2)<75 && abs(mouseY-(height/2+75))<12.5) {
        gameStarted=false;
        bombs.clear();
        gameOver=false;
        score.value=0;
        loop();
      }
    }
    if (abs(mouseX-width/2)<75 && abs(mouseY-(height/2+125))<12.5) {
      showInstructions=true;
      loop();
    }
    if (showInstructions==true && abs(mouseX-width/2)<75 && abs(mouseY-(height/2+200))<12.5) {
      showInstructions=false;
      loop();
    }
  }
}

