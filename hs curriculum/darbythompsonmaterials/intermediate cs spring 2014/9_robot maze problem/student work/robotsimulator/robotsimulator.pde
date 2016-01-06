/**************************************************
 
 Task: robot must find the goal then go back 
 to the start the most efficient way possible
 
 Rules: you may not modify Cell.java, Maze.java 
 or Robot.java
 use this template.
 
 Instructions: robot method descriptions are given 
 in the mysolution() method.
 
 Completed by Sam and Nour
 **************************************************/

Robot r;// define a variable, r, to store our robot
ArrayList <Location> l;
int direction;
int x;
int y;
int h;

void setup() {
  x=0;
  y=0;
  direction=0;// down=0,right=1, up=2, left=3
  l= new ArrayList();
  r = new Robot(this, "map1.txt"); // initialize the robot and map
  frameRate(7); // use this to slow down/speed up the animation
}

void draw() {
  mysolution(); // run your solution which should make one "step" in the right direction
  r.draw();
}



// YOU MAY PUT GLOBAL VARIABLE THAT YOU NEED HERE

void mysolution() {
  if (r.hasFoundGoal()==false) {
    if (x==6) {
      print("hi");
    }
    if (r.canGoRight()==true) {
      r.turnRight();
      r.move();
      direction--;
      if (direction==-1) {
        direction=3;
        x--;
      }
      if (direction==2) {
        y--;
      }
      if (direction==1) {
        x++;
      }
      if (direction==0) {
        y++;
      }
      for (int i=0; i<l.size(); i++) {
        if (l.get(i).x==x && l.get(i).y==y && l.get(i).numOfTime==false) {
          l.get(i).numOfTime=true;
        }
        if (l.get(i).x==x && l.get(i).y==y) {
          h=1;
        }
      }
      if (h==0) {
        Location a = new Location(x, y);
        l.add(a);
      }
      h=0;
    }
    else if (r.canGoStraight()==true) {
      r.move();
      if (direction==3) {
        x--;
      }
      if (direction==2) {
        y--;
      }
      if (direction==1) {
        x++;
      }
      if (direction==0) {
        y++;
      }
      for (int i=0; i<l.size(); i++) {
        if (l.get(i).x==x && l.get(i).y==y && l.get(i).numOfTime==false) {
          l.get(i).numOfTime=true;
        }
        if (l.get(i).x==x && l.get(i).y==y) {
          h=1;
        }
      }
      if (h==0) {
        Location a = new Location(x, y);
        l.add(a);
      }
      h=0;
    }

    else if (r.canGoLeft()==true) {
      r.turnLeft();
      r.move();
      direction++;
      if (direction==3) {
        x--;
      }
      if (direction==2) {
        y--;
      }
      if (direction==1) {
        x++;
      }
      if (direction==4) {
        direction=0;
        y++;
      }
      for (int i=0; i<l.size(); i++) {
        if (l.get(i).x==x && l.get(i).y==y && l.get(i).numOfTime==false) {
          l.get(i).numOfTime=true;
        }
        if (l.get(i).x==x && l.get(i).y==y) {
          h=1;
        }
      }
      if (h==0) {
        Location a = new Location(x, y);
        l.add(a);
      }
      h=0;
    }

    else {
      direction=direction+2;
      if (direction==3) {
        x--;
      }
      if (direction==2) {
        y--;
      }
      if (direction==5) {
        direction=1;
        x++;
      }
      if (direction==4) {
        direction=0;
        y++;
      }
      for (int i=0; i<l.size(); i++) {
        if (l.get(i).x==x && l.get(i).y==y && l.get(i).numOfTime==false) {
          l.get(i).numOfTime=true;
        }
        if (l.get(i).x==x && l.get(i).y==y) {
          h=1;
        }
      }
      if (h==0) {
        Location a = new Location(x, y);
        l.add(a);
      }
      h=0;
      r.turnRight();
      r.turnRight();
      r.move();
    }
  }
  else if (r.isAtGoal()==true) {
    r.turnLeft();
    r.turnLeft();
    r.move();
    direction=direction+2;
    if (direction==3) {
      x--;
    }
    if (direction==2) {
      y--;
    }
    if (direction==5) {
      direction=1;
      x++;
    }
    if (direction==4) {
      direction=0;
      y++;
    }
    //  for (int i=0; i<l.size(); i++) {
    //   print(l.get(i).numOfTime);
    // }
  }
  else {
    for (int i=0; i<l.size(); i++) {
      if (l.get(i).x==x && l.get(i).y==y) {
        if (l.get(i).numOfTime==false) {
          if (r.canGoLeft()==true) {
            r.turnLeft();
            r.move();
            direction++;
            if (direction==3) {
              x--;
            }
            if (direction==2) {
              y--;
            }
            if (direction==1) {
              x++;
            }
            if (direction==4) {
              direction=0;
              y++;
            }
          }
          else if (r.canGoStraight()==true) {
            r.move();
            if (direction==3) {
              x--;
            }
            if (direction==2) {
              y--;
            }
            if (direction==1) {
              x++;
            }
            if (direction==0) {
              y++;
            }
          }
          else {
            r.turnRight();
            r.move();
            direction--;
            if (direction==-1) {
              direction=3;
              x--;
            }
            if (direction==2) {
              y--;
            }
            if (direction==1) {
              x++;
            }
            if (direction==0) {
              y++;
            }
          }
        }
        else {
          if (r.canGoRight()==true) {
            r.turnRight();
            r.move();
            direction--;
            if (direction==-1) {
              direction=3;
              x--;
            }
            if (direction==2) {
              y--;
            }
            if (direction==1) {
              x++;
            }
            if (direction==0) {
              y++;
            }
          }
          else if (r.canGoStraight()==true) {
            r.move();
            if (direction==3) {
              x--;
            }
            if (direction==2) {
              y--;
            }
            if (direction==1) {
              x++;
            }
            if (direction==0) {
              y++;
            }
          }
          else {
            r.turnLeft();
            r.move();
            direction++;
            if (direction==3) {
              x--;
            }
            if (direction==2) {
              y--;
            }
            if (direction==1) {
              x++;
            }
            if (direction==4) {
              direction=0;
              y++;
            }
          }
        }
      }
    }
  }
}

