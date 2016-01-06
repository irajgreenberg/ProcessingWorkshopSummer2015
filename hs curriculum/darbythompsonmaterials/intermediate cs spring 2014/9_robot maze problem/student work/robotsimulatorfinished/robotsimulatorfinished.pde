///////////////////////////////////////////////////////
// Robot Simulator: Finding a path through the #swag //
// Giri Srinivasan & Raphael Cohen-Fuentes           //
// April 11, 2014 (2014/4/11)                        //
///////////////////////////////////////////////////////

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
IntList log;
boolean backtrack;

void setup() {
  r = new Robot(this, "map1.txt"); // initialize the robot and map
  //frameRate(10); // use this to slow down/speed up the animation
  
  log = new IntList();
  backtrack = false;
}

void draw() {
  mysolution(); // run your solution which should make one "step" in the right direction
  r.draw();
}



// YOU MAY PUT GLOBAL VARIABLE THAT YOU NEED HERE

void mysolution() {
  
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
  
  // ------------------------------------------- //
  
  // Checks to see if there is more than one possible path
  // (at a junction)
  if (!r.hasFoundGoal()) {
    frameRate(10);
    int dircount = 0;
    if (r.canGoLeft()) {
      dircount++;
    }
    if (r.canGoStraight()) {
      dircount++;
    }
    if (r.canGoRight()) {
      dircount++;
    }
    
    /* 0: Left
     * 1: Straight
     * 2: Right
     * (directions are reversed after goal has been found)
     */
    
    if (r.canGoLeft()) {
      r.turnLeft();
      if (!backtrack) {
        log.append(0);
      } else {
        if (dircount > 1) {
          log.increment(log.size()-1);
          if (log.get(log.size()-1) <= 2) {
            backtrack = false;
          } else {
            log.remove(log.size()-1);
          }
        } else {
          log.remove(log.size()-1);
        }
      }
    } else if (r.canGoStraight()) {
      if (!backtrack) {
        log.append(1);
      } else {
        if (dircount > 1) {
          log.add(log.size()-1, 2);
          if (log.get(log.size()-1) <= 2) {
            backtrack = false;
          } else {
            log.remove(log.size()-1);
          }
        } else {
          log.remove(log.size()-1);
        }
      }
    } else if (r.canGoRight()) {
      r.turnRight();
      if (!backtrack) {
        log.append(2);
      } else {
        log.remove(log.size()-1);
      }
    } else {
      r.turnLeft();
      r.turnLeft();
      backtrack = true;
    }
    r.move();
    for (int i : log) {
      print(str(i) + ", ");
    }
    println();
  } else {
    frameRate(100);
    if (r.isAtGoal()) {
      int temp = log.get(0);
      for (int i = 0; i < log.size() - 1; i++) {
        log.set(i, log.get(i + 1));
      }
      log.set(log.size()-1, temp);
      
      for (int i : log) {
        print(str(i) + ", ");
      }
      println();
      
      r.turnLeft();
      r.turnLeft();
    }
    
    if (log.get(log.size()-1) == 0) {
      r.turnRight();
    } else if (log.get(log.size()-1) == 2) {
      r.turnLeft();
    }
    r.move();
    log.remove(log.size()-1);
    for (int i : log) {
      print(str(i) + ", ");
    }
    println();
    
    if (r.isAtStart()) {
      println("OOOOOOH KILLEM #SWAG #NEVR5GET");
      noLoop();
    }
  }
}

/*

     ,o888888o.        ,o888888o. 8888888 8888888888 8888888 8888888888   .8.                        ,o888888o.        ,o888888o.               8 8888888888       .8.            d888888o. 8888888 8888888888 
    8888     `88.   . 8888     `88.     8 8888             8 8888        .888.                      8888     `88.   . 8888     `88.             8 8888            .888.         .`8888:' `88.     8 8888       
 ,8 8888       `8. ,8 8888       `8b    8 8888             8 8888       :88888.                  ,8 8888       `8. ,8 8888       `8b            8 8888           :88888.        8.`8888.   Y8     8 8888       
 88 8888           88 8888        `8b   8 8888             8 8888      . `88888.                 88 8888           88 8888        `8b           8 8888          . `88888.       `8.`8888.         8 8888       
 88 8888           88 8888         88   8 8888             8 8888     .8. `88888.                88 8888           88 8888         88           8 888888888888 .8. `88888.       `8.`8888.        8 8888       
 88 8888           88 8888         88   8 8888             8 8888    .8`8. `88888.               88 8888           88 8888         88           8 8888        .8`8. `88888.       `8.`8888.       8 8888       
 88 8888   8888888 88 8888        ,8P   8 8888             8 8888   .8' `8. `88888.              88 8888   8888888 88 8888        ,8P           8 8888       .8' `8. `88888.       `8.`8888.      8 8888       
 `8 8888       .8' `8 8888       ,8P    8 8888             8 8888  .8'   `8. `88888.             `8 8888       .8' `8 8888       ,8P            8 8888      .8'   `8. `88888.  8b   `8.`8888.     8 8888       
    8888     ,88'   ` 8888     ,88'     8 8888             8 8888 .888888888. `88888.               8888     ,88'   ` 8888     ,88'             8 8888     .888888888. `88888. `8b.  ;8.`8888     8 8888       
     `8888888P'        `8888888P'       8 8888             8 8888.8'       `8. `88888.               `8888888P'        `8888888P'               8 8888    .8'       `8. `88888. `Y8888P ,88P'     8 8888       

*/
