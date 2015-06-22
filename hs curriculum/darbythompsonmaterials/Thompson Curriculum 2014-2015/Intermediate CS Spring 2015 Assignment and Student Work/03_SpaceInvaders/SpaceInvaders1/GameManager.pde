class GameManager {
  Player player;
  ArrayList<Bullet> bullets;
  ArrayList<Alien> aliens;
  Boolean x;
  ArrayList<Bomb> bombs;
  int y;
  int z;
  Boolean gamemode=false;
  Boolean gamewin=false; 
  Boolean gamelose=false;
  int life=3;
  int score=0;
  GameManager() {
    player= new Player();
    bullets= new ArrayList<Bullet>();
    aliens= new ArrayList<Alien>();
    bombs= new ArrayList<Bomb>();
    for (int x=1; x<12; x++) {
      for (int y=1; y<6; y++) {
        aliens.add(new Alien(x*60, y*60));
      }
    }
  }
  void update() { 
    if (gamemode==false) {
      textSize(75);
      text("press s to START", 200, 350);
      textSize(40);
      text("press p to pause and any other key to continue", 50, 450);
      if (keyPressed) {
        if (key=='s') {
          gamemode=true;
        }
      }
    }
    if (gamemode==true && key!='p') {
      y= int(random(0, 1000));
      z= int (random(0, aliens.size()-1));
      x=false; 
      player.move();

      player.changespeed();

      for (int y=bullets.size ()-1; y>=0; y--) { 
        bullets.get(y).move();
      }

      if (key==' ' && keyPressed==true && bullets.size()<20) {
        bullets.add(new Bullet(player.x+45));
      }
      for (int i=bullets.size ()-1; i>=0; i--) {
        if (bullets.get(i).y==0 ) {
          bullets.remove(i);
        }
      }
      for (int i=aliens.size ()-1; i>=0; i--) {
        aliens.get(i).move();
      }
      for (int i=aliens.size ()-1; i>=0; i--) {
        if (aliens.get(i).x== width-50 || aliens.get(i).x==0) {
          x=true;
        }
      }
      if (x==true) {
        for (int z=aliens.size ()-1; z>=0; z--) {
          aliens.get(z).changedirection();
        }
      }
      for (int x=aliens.size ()-1; x>=0; x--) {
        for (int y=bullets.size ()-1; y>=0; y--) {
          if (bullets.get(y).x<=aliens.get(x).x+50 && bullets.get(y).x>=aliens.get(x).x && bullets.get(y).y<=aliens.get(x).y+50 && bullets.get(y).y>=aliens.get(x).y) {
            bullets.remove(y);
            aliens.remove(x);
            score=score+5;
            break;
          }
        }
      }
      for (int x=aliens.size ()-1; x>=0; x--) {
        if (aliens.get(x).y >= player.y) {
          gamelose=true;
        }
      }
      if (aliens.size()==0) {
        gamewin=true;
      }
      if (aliens.size()>0) {
        if (y<10) {
          bombs.add(new Bomb(aliens.get(z).x+20, aliens.get(z).y+40));
        }
      }
      for (int x=bombs.size ()-1; x>=0; x--) {
        bombs.get(x).move();
      }

      for (int x=bombs.size ()-1; x>=0; x--) {
        if (bombs.get(x).y>=height) {
          bombs.remove(x);
        }
      }

      for (int x=bombs.size ()-1; x>=0; x--) {
        if (bombs.get(x).x> player.x && bombs.get(x).x<player.x+100 && bombs.get(x).y>player.y && bombs.get(x).y<player.y+50) {
          bombs.remove(x);
          life=life-1;
          score=score-10;
          break;
        }
      }
      if (life<=0) {
        gamelose=true;
      }
      if (score<0) {
        gamelose=true;
        score=0;
      }
    }
  }
  void display() {
    if (gamemode==true && gamewin==false && gamelose==false) {
      player.display();

      for (int i=bullets.size ()-1; i>=0; i--) {
        bullets.get(i).display();
      }

      for (int i=aliens.size ()-1; i>=0; i--) {
        aliens.get(i).display();
      }
      for (int i=bombs.size ()-1; i>=0; i--) {
        bombs.get(i).display();
      }
      textSize(30);
      text("Lives: " + life, 300, 40);
      text("Score: "+ score, 500, 40);
    }
    if (gamewin==true) {
      textSize(150);
      text("YOU WON!!!!", 75, 400);
      textSize(50);
      text("Final Score: " + score, 350, 550);
    }
    if (gamelose==true) {
      textSize(100);
      text(" sorry you lost :(", 100, 400);
      textSize(50);
      text("Final Score: " + score, 350, 550);
    }
  }
}

