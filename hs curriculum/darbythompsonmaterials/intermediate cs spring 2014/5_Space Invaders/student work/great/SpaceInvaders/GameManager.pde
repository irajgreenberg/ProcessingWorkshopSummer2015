class GameManager {

  Player ship;
  ArrayList<Bullet> bullets;
  ArrayList<Alien> aliens;
  ArrayList<Bomb> bombs;
  ArrayList<LifeUpgrade> extralives;
  ArrayList<SlowDowngrade> depressants;
  ArrayList<FastUpgrade> flashes;
  ArrayList<ShrinkUpgrade> shrinkers;
  ArrayList<GrowthDowngrade> enlargers;
  boolean hitRightWall;
  boolean hitLeftWall;
  boolean gameEnded;
  int Level;
  int difficulty;

  GameManager() {
    ship = new Player(400, 600, 4, 3, 0, 60, 30);
    bullets = new ArrayList();
    aliens = new ArrayList();
    for (int i=0; i<30; i++) {
      Alien a = new Alien(100+(i%6)*60, 50+60*(int)((i%30)/6), 2);
      aliens.add(a);
    }
    bombs = new ArrayList();
    extralives = new ArrayList();
    depressants = new ArrayList();
    flashes = new ArrayList();
    shrinkers = new ArrayList();
    enlargers = new ArrayList();
    gameEnded = false;
    hitRightWall = false;
    hitLeftWall = false;
    Level = 1;
  }

  // draws all the various objects as long as the game is in progress
  void display() {
    if (gameEnded == false) {
      ship.draw();
      for (Bullet B: bullets) {
        B.draw();
      }

      for (Alien A: aliens) {
        A.draw();
      }

      for (Bomb B: bombs) {
        B.draw();
      }

      for (LifeUpgrade L: extralives) {
        L.draw();
      }

      for (SlowDowngrade S: depressants) {
        S.draw();
      }

      for (FastUpgrade F: flashes) {
        F.draw();
      }

      for (ShrinkUpgrade Sh: shrinkers) {
        Sh.draw();
      }

      for (GrowthDowngrade G: enlargers) {
        G.draw();
      }

      //shows lives
      textSize(32);
      stroke(0);
      fill(255);
      text(str(ship.lives), 10, 30);

      //shows score
      textSize(32);
      stroke(0);
      fill(255);
      text(str(ship.score), 680, 30);

      //shows level
      textSize(32);
      stroke(0);
      fill(255);
      text(str(Level), 375, 30);
    }
    else {
      textSize(32);
      stroke(0);
      // shows game over screen
      if (ship.lives<=0) {
        fill(127, 255, 212);
        text("Game Over :(", 300, 380);
        text("Your score is", 290-7*(int)log(ship.score), 420);
        text(str(ship.score), 500-7*(int)log(ship.score), 420);
      }
      // shows you win screen
      else {
        fill(127, 255, 212);
        text("You Win!", 320, 380);
        text("Your score is", 290-7*(int)log(ship.score), 420);
        text(str(ship.score), 500-7*(int)log(ship.score), 420);
      }
    }
  }

  void update() {

    // alters the difficulty (randomization factor) based on the level
    difficulty = 16-Level;

    if (gameEnded == false) {
      // moves the ship
      ship.move();

      // tests whether a bullet has hit an alien and responds accordingly by removing the correct bullet and alien
      for (int j=aliens.size()-1; j>=0; j--) {
        for (int i=bullets.size()-1; i>=0; i--) {
          Bullet b = bullets.get(i);
          Alien a = aliens.get(j);
          if (b.x>=a.x && b.x<=a.x+50 && b.y>=a.y && b.y<=a.y+50) {
            aliens.remove(a);
            bullets.remove(b);
            ship.score = ship.score+10*Level;
            break;
          }
        }
      }

      // removes the bullet and deducts points when the bullets miss all aliens and go off the screen
      for (int i=bullets.size()-1; i>=0; i--) {
        Bullet B = bullets.get(i);
        if (B.y<=0) {
          bullets.remove(i);
          ship.score = ship.score-5;
        }
        else {
          B.move();
        }
      }

      // enables the aliens to move as a block (wall collision detection)
      for (int i=aliens.size()-1; i>=0; i--) {
        Alien A = aliens.get(i);
        if (A.x>=750) {
          hitRightWall = true;
        }
        if (A.x<=0) {
          hitLeftWall = true;
        }
      }

      if (hitRightWall == true) {
        for (int i=aliens.size()-1; i>=0; i--) {
          Alien A = aliens.get(i);
          A.x=A.x-2;
          A.y=A.y+25;
          A.v=-A.v;
        }
        hitRightWall = false;
      }
      if (hitLeftWall == true) {
        for (int i=aliens.size()-1; i>=0; i--) {
          Alien A = aliens.get(i);
          A.x=A.x+2;
          A.y=A.y+25;
          A.v=-A.v;
        }
        hitLeftWall = false;
      } 

      // checks if the aliens hit the ships
      for (int i=aliens.size()-1; i>=0; i--) {
        Alien A = aliens.get(i);
        A.move();
        if (A.x>=ship.x-50 && A.x<=ship.x+60 && A.y>=ship.y-50 && A.y<=ship.y+30) {
          ship.lives = 0;
        }
      }

      // drops bombs randomly from the aliens with a frequency dependent on the difficulty (inversely proportional to the randomization factor)
      int r1a = (int)random(difficulty);
      int r1b = (int)random(difficulty);
      if (aliens.size()>=1) {
        if (r1a==r1b) {
          int r1c = (int)random(aliens.size());
          Alien A = aliens.get(r1c);
          Bomb b = new Bomb(A.x+25, A.y+50, 5);
          bombs.add(b);
        }
      }

      // randomly drops random upgrades
      int k2 = 80;
      int r2a = (int)random(k2);
      int r2b = (int)random(k2);
      int ru = (int)random(5);
      if (aliens.size()>=1) {
        if (r2a==r2b) {
          int r2c = (int)random(aliens.size());
          Alien A = aliens.get(r2c);
          LifeUpgrade l = new LifeUpgrade(A.x+25, A.y+50, 5);
          SlowDowngrade s = new SlowDowngrade(A.x+25, A.y+50, 5);
          FastUpgrade f = new FastUpgrade(A.x+25, A.y+50, 5);
          ShrinkUpgrade sh = new ShrinkUpgrade(A.x+25, A.y+50, 5);
          GrowthDowngrade g = new GrowthDowngrade(A.x+25, A.y+50, 5);
          if (ru==0) {
            extralives.add(l);
          }
          if (ru==1) {
            depressants.add(s);
          }
          if (ru==2) {
            flashes.add(f);
          }
          if (ru==3) {
            shrinkers.add(sh);
          }
          if (ru==4) {
            enlargers.add(g);
          }
        }
      }

      // removes bombs and lives when a bomb hits the ship
      for (int i=bombs.size()-1; i>=0; i--) {
        Bomb b = bombs.get(i);
        if (b.x>=ship.x && b.x<=ship.x+ship.w && b.y>=ship.y && b.y<=ship.y+ship.h) {
          bombs.remove(b);
          ship.lives = ship.lives-1;
        }
        else if (b.y>=800) {
          bombs.remove(i);
        }
        else {
          b.move();
        }
      }

      // gives extra lives when an extra-life upgrade is collected
      for (int i=extralives.size()-1; i>=0; i--) {
        LifeUpgrade l = extralives.get(i);
        if (l.x>=ship.x && l.x<=ship.x+ship.w && l.y>=ship.y && l.y<=ship.y+ship.h) {
          extralives.remove(l);
          ship.lives = ship.lives+1;
        }
        else if (l.y>=800) {
          extralives.remove(i);
        }
        else {
          l.move();
        }
      }

      // slows down the ship for a slow downgrade
      for (int i=depressants.size()-1; i>=0; i--) {
        SlowDowngrade s = depressants.get(i);
        if (s.x>=ship.x && s.x<=ship.x+ship.w && s.y>=ship.y && s.y<=ship.y+ship.h) {
          depressants.remove(s);
          ship.vi=0.5*ship.vi;
        }
        else if (s.y>=800) {
          depressants.remove(i);
        }
        else {
          s.move();
        }
      }

      // speeds up the ship for a fast upgrade
      for (int i=flashes.size()-1; i>=0; i--) {
        FastUpgrade f = flashes.get(i);
        if (f.x>=ship.x && f.x<=ship.x+ship.w && f.y>=ship.y && f.y<=ship.y+ship.h) {
          flashes.remove(f);
          ship.vi=2*ship.vi;
        }
        else if (f.y>=800) {
          flashes.remove(i);
        }
        else {
          f.move();
        }
      }

      // shrinks the ship for a shrinker
      for (int i=shrinkers.size()-1; i>=0; i--) {
        ShrinkUpgrade sh = shrinkers.get(i);
        if (sh.x>=ship.x && sh.x<=ship.x+ship.w && sh.y>=ship.y && sh.y<=ship.y+ship.h) {
          shrinkers.remove(sh);
          ship.w=0.5*ship.w;
          ship.h=0.5*ship.h;
        }
        else if (sh.y>=800) {
          shrinkers.remove(i);
        }
        else {
          sh.move();
        }
      }

      // expands the ship's size for a growth downgrade
      for (int i=enlargers.size()-1; i>=0; i--) {
        GrowthDowngrade g = enlargers.get(i);
        if (g.x>=ship.x && g.x<=ship.x+ship.w && g.y>=ship.y && g.y<=ship.y+ship.h) {
          enlargers.remove(g);
          ship.w=2*ship.w;
          ship.h=2*ship.h;
        }
        else if (g.y>=800) {
          enlargers.remove(i);
        }
        else {
          g.move();
        }
      }

      // updates the levels and objects until the game is won (after the 15th level)
      if (aliens.size()==0) {
        if (Level<=14) {
          Level=Level+1;
          ship.lives=3;
          for (int i=bullets.size()-1; i>=0; i--) {
            bullets.remove(i);
          }
          for (int i=bombs.size()-1; i>=0; i--) {
            bombs.remove(i);
          }
          for (int i=extralives.size()-1; i>=0; i--) {
            extralives.remove(i);
          }
          for (int i=depressants.size()-1; i>=0; i--) {
            depressants.remove(i);
          }
          for (int i=flashes.size()-1; i>=0; i--) {
            flashes.remove(i);
          }
          for (int i=shrinkers.size()-1; i>=0; i--) {
            shrinkers.remove(i);
          }
          for (int i=enlargers.size()-1; i>=0; i--) {
            enlargers.remove(i);
          }
          for (int i=0; i<30; i++) {
            Alien a = new Alien(100+(i%6)*60, 50+60*(int)((i%30)/6), 2);
            aliens.add(a);
          }
          ship.x=400;
          ship.w=60;
          ship.h=30;
          ship.v=0;
          ship.vi=4;
        }

        else {
          gameEnded=true;
        }
      }
    }
    if (ship.lives<=0) {
      gameEnded=true;
    }
  }

  // shoots a bullet from the ship when the up key is pressed, and limits the number of bullets to 5
  void action(char key) {
    ship.action();
    // shoots bullet
    if (keyCode==UP) {
      if (bullets.size()<=5) {
        Bullet b = new Bullet(ship.x+30, ship.y, 5);
        bullets.add(b);
      }
    }
  }
}

