/**************************************************
 
 Task: robot must find the goal then go back 
 to the start the most efficient way possible
 
 Rules: you may not modify Cell.java, Maze.java 
 or Robot.java
 use this template.
 
 Instructions: robot method descriptions are given 
 in the mysolution() method.
 
 **************************************************/
//Simulated robot explores a path, finds goal, and takes the most efficent path back to the start
//modifications by Jack Hannah. 5/2/14


Robot r;// define a variable, r, to store our robot
ArrayList<String> strings;

void setup() {
  strings = new ArrayList<String>();
  r = new Robot(this, "map1.txt"); // initialize the robot and map
  frameRate(5); // use this to slow down/speed up the animation
}

void draw() {
  mysolution(); // run your solution which should make one "step" in the right direction
  r.draw();
}



// YOU MAY PUT GLOBAL VARIABLE THAT YOU NEED HERE


int numberOfMoves;
int counter;
int getOutOfGoal = 0;
boolean hasTurned = false;

void mysolution() {


  if (r.hasFoundGoal() == false) {
    if (hasTurned == false) {
      if (r.canGoLeft() == true) {
        r.turnLeft();
        hasTurned = true;
        strings.add(new String("left"));
        println("left");
      }

      else if (r.canGoStraight() == true) {
        r.move();
        strings.add(new String("move"));
        println("move");
      }


      else if (r.canGoRight() == true) {
        r.turnRight();
        hasTurned = true;
        strings.add(new String("right"));
        println("right");
      }

      else {
        r.turnRight();
        strings.add(new String("right"));
        println("right");
      }
    }

    else if (hasTurned == true) {
      if (r.canGoStraight() == true) {
        r.move();
        strings.add(new String("move"));
        println("move");
      }
      hasTurned = false;
    }
  }

  else {

    if (getOutOfGoal == 0) {
      r.turnRight();
      getOutOfGoal++;

      for (int i = strings.size()-1; i>=0; i--) {
        if (strings.get(i).compareTo("right") == 0) {
          if (strings.size()>i+1) {
            if (strings.get(i+1).compareTo("right") == 0) {
              println("distance" + (strings.size()-i));
              int count = min(i, strings.size()-i-2);
              int deleteCount=1;
              for (int j = 1; j<count; j++) {
                if (strings.get(i-j).compareTo("left")==0 && strings.get(i+1+j).compareTo("right")==0) {
                  deleteCount++;
                  println(1);
                }
                else if (strings.get(i-j).compareTo("right")==0 && strings.get(i+1+j).compareTo("left")==0) {
                  deleteCount++;
                  println(2);
                }
                else if (strings.get(i-j).compareTo("move")==0 && strings.get(i+1+j).compareTo("move")==0) {
                  deleteCount++;
                  println(3);
                }
                else {
                  println(deleteCount);
                  if (strings.get(i+deleteCount+1).compareTo("left")==0) {
                    strings.remove(i+deleteCount+1);
                    strings.add(i+deleteCount+1, "right");
                    println("change");
                  }
                  else if (strings.get(i+deleteCount+1).compareTo("right")==0) {
                    strings.remove(i+deleteCount+1);
                    strings.add(i+deleteCount+1, "left");
                    println("change");
                  }
                  else if (strings.get(i-deleteCount).compareTo("left") ==0) {
                    strings.remove(i-deleteCount);
                    strings.add(i-deleteCount, "right");
                    println("change");
                  }
                  else if (strings.get(i-deleteCount).compareTo("right") ==0) {
                    strings.remove(i-deleteCount);
                    strings.add(i-deleteCount, "left");
                    println("change");
                  }

                  for (int k = deleteCount; k>0; k--) {
                    strings.remove(i+k);
                  }
                  for (int k = 0; k<deleteCount; k++) {
                    strings.remove(i-k);
                  }
                  break;
                }
              }
            }
          }
        }
      }

    }
    else if (getOutOfGoal == 1) {
      r.turnRight();
      for (int x=strings.size()-1; x>0; x--) {
        if (strings.get(x).compareTo("left") == 0 && strings.get(x-1).compareTo("right") == 0) {
          strings.remove(x);
          strings.remove(x-1);
        }
        if (strings.get(x).compareTo("right") == 0 && strings.get(x-1).compareTo("left") == 0) {
          strings.remove(x);
          strings.remove(x-1);
        }
      }
      counter = strings.size()-1;
      getOutOfGoal++;
    }
    else if (getOutOfGoal == 2) {
      r.move();
      getOutOfGoal++;
    }


    else if (getOutOfGoal == 3) {

      counter--;
      int s = counter;

      if (r.isAtStart() == false) {

        if (strings.get(s).compareTo("left") == 0) {
          r.turnRight();
          println("right");
        }
        if (strings.get(s).compareTo("right") == 0) {
          r.turnLeft();
          println("left");
        }
        if (strings.get(s).compareTo("move") == 0) {
          r.move();
          println("move");
        }
      }
    }
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

