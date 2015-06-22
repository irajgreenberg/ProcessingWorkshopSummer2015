/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Real Hello World
 *
 * @author Stephen C. Fornal
 * @author http://mrfornal.net
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */
 
 void setup()
 {
     size(300, 300);
     smooth();
     background(0);
     
     //Adjust frameRate parameter to change animation speed
     frameRate(10);
 }
 
 void draw()
 {
     //Generate a random color
     float r = random(125, 255); //Red
     //Similar statements for green and blue
     float g;
     float b;
     
     //Create a color variable using the color() method
     color c = 255;
     fill(c);
     
     //Generate a random x and y position somewhere in the sketch
     float x = 50;
     float y = 200;
     
     
     textSize(120); //Adjust as desired
     text("hello", x, y);
 }
