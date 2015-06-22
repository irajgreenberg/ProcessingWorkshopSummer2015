//For challenge #1
final PVector GRAVITY = new PVector(0, 0.05);

class Ball
{
    //Add instance fields
    PVector pos;
    PVector vel;
    float size;

    //Add a default and initialization constructor
    Ball()
    {
        this(width / 2, height / 2, random(-2, 2), random(-2, 2), 20);
    }

    Ball(float x, float y, float velX, float velY, float size)
    {
        this.pos = new PVector(x, y);
        this.vel = new PVector(velX, velY);
        this.size = size;
    }

    //Add an update method
    void update()
    {
        //vel.add(GRAVITY); //Uncomment for challenge #1 solution
        pos.add(vel);

        float radius = size / 2.0;
        if (pos.x > width - radius)
        {
            pos.x = width - radius;
            vel.x *= -1;
        }

        if (pos.x < radius)
        {
            pos.x = radius;
            vel.x *= -1;
        }

        if (pos.y > height - radius)
        {
            pos.y = height - radius;
            vel.y *= -1;
        }

        if (pos.y < radius)
        {
            pos.y = radius;
            vel.y *= -1;
        }
    }

    //Add a render method
    void render()
    {
        noStroke();
        fill(#FFFF00, 200);
        pushMatrix();
        translate(pos.x, pos.y);
        ellipse(0, 0, size, size);
        popMatrix();
    }
}

