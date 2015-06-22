/**************************************************
 
 Task: robot must find the goal then go back 
 to the start the most efficient way possible
 
 Rules: you may not modify Cell.java, Maze.java 
 or Robot.java
 use this template.
 
 Instructions: robot method descriptions are given 
 in the mysolution() method.
 
 **************************************************/

Robot r;// define a variable, r, to store our robot
StringList moves = new StringList();

void setup() {
  r = new Robot(this, "map1.txt"); // initialize the robot and map
  frameRate(10); // use this to slow down/speed up the animation
}

void draw() {
  mysolution(); // run your solution which should make one "step" in the right direction
  r.draw();
}


int d=0;
int a;


void mysolution() {
  a=0;
  if (r.hasFoundGoal()==false) {
    if (r.canGoLeft()) {
      a++;
    }
    if (r.canGoRight()) {
      a++;
    }
    if (r.canGoStraight()) {
      a++;
    }

    if (a==0) {
      r.turnRight();
      r.turnRight();
      moves.append("d");
    }

    if (r.canGoLeft()) {
      r.turnLeft();
      r.move();
      if (a>1) {
        moves.append("l");
      }
    }

    else if (r.canGoStraight()) {
      r.move();
      if (a>1) {
        moves.append("s");
      }
    }

    else if (r.canGoRight()) {
      r.turnRight();
      r.move();
      if (a>1) {  
        moves.append("r");
      }
    }

    int n = moves.size();
    if (n>1) {
      if (moves.get(moves.size()-2)=="d") {
        String b = moves.get(moves.size()-3);
        String c = moves.get(moves.size()-1);
        if (b=="l") {
          if (c=="s") {
            moves.remove(moves.size()-3);
            moves.remove(moves.size()-2);
            moves.remove(moves.size()-1);
            moves.append("r");
          }
          else if (c=="l") {
            moves.remove(moves.size()-3);
            moves.remove(moves.size()-2);
            moves.remove(moves.size()-1);
            moves.append("s");
          }
          else if (c=="r") {
            moves.remove(moves.size()-3);
            moves.remove(moves.size()-1);
          }
        }
        if (b=="s") {
          if (c=="l") {
            moves.remove(moves.size()-3);
            moves.remove(moves.size()-2);
            moves.remove(moves.size()-1);
            moves.append("r");
          }
          else if (c=="s") {
            moves.remove(moves.size()-3);
            moves.remove(moves.size()-1);
          }
        }
        if (b=="r") {
          if (c=="l") {
            moves.remove(moves.size()-3);
            moves.remove(moves.size()-1);
          }
        }
      }
    }
  }


  if (r.isAtGoal()) {
    r.turnLeft();
    r.turnLeft();
    println(moves);
  }

  if (r.hasFoundGoal()) {
    frameRate(10);
    a=0;
    if (r.canGoLeft()) {
      a++;
    }
    if (r.canGoRight()) {
      a++;
    }
    if (r.canGoStraight()) {
      a++;
    }

    if (a==1) {
      if (r.canGoLeft()) {
        r.turnLeft();
      }
      if (r.canGoRight()) {
        r.turnRight();
      }
      if (r.canGoStraight()) {
        r.move();
      }
    }

    else {
      int x = moves.size()-1;
      String b = moves.get(x);
      if (b.equals("l")) {
        r.turnRight();
        r.move();
        moves.remove(x);
      }
      if (b.equals("s")) {
        r.move();
        moves.remove(x);
      }
      if (b.equals("r")) {
        r.turnLeft();
        r.move();
        moves.remove(x);
      }
      println(moves);
    }
  }
  if (r.isAtStart()){
    noLoop();
  }
}





// YOU MAY INSERT YOUR SOLUTION CODE HERE

// Here is a definition of all the methods available to you

// Move the robot one step forwards:
// r.move();

// Turn the robot right:
// r.turnRight();

// Turn the robot left:
// r.turnLeft();

// These methods returns true or false
// r.canGoLeft();
// r.canGoRight();
// r.canGoStraight();
// r.isAtGoal();
// r.isAtStart();

// This method returns true if the robot has ever reached the goal
// r.hasFoundGoal();



