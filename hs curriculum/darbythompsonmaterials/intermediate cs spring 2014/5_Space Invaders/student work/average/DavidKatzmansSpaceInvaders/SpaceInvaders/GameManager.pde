//David Katzman's SpaceInvaders Program

class GameManager {

  Player p;
  ArrayList<Bullet> b;
  ArrayList<Alien> a;
  ArrayList<Bomb> bombs;
  int makebomb=500;
  int lives=3;
  int score=0;
  boolean wall;
  boolean gameover;
  int counter;

  GameManager() {
    p=new Player();
    b=new ArrayList<Bullet>();
    a=new ArrayList<Alien>();
    bombs=new ArrayList<Bomb>();
    counter=0;
    gameover=false;
    for (int i=0; i<30; i++) {
      if (i%3==0) {
        a.add(new Alien(30*i+80, 100));
      }
      else if (i%3==1) {
        a.add(new Alien(30*(i-1)+80, 200));
      }
      else if (i%3==2) {
        a.add(new Alien(30*(i-2)+80, 300));
      }
    }
  }
  void update() {
    if (!gameover) {
      p.move();
      for (int i=0; i<b.size(); i++) {
        Bullet bullet = b.get(i);
        bullet.move();
      }
      wall=false;
      for (Alien i: a) {
        if (i.x<=0 || i.x>=width-30) {
          wall=true;
        }
      }
      for (Alien i: a) {
        if (wall) {
          i.y=i.y+i.sy;
          i.sx=-i.sx;
        }
        i.move();
        if (i.y+30>p.y) {
          gameover=true;
        }
        int bomb=(int)random(makebomb);
        if (bomb==0) {
          bombs.add(new Bomb(i.x, i.y));
        }
      }
      for (Bomb i: bombs) {
        i.move();
      }
      for (int i=b.size()-1; i>=0; i--) {
        for (int j=a.size()-1; j>=0; j--) {
          Bullet B=b.get(i);
          Alien A=a.get(j);
          if (B.x>=A.x && B.x<=A.x+30 && B.y>=A.y && B.y<=A.y+30) {
            score=score+1;
            b.remove(i);
            a.remove(j);
            break;
          }
        }
      }
      for (int i=bombs.size()-1; i>=0; i--) {
        Bomb bomb=bombs.get(i);
        if (bomb.x<p.x+100 && bomb.x>p.x && bomb.y<p.y+50 && bomb.y>p.y) {
          bombs.remove(i);
          lives=lives-1;
        }
      }
      if (lives==0 || a.size()==0 || counter==150) {
        gameover=true;
      }
    }
  }
  void display() {
    if (!gameover) {
      p.draw();
      for (int i=0; i<b.size(); i++) {
        Bullet bullet = b.get(i);
        bullet.draw();
      }
      for (Alien alien: a) {
        alien.draw();
      }      
      for (Bomb bomb: bombs) {
        bomb.draw();
      }
      fill(255);
      text("Lives: "+lives, 10, 10);
      text("Score: "+score, 10, 30);
      int ammo=150-counter;
      text("Ammo: "+ammo, 10, 50);
    }
    else if (a.size()==0){
      text("You win", 500, 500);
    }
    else{
      text("You lose", 500, 500);
    }
  }
  void action(char key) {
    p.action(key);
    if (key==CODED) {
      if (keyCode==UP) {
        b.add(new Bullet(p.x+50, p.y));
        counter=counter+1;
      }
    }
  }
}

