class GameManager {
  Player P1;
  Boss B;
  ArrayList<Bullet> Bullets;
  ArrayList<Alien> Aliens;
  ArrayList<Bomb> Bombs;
  ArrayList<Boss_Bomb> Bbombs;
  ArrayList<Money> Monies;
  int b=0;


  GameManager() {
    P1=new Player();
    P1.x=width/2;
    P1.y=height-100;
    B=new Boss(0, 10);
    Bullets=new ArrayList();
    Aliens=new ArrayList();
    Bombs=new ArrayList();
    Bbombs=new ArrayList();
    Monies=new ArrayList();



    for (int i=0;i<7;i++) { 
      Alien a= new Alien (75*i, 0);
      Aliens.add(a);
    }


    for (int i=0;i<7;i++) {
      Alien a= new Alien (75*i, 40);
      Aliens.add(a);
    }


    for (int i=0;i<7;i++) {
      Alien a= new Alien (75*i, 80);
      Aliens.add(a);
    }


    for (int i=0;i<7;i++) {
      Alien a= new Alien (75*i, 120);
      Aliens.add(a);
    }
  }


  void display() {
    P1.draw();

    if (B.Lives>0) {
      B.draw();
    }

    for (int i=Bullets.size()-1;i>=0;i--) {
      Bullets.get(i).draw();
    }


    for (int i=Aliens.size()-1;i>=0;i--) {
      Aliens.get(i).draw();
    }


    for (int i=Bombs.size()-1;i>=0;i--) {
      Bombs.get(i).draw();
    }

    for (int i=Monies.size()-1;i>=0;i--) {
      Monies.get(i).draw();
    }

    if (B.Lives>0) {
      for (int i=0;i<Bbombs.size();i++) {
        Bbombs.get(i).draw();
      }
    }


    if (P1.Winner==true) {
      textSize(62);
      fill(60, 141, 13, 150);
      text("You Win!!", 380, 500);
      text("Your Score is "+P1.score*P1.Lives, 250, 600);
    }


    if (P1.Lives<1 || b==1) {
      textSize(62);
      fill(60, 141, 13, 150);
      text("You Lose :(", 350, 500);
      text("Your Score is "+P1.score, 250, 600);
    }
  }



