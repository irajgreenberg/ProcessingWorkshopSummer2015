class Bird
{
    PVector vel;
    PVector loc;
    color col;
    boolean debug;
    float diameter;

    Bird()
    {
        this( random(0, width), random(0, height), random(-MAX_VEL, MAX_VEL), random(-MAX_VEL, MAX_VEL), color(random(255), random(255), random(255)) );
    }

    Bird(color c)
    {
        this( random(0, width), random(0, height), random(-MAX_VEL, MAX_VEL), random(-MAX_VEL, MAX_VEL), c );
    }

    Bird(float x, float y, float vx, float vy, color c)
    {
        loc = new PVector(x, y);
        vel = new PVector(vx, vy);
        col = c;
        debug = false;
        diameter = random(20, 200);
    }

    void update()
    {
        ArrayList<Bird> myFlock = getFlock();

        if (myFlock.size() > 0)
        {
            PVector accel = new PVector();
            PVector heading = new PVector();
            PVector location = new PVector();
            PVector avoid = new PVector();

            for (Bird b : myFlock)
            {
                heading.add( headingRule(b) );
                location.add( locationRule(b) );
                avoid.add( collisionRule(b) );
            }
            heading.div(myFlock.size());
            heading.sub(vel);            
            heading.div(HEADING_WEIGHT);

            location.div(myFlock.size());
            if (debug)
            {
                pushStyle();
                pushMatrix();
                fill(255, 0, 0, 125);
                stroke(255, 0, 0, 125);
                translate(location.x, location.y);
                ellipse(0, 0, 20, 20);
                fill(255);
                textSize(15);
                textAlign(CENTER, CENTER);
                text("c", 0, -3);
                popMatrix();
                popStyle();
            }
            location.sub(loc);
            location.div(LOCATION_WEIGHT);

            if (debug)
            {
                pushStyle();

                pushMatrix();
                fill(0, 0, 255, 255);
                stroke(0, 0, 255, 255);
                translate(loc.x, loc.y);
                rotate( heading.heading2D() );
                float x = width / 4 * heading.mag();
                line(0, 0, x, 0);
                line(x, 0, x - 5, -3);
                line(x, 0, x - 5, 3);
                popMatrix();

                pushMatrix();
                fill(255, 0, 0, 255);
                stroke(255, 0, 0, 255);
                translate(loc.x, loc.y);
                rotate( location.heading2D() );
                x = width / 4 * location.mag();
                line(0, 0, x, 0);
                line(x, 0, x - 5, -3);
                line(x, 0, x - 5, 3);
                popMatrix();

                pushMatrix();
                fill(255, 255, 0, 255);
                stroke(255, 255, 0, 255);
                translate(loc.x, loc.y);
                rotate( avoid.heading2D() );
                x = width / 4 * avoid.mag();
                line(0, 0, x, 0);
                line(x, 0, x - 5, -3);
                line(x, 0, x - 5, 3);
                popMatrix();

                popStyle();
            }
            accel.add(heading);
            accel.add(location);
            accel.add(avoid);

            vel.add(accel);
            vel.limit(MAX_VEL);
        }
        loc.add(vel);
        wrapAround();
    }

    PVector headingRule( Bird b )
    {
        PVector rule = new PVector(0, 0);

        rule.add(b.vel);
        return rule;
    }

    PVector locationRule( Bird b )
    {
        PVector rule = new PVector(0, 0);

        rule.add(b.loc);
        return rule;
    }

    PVector collisionRule( Bird b )
    {
        PVector rule = new PVector(0, 0);

        PVector toward = PVector.sub(b.loc, loc);

        if (toward.mag() < AVOID_DIST)
        {
            toward.div(AVOID_WEIGHT);
            rule.sub(toward);
            if (debug)
            {
                pushStyle();
                pushMatrix();
                translate(b.loc.x, b.loc.y);
                stroke(255, 0, 0, 175);
                line(15, 15, -15, -15);
                line(15, -15, -15, 15);
                popStyle();
                popMatrix();
            }
        }

        return rule;
    }

    void wrapAround()
    {
        if (loc.x < 0 || loc.x > width)
        {
            loc.x = (loc.x + width) % width;
        }

        if (loc.y < 0 || loc.y > height)
        {
            loc.y = (loc.y + height) % height;
        }
    }

    ArrayList<Bird> getFlock()
    {
        ArrayList<Bird> flock = new ArrayList<Bird>();

        for (Bird b : birds)
        {
            if ( b != this && loc.dist(b.loc) < MIN_DISTANCE )
            {
                flock.add(b);
                if (debug)
                {

                    pushStyle();
                    pushMatrix();
                    fill(col, 40);
                    stroke(col, 75);
                    translate(b.loc.x, b.loc.y);
                    ellipse(0, 0, 30, 30);
                    popStyle();
                    popMatrix();
                }
            }
        }

        return flock;
    }

    void render()
    {
        //Add code to draw the bird on the screen
        pushMatrix();
        pushStyle();

        translate( loc.x, loc.y );
        rotate( vel.heading2D() );

        if (ART_MODE)
        {
            noStroke();
            fill(col);
            ellipse(0, 0, 20, 20);
        }
        else if (debug)
        {
            fill(col, 200);
            stroke(col, 255);
            ellipse(0, 0, 30, 30);
            stroke(255);
            fill(255);
            line(-15, 0, 15, 0);
            line(15, 0, 5, 7);
            line(15, 0, 5, -7);
        }
        else
        {
            stroke(col);
            fill(col);
            line(-15, 0, 15, 0);
            line(15, 0, 5, 7);
            line(15, 0, 5, -7);
        }


        popMatrix();
        popStyle();
    }
}

