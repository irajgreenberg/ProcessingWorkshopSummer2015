/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Fractal Tree
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
    size(300, 600);
    smooth();
}

void draw()
{
    background(0);
    stroke(255);
    noFill();

    tree(width / 2, height, 100, -HALF_PI);
}

void tree(float x, float y, float len, float ang)
{
    
}

