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
    triangle(ax, ay, bx, by, cx, cy);

    if (dist(ax, ay, bx, by) > 6)
    {
        float acx = (ax + cx) / 2;
        float acy = (ay + cy) / 2;
        
        float abx = (ax + bx) / 2;
        float aby = (ay + by) / 2;
        
        float bcx = (bx + cx) / 2;
        float bcy = (by + cy) / 2;
        
        sierpinski(acx, acy, bcx, bcy, cx, cy);
        sierpinski(ax, ay, abx, aby, acx, acy);
        sierpinski(abx, aby, bx, by, bcx, bcy);
    }
}

