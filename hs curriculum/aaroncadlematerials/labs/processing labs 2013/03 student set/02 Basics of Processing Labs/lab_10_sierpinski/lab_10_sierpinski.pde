/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Sierpinski's Triangle
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
    size(600, 600);
    smooth();
    noLoop();
}

void draw()
{
    background(0);
    stroke(255);
    strokeWeight(0.1);
    noFill();

    sierpinski(width / 2, 0, width - 1, height - 1, 0, height - 1);
}

void sierpinski(float ax, float ay, float bx, float by, float cx, float cy)
{
    //Draw a triangle with top vertex (ax, ay),
    //Bottom-right vertex (bx, by) and
    //bottom-left vertex (cx, cy)
    
    
    //Calculate the midpoint of each side,
    //and recursively call this method for
    //the three triangles anchored in each corner

}

