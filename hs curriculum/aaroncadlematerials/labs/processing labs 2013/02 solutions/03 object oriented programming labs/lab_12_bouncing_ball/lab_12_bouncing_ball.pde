/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Bouncing Ball
 *
 * @author Stephen C. Fornal
 * @author http://mrfornal.net
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */

//Define an ArrayList of Ball objects
ArrayList<Ball> balls;

void setup()
{
    size(300, 300);
    smooth();
    
    //Instantiate the ArrayList
    balls = new ArrayList<Ball>();
    //Add a new default Ball to the ArrayList
    balls.add( new Ball() );
}

void draw()
{
    background(0);
    
    //Iterate through the ArrayList
    for (Ball b : balls)
    {
        //Tell each ball to update and render itself
        b.update();
        b.render();
    }
}

void mouseClicked()
{
    //Create a new Ball object where
    //the mouse was clicked
    Ball b = new Ball(mouseX, mouseY, random(-2, 2), random(-2, 2), 20);

    //Add the new ball to the ArrayList
    balls.add(b);
}

