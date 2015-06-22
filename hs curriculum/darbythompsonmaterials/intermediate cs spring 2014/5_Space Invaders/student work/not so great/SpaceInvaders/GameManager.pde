class GameManager {
  Player ship;
  ArrayList<Alien>aliens;
  ArrayList<Bullet>bullets;
  ArrayList<Bomb>bombs;
  int a=0;
  int bulletnumber=0;
  GameManager() {
    ship = new Player();
    bombs= new ArrayList();
    bullets= new ArrayList();
    aliens= new ArrayList();
    for (int i=0; i<7; i++) {
      for (int j=0; j<4; j++) {
        aliens.add(new Alien(i*60 +20, j*60));
      }
    }
  }
  void update() {
    ship.move();
    for (Bullet i:bullets) {
      i.move();
    }
    for (Alien i: aliens) {
      if (i.x+30>=1000 || i.x<=0) {
        a=a+1;
      }
    }
    if (a>=1) {
      for (Alien j: aliens) {
        j.y=j.y+40;
        j.speedx=-1*j.speedx;
      }
      a=0;
    }

    for (Alien i: aliens) {
      i.move();
    }
    for (int i=bullets.size()-1;i>=0;i--) {
      if (bullets.get(i).y<0) {
        bullets.remove(i);
        bulletnumber=bulletnumber+1;
      }
    }
    for (int i=bullets.size()-1;i>=0;i--) {
      for (int j=aliens.size()-1; j>=0; j--) {
        if ((aliens.get(j).x<=bullets.get(i).x && bullets.get(i).x<aliens.get(j).x+30) && (aliens.get(j).y<bullets.get(i).y && bullets.get(i).y<aliens.get(j).y+30)) {
          bullets.remove(i);
          aliens.remove(j);
          ship.score=ship.score+1;
          bulletnumber=bulletnumber+1;
          break;
        }
      }
    }
    for (int i=bombs.size()-1; i>=0; i--) {
      if ((bombs.get(i).x>=ship.x-40 && bombs.get(i).x<=ship.x+40) && (bombs.get(i).y>=ship.y-200)) {
        bombs.remove(i);
        ship.lives=ship.lives-1;
        break;
      }
    }

    /*for (Alien i: aliens) {
     if (aliens.size()<=0) {
     background(0,255,0);
     print(ship.score);
     print("You Win");
     }
     }
     if (ship.lives<=0) {
       background(255,0,0);
       print(ship.score);
       print("You Lose");
     }
     for (Alien i: aliens) {
     if (i.get(y)=ship.y-200) {
     background(255,0,0);
     print(ship.score);
     print("You Lose");
     }*/
    //check for collisions
    //check for end of game scenarios
    for (Bomb i: bombs) {
      i.move();
    }
    if (random(100)<1) {
      int a= (int)random(aliens.size());
      bombs.add(new Bomb(aliens.get(a).x, aliens.get(a).y));
    }
  }
  void display() {
    ship.draw();
    for (Bullet i:bullets) {
      i.draw();
    }
    for (Alien i:aliens) {
      i.draw();
    }
    for (Bomb i: bombs) {
      i.draw();
    }
    //tell all objects to draw themselves
  }
  void action(char key) {
    ship.action(key);
    if (bulletnumber <=80) {
      if (key=='w') {
        bullets.add(new Bullet(ship.x, ship.y));
      }
    }
    else if (bulletnumber >=0) {
      print(ship.score);
      background(255, 0, 0);
    }
  }
}

