PImage imgBird;

class Tweeter
{
    static final float MAX_VEL = 5.5;
    static final float MIN_VEL = 2.0;

    String name;
    PImage img;

    PVector vel;
    PVector pos;
    
    Tweeter(String name)
    {
        this(name, imgBird);
    }

    Tweeter(String name, PImage img)
    {
        this.name = name;
        this.pos = new PVector(random(width), random(height));
        float heading = random(TWO_PI);
        this.vel = new PVector(cos(heading) * MIN_VEL, sin(heading) * MIN_VEL);
        this.img = img;
    }

    void update()
    {
        PVector v1 = ruleAvoid();
        PVector v2 = ruleHeading();
        PVector v3 = ruleCenter();
        PVector v4 = ruleBounds();
        //PVector v5 = ruleMouse();

        vel.add(v1);
        vel.add(v2);
        vel.add(v3);
        vel.add(v4);
        //vel.add(v5);
        vel.limit(MAX_VEL);
        pos.add(vel);
    }

    void render()
    {
        pushMatrix();
        pushStyle();

        translate(pos.x, pos.y);
        fill(0);
        noStroke();
        textAlign(CENTER);
        text("@" + this.name, 0, img.height);
        rotate(vel.heading2D());
        image(img, -img.width / 2, -img.height / 2);

        popMatrix();
        popStyle();
    }

    PVector ruleAvoid()
    {
        PVector avoid = new PVector();

        for (Tweeter b : birds)
        {
            if (b != this && isNeighbor(b))
            {
                PVector diff = PVector.sub(b.pos, pos);
                if (diff.mag() <= img.width)
                {
                    avoid.sub(PVector.div(diff, 4));
                }
            }
        }

        return avoid;
    }

    PVector ruleHeading()
    {
        PVector heading =  new PVector();

        int count = 0;
        for(Tweeter b : birds)
        {
            if (b != this && isNeighbor(b))
            {
                heading.add(b.vel);
                count++;
            }
        }

        if (count > 0)
        {
            heading.div(count);
            return PVector.div(PVector.sub(heading, vel), 8);
        }
        else
        {
            return new PVector();
        }
    }

    //Steer toward the center mass of the flock
    PVector ruleCenter()
    {
        PVector cm = new PVector();

        int count = 0;
        for(Tweeter b : birds)
        {
            if (b != this && isNeighbor(b))
            {
                cm.add(b.pos);
                count++;
            }
        }

        if (count > 0)
        {
            cm.div(count);
            return PVector.div(PVector.sub(cm, pos), 100);
        }
        else
        {
            return new PVector();
        }        
    }

    PVector ruleBounds()
    {
        PVector bounds = new PVector();
        if(pos.x > width + img.width)
        {
            bounds.x = -MIN_VEL;
        }

        if(pos.x < -img.width)
        {
            bounds.x = MIN_VEL;
        }

        if(pos.y > height + img.width)
        {
            bounds.y = -MIN_VEL;
        }

        if(pos.y < -img.width)
        {
            bounds.y = MIN_VEL;
        }

        return bounds;
    }

    boolean isNeighbor(Tweeter other)
    {
        return (pos.dist(other.pos) <= img.width * 1.5);
    }

    PVector ruleMouse()
    {
        PVector mouse = new PVector(mouseX, mouseY);

        mouse.sub(pos);

        return PVector.div(mouse, 1000);
    }
}
