/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Recursive Circles
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
    size(800, 600);
    smooth();
    noLoop(); //Make draw() happen once only
}

void draw()
{
    background(0);
    noFill();
    stroke(255);
    
    circles(width / 2, height / 2, 300);
}

void circles(float x, float y, float diameter)
{
    ellipse(x, y, diameter, diameter);
    
    if (diameter > 6)
    {
        float half = diameter / 2;
        circles(x + half, y, half);
        circles(x - half, y, half);
        circles(x, y + half, half);
        circles(x, y - half, half);
    }
}