  void update() {

    if (P1.Lives>0 && P1.Winner==false && b==0) {
      P1.move();
      B.move();


      fill (0, 0, 255);
      textSize(40);
      text("Score:"+P1.score, 800, 50);


      fill(255, 0, 255);
      textSize(40);
      text("Lives:" + P1.Lives, 45, 50);


      for (int i=0; i<Bullets.size(); i++) {
        Bullets.get(i).move();

        if (Bullets.get(i).y==-10) {
          Bullets.remove(Bullets.get(i));
        }
      }


      for (int i=0;i<Bbombs.size();i++) {
        Bbombs.get(i).move();

        if (Bbombs.get(i).y==height+10) {
          Bbombs.remove(Bbombs.get(i));
        }
      }

      for (int i=0;i<Monies.size();i++) {
        Monies.get(i).move();
      }

      int c=0;

      for (int i=Aliens.size()-1;i>=0;i--) {
        if (Aliens.get(i).x<0 || Aliens.get(i).x>width-30) {
          c=1;
        }
      }


      for (int i=0;i<Aliens.size();i++) {
        if (c==0) {
          Aliens.get(i).move();
        }
        if (c==1) {
          Aliens.get(i).speed=-Aliens.get(i).speed;
          Aliens.get(i).move();
          Aliens.get(i).y=Aliens.get(i).y+30;
        }
      }


      for (int i=Bullets.size()-1; i>=0;i--) {
        for (int j=Aliens.size()-1; j>=0;j--) {
          if ((Aliens.get(j).x<= Bullets.get(i).x && Bullets.get(i).x<=Aliens.get(j).x+60) && (Aliens.get(j).y<= Bullets.get(i).y && Bullets.get(i).y<=Aliens.get(j).y+60)) {
            Bullets.remove(Bullets.get(i));
            Aliens.remove(Aliens.get(j));
            P1.score=P1.score+10;
            break;
          }
        }
      }


      for (int i=Bullets.size()-1; i>=0;i--) {
        for (int j=Bombs.size()-1; j>=0;j--) {
          if ((Bombs.get(j).x<= Bullets.get(i).x && Bullets.get(i).x<=Bombs.get(j).x+60) && (Bombs.get(j).y<= Bullets.get(i).y && Bullets.get(i).y<=Bombs.get(j).y+60)) {
            Bullets.remove(Bullets.get(i));
            Bombs.remove(Bombs.get(j));
            P1.score=P1.score+5;
            break;
          }
        }
      }

      for (int i=Bullets.size()-1; i>=0;i--) {
        for (int j=Bbombs.size()-1; j>=0;j--) {
          if ((Bbombs.get(j).x<= Bullets.get(i).x && Bullets.get(i).x<=Bbombs.get(j).x+60) && (Bbombs.get(j).y<= Bullets.get(i).y && Bullets.get(i).y<=Bbombs.get(j).y+60)) {
            Bullets.remove(Bullets.get(i));
            Bbombs.remove(Bbombs.get(j));
            P1.score=P1.score+5;
            break;
          }
        }
      }

      for (int i=Bullets.size()-1;i>=0;i--) {
        if ((B.x<=Bullets.get(i).x && Bullets.get(i).x<=B.x+60) && (B.y<=Bullets.get(i).y && Bullets.get(i).y<=B.y+60)) {
          Bullets.remove(Bullets.get(i));
          B.Lives=B.Lives-1;
          P1.score=P1.score+30;
        }
      }


      for (int i=Bombs.size()-1; i>=0;i--) {
        if ((P1.x<= Bombs.get(i).x && Bombs.get(i).x<=P1.x+50) && (P1.y<= Bombs.get(i).y && Bombs.get(i).y<=P1.y+15)) {       
          Bombs.remove(Bombs.get(i));
          P1.Lives=P1.Lives-1;
        }
      }
      for (int i=Monies.size()-1; i>=0;i--) {
        if ((P1.x<= Monies.get(i).x +20 && Monies.get(i).x<=P1.x+50) && (P1.y<= Monies.get(i).y +30 && Monies.get(i).y<=P1.y+15)) {       
          Monies.remove(Monies.get(i));
          P1.score=P1.score+100;
        }
      }

      for (int i=Bbombs.size()-1; i>=0;i--) {
        if ((P1.x<= Bbombs.get(i).x && Bbombs.get(i).x<=P1.x+50) && (P1.y<= Bbombs.get(i).y && Bbombs.get(i).y<=P1.y+15)) {       
          Bbombs.remove(Bbombs.get(i));
          P1.Lives=P1.Lives-2;
        }
      }


      if ((int) random(0, 500)<5) {
        if (Aliens.size()!=0) {
          int a=(int)random(0, Aliens.size()); 
          Bomb bomb=new Bomb(Aliens.get(a).x, Aliens.get(a).y);
          Bombs.add(bomb);
        }
      } 


      if ((int) random(0, 500)<1) {
        if (Aliens.size()!=0) {
          int a=(int)random(0, Aliens.size()); 
          Money money=new Money(Aliens.get(a).x, Aliens.get(a).y);
          Monies.add(money);
        }
      } 


      for (int i=0;i<Bombs.size();i++) {
        Bombs.get(i).move();
        if (Bombs.get(i).y==height-6) {
          Bombs.remove(Bombs.get(i));
        }
      }

      if (B.Lives==0) {
        P1.score=P1.score+100;
      }

      if (Aliens.size()==0 && B.Lives<1) {
        P1.Winner=true;
      }


      for (int i=Aliens.size()-1;i>=0;i--) {
        if (Aliens.get(i).y>height-100) {
          b=1;
        }
      }
    }

    if (Aliens.size()==0) {
      if ((int) random(0, 500)<10) {
        Boss_Bomb bbomb=new Boss_Bomb(B.x, B.y);
        Bbombs.add(bbomb);
      }
    }
  }



  void action(char k) {
    P1.action(k);
    if (key==CODED) {
      if (keyCode==UP) {
        if (Bullets.size()<6) {
          Bullet bullet= new Bullet(P1.x+20, height-100);
          Bullets.add(bullet);
          if (B.Lives>0) {
            Boss_Bomb bb=new Boss_Bomb(B.x, B.y);
            Bbombs.add(bb);
          }
        }
      }
    }
  }
}

