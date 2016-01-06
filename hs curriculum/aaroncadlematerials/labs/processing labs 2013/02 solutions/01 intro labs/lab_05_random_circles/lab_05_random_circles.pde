/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Random Circles
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
     float r = random(125, 255); //red
     float g = random(125, 255); //green
     float b = random(125, 255); //blue
     float a = random(25, 255);  //alpha
     
     color c = color(r, g, b, a);
     fill(c);
     noStroke();
     
     float x = random(0, width);
     float y = random(0, height);
     float d = random(10, 200);
     
     ellipse(x, y, d, d);
 }
