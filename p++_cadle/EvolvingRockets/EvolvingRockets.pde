float startFuel = 7; //starting fuel per rocket
float fuelCost = 0.5; //Cost of fuel = (mass * acc.mag() * fuelCost) per tick
PVector gravity = new PVector(0, 0.08);
float maxThrust = 1.0;
float minThrust = 0.0;
float minMass = 1.0;
float maxMass = 7.0;
int minBurnTime = 1;
int maxBurnTime = 10;
float maxVel = 20;
float successWeight = 2.0;
float crashWeight = 0.001;

Target target;
Population rockets;
ArrayList<Obstacle> obs;

void setup()
{
    size(800, 600);
    smooth();
    
    target = new Target(width * random(1), 55, 50);
    rockets = new Population(200, 110, 0.005);
    
    obs = new ArrayList<Obstacle>();
    float gapWidth = random(60, 100);
    float gapPlacement = random(0.1, 0.7);
    obs.add(new Obstacle(0, height / 2 - 30, width * gapPlacement, 30));
    obs.add(new Obstacle(width * gapPlacement + gapWidth, height / 2 - 30, width - (width * gapPlacement + gapWidth), 30));

    
}

void draw()
{
    background(0);
    for (Obstacle o : obs)
    {
        o.render();
    }
    rockets.run(target, obs);
}
