/**
 * This sketch demonstrates using the "classic" boids algorithm by Reynolds, et al.
 * to create digital art.
 *
 * @author Stephen C. Fornal
 * @author http://mrfornal.net
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 */


final boolean ART_MODE = true;
final int MAX_VEL = 8;
final int NUM_BIRDS = 200;

final float MIN_DISTANCE = 200;


final float HEADING_WEIGHT = 400;
final float LOCATION_WEIGHT = 500;
final float AVOID_DIST = 40;
final float AVOID_WEIGHT = 100;


ArrayList<Bird> birds;

boolean pause;
boolean step;

void setup()
{
    size(1366, 768);
    smooth();
    
    pause = !ART_MODE;
    step = false;
    
    birds = new ArrayList<Bird>();
    for (int i = 0; i < NUM_BIRDS; i++)
    {
        birds.add( new Bird() );
    }
}

void draw()
{
    if (!pause || step)
    {
        if (ART_MODE)
        {
            fill(0, 25);
            rect(0, 0, width, height);
            //background(0);
        }
        else
        {
            background(255);
        }
        for (Bird b : birds)
        {            
            b.render();
            b.update();
        }
    }
    step = false;
    
    if (pause)
    {
        fill(255);
        stroke(0);
        rectMode(CENTER);
        rect(width / 2, 35, 400, 55);
        fill(0);
        stroke(0);
        textSize(14);
        textAlign(CENTER, CENTER);
        text("Paused - Push S to step, or Space to resume", width / 2, 20);
        text("Click a boid to toggle debug mode", width / 2, 40);
    }
}

void keyReleased()
{
    if (ART_MODE) return;
    
    if (key == ' ')
    {
        pause = !pause;
    }
    
    if (pause && key == 's' || key == 'S')
    {
        step = true;
    }
}

void mouseClicked()
{
    if (ART_MODE) return;
    
    PVector mouse = new PVector(mouseX, mouseY);
    for(Bird b : birds)
    {
        if (b.loc.dist(mouse) < 10)
        {
            b.debug = !b.debug;
        }
    }
}
