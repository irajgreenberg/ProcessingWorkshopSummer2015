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
     //Nice fade effect
     fill(0, 10);
     rect(0, 0, width, height);
     
     //Generate a random color
     float r = random(125, 255);
     float g = random(125, 255);
     float b = random(125, 255);
     
     color c = color(r, g, b);
     fill(c);
     
     float x = random(0, width);
     float y = random(0, height);
     
     textSize(120);
     text("hello", x, y);
 }
