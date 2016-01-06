class GameManager {
  Player p;
  ArrayList<Ground> grounds;
  ArrayList<Obstacle> obstacles;
  ArrayList<Lava>lavas;
  ArrayList<Hole> holes;
  int mode;
  ArrayList<Item>items;
  boolean nextlevel;
  ArrayList<Bomb> bombs;
  boolean level3;
  AlyaAhmedSeaCreature a;
  AlyaAhmedSeaCreature b;
  AlyaAhmedSeaCreature c;
  ArrayList<Seaweed> seaweeds;



  GameManager() {

    p=new Player (300, 720);
    grounds=new ArrayList<Ground>();
    obstacles= new ArrayList<Obstacle>();
    holes=new ArrayList<Hole>(); 
    lavas= new ArrayList<Lava>();
    mode=0;
    items=new ArrayList<Item>();
    nextlevel=false;
    bombs=new ArrayList<Bomb>();
    level3=false;
    a=new AlyaAhmedSeaCreature();
    b=new AlyaAhmedSeaCreature();
    c=new AlyaAhmedSeaCreature();  
    seaweeds=new ArrayList<Seaweed>();
  }

  void update() {
    textSize(32);
    stroke(255, 0, 0);
    fill(255, 0, 0);
    String s="score";
    text(s+":"+p.score, 100, 50);

    if (mode==0) {
      String o= "welcome";
      fill(0);
      textSize(32);
      text(o, 100, height/2);
      String i="click on the spacebar to jump";
      stroke(255);
      text(i, 100, (height/2)+50);
      String y="get as much ice cream as possible!!";
      text(y, 100, (height/2)+100);
      String g="click the mouse button to start";
      text(g, 100, (height/2)+150);
      if (mousePressed==true) {
        mode=1;
      }
    }


    if (mode==1) {
      int drop=int(random(0, 1000));
      int prize=int(random(0, 375));
      int impediment= int(random(0, 200));
      int counter=0;

      //creating platforms
      counter=counter+1;
      if (counter>0 && grounds.size()<=5) {
        Ground g;
        g=new Ground();
        grounds.add(g);
        counter=0;
      }

      //creating holes
      if (nextlevel==false &&level3==false) {
        if (drop==3) {
          Hole h;
          h=new Hole();
          holes.add(h);
        }
      }

      //Creating ice cream cones
      if (prize==5 ) {
        for (int t=grounds.size ()-1; t>=0; t--) {
          Item i;
          i=new Item(grounds.get(t).x+grounds.get(t).w/2, grounds.get(t).y-100);
          i.speedx=grounds.get(t).speedx;
          items.add(i);
        }
      }

      //creating obstacles
      if (nextlevel==false && level3==false) {
        if (impediment==11) {
          Obstacle o;
          o=new Obstacle();
          obstacles.add(o);
        }
      }

      //updating ice cream     
      for (int m=items.size ()-1; m>=0; m--) {
        items.get(m).update();
      }

      //updating obstacles
      for (int i=obstacles.size ()-1; i>=0; i--) {
        obstacles.get(i).update();
        if (obstacles.get(i).x+obstacles.get(i).w<=0) {
          obstacles.remove(i);
        }
      }

      //moving obstacles from going through holes      
      for (int i=obstacles.size ()-1; i>=0; i--) {
        for (int j=holes.size ()-1; j>=0; j--) {
          if (obstacles.get(i).x <=holes.get(j).x + holes.get(j).w && obstacles.get(i).x+obstacles.get(i).w>=holes.get(j).x) {
            obstacles.get(i).x= holes.get(j).x-obstacles.get(i).w-1 ;
          }
        }
      } 

      //Expanding and updating holes
      for (int i=holes.size ()-1; i>=0; i--) {
        if (drop==2) {
          holes.get(i).w= holes.get(i).w+10;
        }
        holes.get(i).update();
        if (holes.get(i).x + holes.get(i).w<0) {
          holes.remove(i);
        }
      }

      //Updating platforms
      for (int i=grounds.size ()-1; i>=0; i--) { 
        grounds.get(i).update();
        if (grounds.get(i).x + grounds.get(i).w <0) {
          grounds.remove(i);
        }
      }

      //platform collision detection
      for (int i=grounds.size ()-1; i>=0; i--) {
        if (p.speedy<0) {
          if (abs(p.y+p.h-grounds.get(i).y)<=20) {
            if (p.x+p.w>=grounds.get(i).x && p.x<= grounds.get(i).x+grounds.get(i).w) {
              p.speedy=0;
              p.y=grounds.get(i).y-p.h;            
              break;
            }
          }
        }
      }

      //hole detection 
      for (int i=holes.size ()-1; i>=0; i--) {
        if (p.x>=holes.get(i).x+2 && p.x+p.w<=holes.get(i).x+holes.get(i).w) {
          if (p.y+p.w>=holes.get(i).y) {
            p.fall=false;
            mode=2;
          }
        } else {
          p.fall=true;
        }
      }
      //doesnt let the player stay up at the top of the screen
      if (p.y+p.h<=-50) {
        p.score=p.score-1;
      }


      //ice cream detection
      for (int i=items.size ()-1; i>=0; i--) {
        if (p.y<=items.get(i).y+100 && p.y>=items.get(i).y-5) {
          if (p.x+p.w>=items.get(i).x && p.x<=items.get(i).x+items.get(i).w+3) {
            p.score=p.score+5;
            items.remove(i);
            break;
          }
        }
      }
    }

    //obstacle detection
    for (int i=obstacles.size ()-1; i>=0; i--) {
      if (p.y+p.h >= obstacles.get(i).y) {
        if (p.x+p.w>=obstacles.get(i).x && p.x<=obstacles.get(i).x + obstacles.get(i).w) {
          p.speedy=0;
          p.y=abs(p.h-obstacles.get(i).y);
          mode=2;
          break;
        }
      }
    }

    //creating lava/new level
    if (p.score>=100) {
      level3=false;
      nextlevel=true;
      Lava l;
      l=new Lava(); 
      lavas.add(l);


      for (int i=seaweeds.size ()-1; i>=0; i--) {
        seaweeds.remove(i);
      }
    }


    // next level
    if (nextlevel==true) {

      if (p.y+p.h>=760) {
        mode=2;
      }
      int pie=int(random(0, 150));
      //bomb creation 
      if (pie==20) {
        Bomb b;
        b=new Bomb();
        bombs.add(b);
      }
      for (int i=bombs.size ()-1; i>=0; i--) {
        bombs.get(i).update();
        if (bombs.get(i).x+bombs.get(i).w<=0) {
          bombs.remove(i);
        }
      }
      //bomb collision
      for (int i=bombs.size ()-1; i>=0; i--) {
        if (p.y+p.w >= bombs.get(i).y && p.y<= bombs.get(i).y + bombs.get(i).w) {
          if (p.x+p.w>=bombs.get(i).x && p.x<=bombs.get(i).x + bombs.get(i).w) {
            bombs.remove(i); 
            mode=2;
            break;
          }
        }
      }
    }


    //level 3
    if (p.score>=75 && p.score<100) {
      level3=true; 
      Seaweed d;
      d=new Seaweed(); 
      seaweeds.add(d);
    }

    if (level3==true) {
      a.swim();
      b.swim();
      c.swim();

      //p.speedy=2;
    }

    if (level3==true || nextlevel==true) {
      for (int i=obstacles.size ()-1; i>=0; i--) {
        obstacles.remove(i);
      } 

      for (int i=holes.size ()-1; i>=0; i--) {
        holes.remove(i);
      }
    }

    //fish and player collision
    if (p.x+p.w>=a.x-(a.radius/2) && p.x<=a.x+a.radius) {
      if (p.y<=a.y+a.radius && p.y+p.h>=a.y) {
        mode=2;
      }
    }
    if (p.x+p.w>=b.x-(b.radius/2) && p.x<=b.x+b.radius) {
      if (p.y<=b.y+b.radius && p.y+p.h>=b.y) {
        mode=2;
      }
    } 
    if (p.x+p.w>=c.x-(c.radius/2) && p.x<=c.x+c.radius) {
      if (p.y<=c.y+c.radius && p.y+p.h>=c.y) {
        mode=2;
      }
    }  


    //losing screen     
    if (mode==2) {
      String l= "You lose";
      fill(0);
      textSize(32);
      text(l, width/2, height/2);
      String r="reset";
      stroke(255);
      text(r, (width/2)+50, (height/2)+50);
      for (int i=bombs.size ()-1; i>=0; i--) {
        bombs.get(i).speedx=0;
      }
      if (mousePressed) {
        if (mouseX>(width/2)-100 && mouseX<(width/2)+100 && mouseY<(height/2)+50 && mouseY>(height/2)-50) {
          setup();
        }
      }
    }
  }

  void display() {
    //player stuff  
    p.display();
    p.fall(2);
    if (p.fall==true && mode==1) {
      p.jump();
      p.move();
    }
    if (p.fall==false) {
      p.fall(6);
    }



    //the grass    
    if (level3==false) {
      fill(20, 137, 3);
      stroke(20, 137, 3);
      rect(0, 760, width, 40);
    }
    if (level3==true) {
      a.display();
      b.display();
      c.display();
    }

    for (Hole h : holes) {
      h.display();
    }

    for (Ground g : grounds) {
      g.display();
    }
    for (Item i : items) {
      i.display();
    }

    for (Obstacle o : obstacles) {
      o.display();
    }

    for (Bomb b : bombs) {
      b.display();
    }
    for (Seaweed d : seaweeds) {
      d.display();
    }  
    for (Lava l : lavas) {
      l.display();
    }
  }
}

