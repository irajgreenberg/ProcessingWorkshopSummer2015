/*

 Second Processing Program - Darby Thompson
 This program gives examples of for loops, random number generation and variables
 
 */




void setup() {
  size(500, 500);
  background(255);

  // The following is the java version of this python loop:
  // for i in range(0,10):

  // i is a variable that changes each time through the for loop
  // it initially starts at 0
  // each time through the loop i is incremented ->  i=i+1
  // it loops while i<10
  for (int i=0; i<10; i=i+1) {
    ellipse(i*20, 200, 10, 10); // draw an ellipse.  
  }


  // this command defines (declares) a variable so that it can be used in the future
  // we have to specify that it is going to store an integer (int)
  int myvariable;
  myvariable = 7;  // here we set the variable to have the value 7
  println(myvariable);  // here we print the variable value



  float myvariable2; // DECLARING the variable.  This time it is going to store a float (floating point number)
  myvariable2 = 10.5;
  println(myvariable2);
  
}

// Here we DECLARE a new variable called counter that is going to store an integer
// we are going to use it to count the number of frames drawn
int counter=0;

// DRAW runs continuously (in a loop that you can't see).
void draw() {
  
  counter = counter+1; // here we add one to our frame counter so that we can keep track of how many times draw() has been run

   if (counter%30==0) {  // if the counter is divisible by 30...
      background(255); // clear the page
      // The function random(number) generates a random float between 0-number (up to but not including number)
      ellipse(random(500), random(500), 10, 10); // draw an ellipse in a random location
   }
}




