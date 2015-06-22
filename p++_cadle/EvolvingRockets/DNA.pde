class BurnRecord
{
    PVector thrust;
    int duration;
    
    BurnRecord()
    {
        duration = int(random(minBurnTime, maxBurnTime + 1));
        float theta = random(TWO_PI);
        float r = random(maxThrust);
        thrust = new PVector(cos(theta) * r, sin(theta) * r);
    }
    
    BurnRecord get()
    {
        BurnRecord copy = new BurnRecord();
        copy.duration = duration;
        copy.thrust = thrust.get();
        return copy;
    }
}

class DNA
{
    BurnRecord[] strand;
    color col;
    float mass;
    
    DNA(int strandLen)
    {
        strand = new BurnRecord[strandLen];
        for (int i = 0; i < strand.length; i++)
        {
            strand[i] = new BurnRecord();
        }
        col = color(random(90, 256), random(90, 256), random(90, 256));
        mass = random(minMass, maxMass);
    }
    
    DNA crossover(DNA other)
    {
        DNA child = new DNA(strand.length);
        child.col = (col + other.col) / 2;
        child.mass = (mass + other.mass) / 2;
        
        for (int i = 0; i < child.strand.length; i++)
        {
            child.strand[i] = (random(1) < 0.5) ? strand[i].get() : other.strand[i].get();
        }
        
        return child;
    }
    
    void mutate(float chance)
    {
        for (int i = 0; i < strand.length; i++)
        {
            if (random(1) < chance)
            {
                strand[i] = new BurnRecord();
            }
        }
        col = (random(1) < 0.5) ? col : color(random(90, 256), random(90, 256), random(90, 256));
        mass = (random(1) < 0.5) ? mass : random(minMass, maxMass);        
    }
}
