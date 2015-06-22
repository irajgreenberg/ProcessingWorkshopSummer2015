class GameManager{
  Player p;
  ArrayList<Bullet> bullets;
  ArrayList<Alien> aliens;
  ArrayList<Bomb> bombs;
  int count=0;
  int count2=0;
  boolean shots=true;
  int state=-1;
  GameManager(){
    p=new Player();
    bullets=new ArrayList<Bullet>();
    aliens=new ArrayList<Alien>();
    bombs=new ArrayList<Bomb>();
    for (int m=0; m<10; m=m+1){
      for (int n=0; n<5; n=n+1){
        Alien alien=new Alien(50*m+100,50*n+50);
        aliens.add(alien);
      }  
    }
  }
  void update(){
    //Game
    if (state==-1){
      if (mousePressed && mouseX>width/2-175 && mouseX<width/2+175 && mouseY>height/4-75 && mouseY<height/4+75){
        state=1;
      }  
    }
    //Pause Game
    count2=count2+1;
    if (state==1 && keyPressed && key=='p' && count2>10){
      state=4;
      count2=0; 
    }
    if (state==4 && keyPressed && key=='p' && count2>10){
      state=1;
      count2=0;
    } 
    if (state==1){
      //player move
      p.move();
      //bullets create
      if (keyPressed && key==' ' && shots==true){
        Bullet bullet=new Bullet(p.px+p.pwidth/2);
        bullets.add(bullet);
        shots=false;
      }
      if (shots==false) {
        count=count+1;  
      }
      if (count==30){
        shots=true;
        count=0;  
      }
      //bullets move and get removed
      for (int i=bullets.size()-1; i>=0; i=i-1){
        bullets.get(i).move();
        if (bullets.get(i).by<0){
          bullets.remove(i);
          p.score=p.score-20;  
        }
      }
      //aliens move
      for (int i=aliens.size()-1; i>=0; i=i-1){
        aliens.get(i).move();
      }
      //aliens bounce
      for (int i=aliens.size()-1; i>=0; i=i-1){
        if (aliens.get(i).ax>width-aliens.get(i).awidth || aliens.get(i).ax<aliens.get(i).awidth){
          for (int j=aliens.size()-1; j>=0; j=j-1){
            aliens.get(j).bounce();
          }    
          break;
        }
      }
      //Alien runover 
      for (int i=aliens.size()-1; i>=0; i=i-1){
        if (aliens.get(i).ay+aliens.get(i).aheight>height-p.pheight){
          p.lives=0;
          p.score=p.score-300;
          break;
        }
      }
      //bullet-alien collision
      for (int i=aliens.size()-1; i>=0; i=i-1){
        for (int j=bullets.size()-1; j>=0; j=j-1){
          if (abs(aliens.get(i).ax+aliens.get(i).awidth/2-bullets.get(j).bx)<aliens.get(i).awidth/2 && abs(aliens.get(i).ay+aliens.get(i).aheight/2-bullets.get(j).by)<aliens.get(i).aheight/2){
            bullets.remove(j);
            aliens.remove(i); 
            p.score=p.score+10;
            break;
          }     
        }
      }
      //bombs create
      if (random(0,100)<1){
        Bomb bomb=new Bomb(aliens.get(int(random(0,aliens.size()))).ax,aliens.get(int(random(0,aliens.size()))).ay);
        bombs.add(bomb);  
      }
      //bombs move and get removed
      for (int i=bombs.size()-1; i>=0; i=i-1){
        bombs.get(i).move();
        if (bombs.get(i).my>height){
          bombs.remove(i);  
        }
      }
      //bomb-player collision
      for (int i=bombs.size()-1; i>=0; i=i-1){
        if (abs(bombs.get(i).mx+bombs.get(i).mwidth/2-p.px-p.pwidth/2)<(bombs.get(i).mwidth+p.pwidth)/2 && bombs.get(i).my+bombs.get(i).mheight>height-p.pheight){
          bombs.remove(i);
          p.lives=p.lives-1;
          p.score=p.score-100;
        }   
      }
      //winning and losing
      if (p.lives<=0){
        state=0;
      }
      if (aliens.size()==0){
        state=2;
      }
    }
  }
  void display(){
    if (state==-1){
      fill(255);
      rect(width/2-175,height/4-75,350,150);
      fill(0,255,0);
      textSize(50);
      text("Click to Play",width/2-150,height/4);
    }
    if (state==1){
      //display player
      p.display();
      //display bullets
      for (int i=0; i<bullets.size(); i=i+1){
        bullets.get(i).display();
      }
      //display aliens
      for (int i=0; i<aliens.size(); i=i+1){
        aliens.get(i).display(); 
      }
      //display bombs
      for (int i=0; i<bombs.size(); i=i+1){
        bombs.get(i).display(); 
      } 
      fill(0,0,255);
      textSize(30);
      text("Lives:",50,50);
      text(p.lives,135,50);
      fill(0,0,255);
      textSize(30);
      text("Score:",width-185,50);
      text(p.score,width-90,50);
    }
    if (state==0){
      fill(255,0,0);
      textSize(200);
      text("You Lose",width/16,height/2);
      textSize(100);
      text("Score:",width/8,3*height/4);
      text(p.score,width/16+400,3*height/4);  
    }
    if (state==2){
      fill(0,0,255);
      textSize(200);
      text("You Win",width/16,height/2); 
      textSize(100);
      text("Score:",width/8,3*height/4);
      text(p.score,width/16+400,3*height/4);        
    }
    if (state==4){
      fill (0,255,0);
      textSize(200);
      text("Paused",width/16,height/2);    
    }
  }
}
