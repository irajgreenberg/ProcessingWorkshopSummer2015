/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Mouse Tracker
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
     
 }
 
 void draw()
 {
     background(0);
     stroke(255);
     line(0, 0, mouseX, mouseY);
     line(width, height, mouseX, mouseY);
     line(0, height, mouseX, mouseY);
     line(width, 0, mouseX, mouseY);
 }
