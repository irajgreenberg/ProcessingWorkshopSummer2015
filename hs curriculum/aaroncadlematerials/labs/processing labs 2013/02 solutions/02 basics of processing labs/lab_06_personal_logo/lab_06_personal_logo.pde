/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Personal Logo
 *
 * @author Stephen C. Fornal
 * @author http://mrfornal.net
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */

final int NUM_SYMBOLS = 3;
 
void setup()
{
    size(300, 300);
    smooth();
    background(0);
    noLoop(); //Causes the draw method to only execute once
}
 
void draw()
{
    //Draw NUM_SYMBOLS symbols at random positions and rotations
    for (int i = 0; i < NUM_SYMBOLS; i++)
    {
        drawSymbol(random(50, width - 50), random(50, height - 50), random(0, TWO_PI));
    }    
}
