/*

First Processing Program - Darby Thompson
This program demonstrates the drawing of basic shapes.  
Here we draw a car approximately in the center of the screen (250,250)

*/

void setup() {
 size(500,500);  // create a 500x500 window
 background(255);  // set the background color to be white
 noLoop(); // tell the program to only run draw() once (ie no animation happens)
}


void draw(){
 
 // draw the body of the car
 stroke(255);              // set the outline color to be white
 fill(255, 0,0);           // set the fill color to be red
 beginShape();             // begin drawing a polygon
 vertex(200, 200);         // each of these lines adds a vertex to the polygon
 vertex(300,200);
 vertex(320, 235);
 vertex(320, 250);
 vertex(180, 250);
 vertex(180, 235);
 vertex(200,200);
 endShape();               // I have finished defining the polygon
  
 // draw the left wheel
 stroke(0);                // change the outline color to black
 fill(0);                  // change the fill color to black
 ellipse(210, 260, 20,20); // draw an ellipse centered at (220, 260), its width is 20 and height is 20 (ie diameter is 20)
  
 // draw the right wheel
 ellipse(290, 260, 20,20); // draw an ellipse centered at (280, 260), its width is 20 and height is 20 (ie diameter is 20)
 
 // draw the left window
 fill(255);                // change the fill color to white
 rect(215, 208, 30, 20);   // draw a rectangle where the top left corner is at (215, 208), its width is 30, its height is 20
 
 // draw the right window
 rect(255, 208, 30, 20);   // draw a rectangle where the top left corner is at (215, 208), its width is 30, its height is 20

 // draw the antenna
 line(295, 190, 295, 200); // draw a line from (295, 190) to (295, 200)
  
}
