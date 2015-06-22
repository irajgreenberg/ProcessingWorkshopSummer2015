class GameManager {
  Minion M;
  ArrayList <FreezeRay> freezerays;
  ArrayList <EvilMinions> evilminions;
  boolean freezerayhit;
  PImage v;
  PImage g;

  GameManager() {
    M=new Minion(width/2, height-150);
    evilminions= new ArrayList <EvilMinions>();
    for (int x=1; x<=300; x++) {
      evilminions.add( new EvilMinions(x*700, 680));
    }
    freezerays=new ArrayList<FreezeRay>();
    freezerays.add(new FreezeRay(100, 580));
    for (int x=1; x<=50; x++) {
      /*println(random(freezerays.get(freezerays.size()-1).y, freezerays.get(freezerays.size()-1).y));
       if (freezerays.get(freezerays.size()-1).y-200<300) {
       freezerays.get(freezerays.size()-1).y=(int)random(300, freezerays.get(freezerays.size()-1).y+200);
       
       }
       if (freezerays.get(freezerays.size()-1).y+100>680) {
       freezerays.get(freezerays.size()-1).y= (int)random(freezerays.get(freezerays.size()-1).y-200, 680);
       }
       
       else {
       
       */
      //FreezeRay F=new FreezeRay(x*400, (int)random(freezerays.get(freezerays.size()-1).y-200, freezerays.get(freezerays.size()-1).y+100));
      FreezeRay F=new FreezeRay(x*400, (int)random(350, 650));
      //make random call for y= y of previous one plus some number
      freezerays.add(F);
    }
    v=loadImage("vector.jpg");
    g=loadImage("Despicable-Me-2-Pictures-Of-Gru-.jpg");
  }

  void update() {
    println(freezerays.size());
    if (M.lives>=1) {
      freezerayhit=false;
      textSize(30);
      fill(255);
      text("Score:" + M.score, 50, 50);
      text("Lives:" + M.lives, 800, 50);

      if (freezerayhit==false) {
        M.move();
      }

      for (int i=0; i<freezerays.size()-1;i++) {
        freezerays.get(i).move();
      }

      for (int i=freezerays.size()-1;i>=0;i--) {
        if (freezerays.get(i).x+200<0) {
          freezerays.remove(i);
          M.addscore();
        }
      }
      for (int i=freezerays.size()-1;i>=0;i--) {
        if (freezerays.get(i).x<=M.x+100 && freezerays.get(i).x+200>=M.x) {
          if (freezerays.get(i).y>=M.y+120-M.speed && M.y+120+M.speed>=freezerays.get(i).y) {
            freezerayhit=true;
            M.y=freezerays.get(i).y-120;
            M.speed=0;
            M.jumpcount=0;
          }
          if (freezerayhit==true) {
            M.speed=0;
          }
        }
      }

      for (int i=0; i<evilminions.size()-1; i++) {
        evilminions.get(i).move();
      }
      for (int i=0; i<evilminions.size()-1; i++) {
        if (evilminions.get(i).x+120<0) {
          evilminions.remove(i);
        }
      }
      //collision detection between minion and evil minions
      for (int i=evilminions.size()-1;i>=0;i--) {
        if (evilminions.get(i).x <= M.x+110 && evilminions.get(i).x>=M.x) {
          if (evilminions.get(i).y<=M.y+120 && evilminions.get(i).y>=M.y) {
            evilminions.remove(i);
            M.loselife();
          }
        }
        if (evilminions.get(i).x+120>=M.x && evilminions.get(i).x<=M.x) {
          if (evilminions.get(i).y<=M.y+120 && evilminions.get(i).y>=M.y) {
            evilminions.remove(i);
            M.loselife();
          }
        }
      }
    }
    //ending game
    if (M.lives==0) {
      image(v, 0, 0, width, height);
      textSize(100);
      fill(255, 0, 0);
      text("OHH YEAH", 250, 400);
      text("YOU LOSE!", 250, 600);
      text("Score:" + M.score, 270, 800);
    }
    if (freezerays.size()<=1 || evilminions.size()<=1 && M.lives>=1) {
      image(g,0,0,width,height);
      textSize(100);
      fill(0,255,0);
      text("That's How You Roll!!",0,200);
      text("YOU WIN!",250,400);
      text("Score:"+ M.score, 270,600);
    }
    
  }
  void display() {
    if (M.lives>=1 && freezerays.size()>=2 && evilminions.size()>=2) {
      M.draw();
      for (int i=0; i<freezerays.size()-1; i++) {
        freezerays.get(i).draw();
      }
      for (int i=0; i<evilminions.size()-1; i++) {
        evilminions.get(i).draw();
      }
    }
  }
  void action(char key) {
    M.jump(key);
  }
}

