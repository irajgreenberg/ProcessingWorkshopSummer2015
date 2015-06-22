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

void setup() {
  r = new Robot(this, "map1.txt"); // initialize the robot and map
  frameRate(10); // use this to slow down/speed up the animation
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
 
}














