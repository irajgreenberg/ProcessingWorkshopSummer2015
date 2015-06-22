class Rocket
{
    PVector loc;
    PVector vel;
    PVector acc;
    float mass;
    color col;
    
    float fuel;
    int time;
    int burnStart;
    boolean alive;
    boolean hitTarget;
    
    DNA dna;
    
    float bestDist;
    int record;
    BurnRecord current;
    
    Rocket(float xPos, float yPos, DNA d)
    {
        loc = new PVector(xPos, yPos);
        vel = new PVector();
        acc = new PVector();
        mass = d.mass;
        col = d.col;
        
        fuel = startFuel;
        time = 0;
        alive = true;
        hitTarget = false;
        burnStart = 0;
        dna = d;
        record = 0;
        current = dna.strand[record];
        bestDist = 10000000000.0;
    }
    
    void render()
    {
        pushStyle();
        pushMatrix();
        
        translate(loc.x, loc.y);
        rotate(vel.heading2D());
        
        if( fuel > 0)
        {
            fill(col);
        }
        else
        {
            noFill();
                     
        }
        strokeWeight(2);
        stroke(col);   
        triangle(5, 0, -5, 3, -5, -3);
        
        if (!hitTarget && alive && fuel > 0 && current.thrust.mag() > 0)
        {
            fill(color(255, 0, 0, 200));
            noStroke();
            triangle(-11, frameCount % 5 - 2, -5, 2, -5, -2);
        }
        else if (alive && fuel <= 0 && vel.y > 0) //Falling!
        {
            fill(255, 0, 0, 50);
            strokeWeight(0.1);
            stroke(255, 255, 0, 100);
            ellipseMode(CENTER);
            ellipse(0, 0, 12, 7);
            ellipse(-1, 0, 13, 9);
            ellipse(-2, 0, 14, 11);
            ellipse(-3, 0, 16, 13);
            ellipse(-4, 0, 17, 15);
        }
        
        popStyle();
        popMatrix();
    }
    
    float fitness(Target t)
    {
        float fit = pow(1 / bestDist, 2);
        if (hitTarget) fit *= successWeight;          //Reward for hitting target
        if (!alive && fuel > 0) fit *= crashWeight;   //Penalty for crashing with fuel remaining
        
        return fit;
    }
    
    void run(Target t, ArrayList<Obstacle> obs)
    {
        if (!hitTarget && alive)
        {
            burn(); 
            applyForce(PVector.mult(gravity, mass));
            update(t, obs);
        }
    }
    
    void burn()
    {
        if (fuel <= 0) return;
        
        if (time - burnStart > current.duration)
        {
            record = (record + 1) % dna.strand.length;
            current = dna.strand[record];
            burnStart = time;
        }
        
        applyForce(current.thrust);
        fuel -= (mass * current.thrust.mag() * fuelCost);        
    }
    
    void applyForce(PVector force)
    {
        PVector f = force.get();
        f.div(mass);
        acc.add(f);
    }
    
    void update(Target t, ArrayList<Obstacle> obs)
    {
        vel.add(acc);
        vel.limit(maxVel);
        
        loc.add(vel);
        
        float dist = PVector.dist(loc, t.loc);
        if (dist < bestDist)
        {
            bestDist = dist;
        }
        
        if (dist < t.radius)
        {
            hitTarget = true;
        }
        
        for (Obstacle o : obs)
        {
            if (o.contains(this))
            {
                alive = false;
            }
        }
        
        checkBounds();
        
        time++;
        acc.mult(0);
    }
    
    void checkBounds()
    {
        if (loc.y >= height /* || loc.x <= 0 || loc.x >= width */)
        {
            loc.y = constrain(loc.y, 0, height);
            //loc.x = constrain(loc.x, 0, width);
            alive = false;
        }
    }
}
