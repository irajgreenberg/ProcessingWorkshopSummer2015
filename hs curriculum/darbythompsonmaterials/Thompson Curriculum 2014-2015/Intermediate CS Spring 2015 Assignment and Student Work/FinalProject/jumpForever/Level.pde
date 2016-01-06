 class Level {
  //level stores all of the level stuff: platforms enemies pepes etc
  public ArrayList<Platform> platforms;
  public ArrayList<Coin> coins;
  public ArrayList<Pepe> pepes;
  public ArrayList<Enemy> enemies;
  private String[] map;
  public Goal goal;

  public Level(String[] mapData) {
    map=mapData;//a text file is read in to the constructor
    platforms=new ArrayList<Platform>();
    coins=new ArrayList<Coin>();//makes empty arraylists
    pepes=new ArrayList<Pepe>();
    enemies=new ArrayList<Enemy>();
    platforms.add(new Platform(-500, 350, 1000, 1000, 2));//creates the back wall (a constant in every level)
    for (int i=0; i<map.length; i++) {//this loops through every line in the map and creates instances of all the platforms etc objects based on how many ints are in each line
      if (map[i].length()>=2) {
        if (!map[i].substring(0, 2).equals("//")) {//ability to comment out lines
          int[] thisLine=int(split(map[i], ' '));//splits over space
          if (thisLine.length==5) {//platform
            platforms.add(new Platform(thisLine[0], thisLine[1], thisLine[2], thisLine[3], thisLine[4]));
          } else if (thisLine.length==3) {//these could be coins or the goal, so it differentiates:
            if (thisLine[0]==-1) {//goal starts with -1 always
              goal=new Goal(thisLine[1], thisLine[2]);
            } else {
              for (int coinX=thisLine[0]; coinX<=thisLine[1]; coinX=coinX+30) {
                coins.add(new Coin(coinX, thisLine[2]));//makes a line of coins
              }
            } 
          } else if (thisLine.length==2) {//pepes
            pepes.add(new Pepe(thisLine[0], thisLine[1]));
          } else if (thisLine.length==8) {//moving platforms
            platforms.add(new MovingPlatform(thisLine[0], thisLine[1], thisLine[2], thisLine[3], thisLine[4], thisLine[5], thisLine[6], thisLine[7]));
          } else if (thisLine.length==4) {//enemies
            enemies.add(new Enemy(thisLine[0], thisLine[1], thisLine[2], thisLine[3]));
          }
        } 
      }
    }
  }

  public void display() {
    for (Platform plat : platforms) {//displays everything
      plat.display();
    }
    for (Coin c : coins) {
      c.display();
    }
    for (Pepe pep : pepes) {
      pep.display();
    }
    for (Enemy e : enemies) {
      e.display();
    }
    goal.display();
  }

  public void move(float grav) {
    for (Coin c : coins) {//moves everything
      c.move();
    }
    for (Pepe pep : pepes) {
      pep.move();
    }
    for (Platform plat : platforms) {
      plat.move();
    }
    for (Enemy e : enemies) {
      e.move(grav);
    }
    goal.move();
  }

  public void changeDirection(int direction) {
    for (Platform plat : platforms) {//changes the direction of everything
      plat.changeDirection(direction);
    }
    for (Coin c : coins) {
      c.changeDirection(direction);
    }
    for (Pepe pep : pepes) {
      pep.changeDirection(direction);
    }
    for (Enemy e : enemies) {
      e.changeDirection(direction);
    }
    goal.changeDirection(direction);
  }

  public void removeCoin(int pos) {
    coins.remove(pos);//removes a coin from the arraylist
  }

  public void removePepe(int pos) {
    pepes.remove(pos);//removes a pepe
  }
  public void removeEnemy(int pos) {
    enemies.remove(pos);//removes an enemy
  }
  //IT IS POSSIBLE THAT THE NEXT FEW FUNCTIONS SHOULD HAVE BEEN IN GAMEMANAGER but to be honest i was confused so i put them here, and then dug myself so deep into this hole i didn't think it was worth my time to fix it
  public boolean collide(SquareThing a, SquareThing b) {//detects for any collision between two objects

    if (abs(a.x-b.x)<a.wide/2+b.wide/2&&abs(a.y-b.y)<a.tall/2+b.tall/2) {
      return true;
    }
    return false;
  }

  public boolean topCollide(SquareThing a, SquareThing b) {//detects collision between one object and the TOP of another
    if (abs(a.x-b.x)<=a.wide/2+b.wide/2&&a.y+a.tall/2>=b.y-b.tall/2&&a.y+a.tall/2<=b.y+b.tall/2) {
      return true;
    }
    return false;
  }

  public boolean bottomCollide(SquareThing a, SquareThing b) {//detects collidion between one object and the BOTTOM on another
    if (abs(a.x-b.x)<=a.wide/2+b.wide/2&&a.y-a.tall/2<=b.y+b.tall/2&&a.y-a.tall/2>=b.y-b.tall/2) {
      return true;
    }
    return false;
  }
  
  public void reset() {//resets the level after player death by clearing everything and re-adding it
    platforms.clear();
    coins.clear();
    pepes.clear();
    enemies.clear();
    platforms.add(new Platform(-500, 350, 1000, 1000, 2));
    for (int i=0; i<map.length; i++) {
      if (map[i].length()>=2) {
        if (!map[i].substring(0, 2).equals("//")) {
          int[] thisLine=int(split(map[i], ' '));
          if (thisLine.length==5) {
            platforms.add(new Platform(thisLine[0], thisLine[1], thisLine[2], thisLine[3], thisLine[4]));
          } else if (thisLine.length==3) {
            if (thisLine[0]==-1) {
              goal=new Goal(thisLine[1], thisLine[2]);
            } else {
              for (int coinX=thisLine[0]; coinX<=thisLine[1]; coinX=coinX+30) {
                coins.add(new Coin(coinX, thisLine[2]));
              }
            }
          } else if (thisLine.length==2) {
            pepes.add(new Pepe(thisLine[0], thisLine[1]));
          } else if (thisLine.length==8) {
            platforms.add(new MovingPlatform(thisLine[0], thisLine[1], thisLine[2], thisLine[3], thisLine[4], thisLine[5], thisLine[6], thisLine[7]));
          } else if (thisLine.length==4) {
            enemies.add(new Enemy(thisLine[0], thisLine[1], thisLine[2], thisLine[3]));
          }
        }
      }
    }
  }
}

