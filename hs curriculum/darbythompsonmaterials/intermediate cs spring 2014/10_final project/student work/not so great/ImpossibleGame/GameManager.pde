class GameManager {
  Player p;
  Obstacle o;
  Bonus b;
  Enemy e;
  Instructions i;
  boolean start = false;

  GameManager() {
    p = new Player();
    o = new Obstacle();
    b = new Bonus();
    e = new Enemy();
    i = new Instructions();
  }
  void display() {
    if (start==false){
    i.draw();
    }
    if (start==true) {
      o.draw();
      p.draw();
      b.draw();
      e.draw();
      fill(0, 255, 0);
      textSize(20);
      text ("Score:" + p.score, 20, 20);
    }
  }

  void update() {
    if (p.lives==1) {
      p.move();
      o.move();
      b.move();
      e.move();
      //The player gets a point everytime it bounces on top of the green block
      if (p.x+100>=o.x) {
        if (p.x<=o.x+500) {
          if (abs(o.y-(p.y+100))<=3) {
            p.y=o.y-100;
            p.speedchange(key);
            p.addpoints();
          }
        }
      }
      //The player dies if it hits the bottom of the green block
      if (p.x+100>=o.x) {
        if (p.x<=o.x+500) {
          if (abs(p.y-(o.y+30))<=3) {
            p.die();
          }
        }
      }
      //The player gets 5 extra points everytime it gets the yellow bonus ball
      if (b.x<=p.x+100) {
        if (b.x>=p.x) {
          if (b.y<=p.y+100) {
            if (b.y>=p.y) {
              p.addbonus();
              b.x=width;
            }
          }
        }
      }
      //The player dies everytime it hits the red enemy block
      if (e.x<=p.x+100) {
        if (e.x>=p.x) {
          if (e.y<=p.y+100) {
            if (e.y>=p.y) {
              p.die();
              e.x=width;
            }
          }
        }
      }
      //If the player goes off of the screen, he dies and the game is over. 
      if (p.y<=0) {
        p.die();
      }
    }
    else {
      background(0);
      textSize(100);
      fill(50, 100, 255);
      text("Game Over", width/2-300, height/2);
      textSize(75);
      text ("Score: " + p.score, width/2-200, height/2+200);
    }
  }
  void action(char key) {
    if (key=='s');
    start = true;
    p.speedchange(key);

  }
}

