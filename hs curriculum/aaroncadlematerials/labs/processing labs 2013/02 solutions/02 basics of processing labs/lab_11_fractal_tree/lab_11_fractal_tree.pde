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
    //Just for fun, base new length on mouseY
    float x2 = x + cos(ang) * len;
    //Also for fun, bas angle on mouseX
    float y2 = y + sin(ang) * len;

    line(x, y, x2, y2);

    if (len > 20)
    {
        float newLen = (float)mouseY / height * 0.9 * len + 1;
        float offset = (float)(width - mouseX + 1) / width * QUARTER_PI;
        
        tree(x2, y2, newLen, ang - offset);
        tree(x2, y2, newLen, ang + offset);
    }
}

