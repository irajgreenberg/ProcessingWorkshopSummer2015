
class Population
{
    ArrayList<Rocket> pop;
    ArrayList<Rocket> matingPool;
    int genSize;
    int strandLen;
    int aliveCount;
    float mutation;
    
    int generation;
    float fitSum;
    
    Population(int gSize, int strandL, float mut)
    {
        pop = new ArrayList<Rocket>();
        matingPool = new ArrayList<Rocket>();
        genSize = gSize;
        strandLen = strandL;
        generation = 0;
        for (int i = 0; i < genSize; i++)
        {
            pop.add(new Rocket(width / 2, height - 10, new DNA(strandLen)));
        }
        aliveCount = genSize;
        mutation = mut;
        fitSum = 0;
    }
    
    void run(Target t, ArrayList<Obstacle> obstacles)
    {
        if(aliveCount > 0)
        {
            for(Rocket r : pop)
            {
                if (r.alive && !r.hitTarget)
                {
                    r.run(t, obstacles);
                    if ( !r.alive || r.hitTarget)
                    {
                        aliveCount--;
                    }
                }
                r.render();
            }
            t.render();
        }
        else
        {
            selection(t);
            mating();
            reset();
        }            
    }
    
    void selection(Target t)
    {
        fitSum = 0;
        
        for (Rocket r : pop)
        {
            fitSum += r.fitness(t);
        }
        
        matingPool.clear();
        
        for (Rocket r : pop)
        {
            int qty = round(r.fitness(t) / fitSum * 1000);
            System.out.print(qty + " ");
            
            for(int i = 0; i < qty; i++)
            {
                matingPool.add(r);
            }
        }
        System.out.println();
        System.out.println("Generation " + generation + ": Mating Pool Size = " + matingPool.size());
    }
    
    void mating()
    {
        pop.clear();
        System.out.println("Population cleared");
        
        for (int i = 0; i < genSize; i++)
        {
            DNA parentA = null;
            DNA parentB = null;
            while( parentA == parentB)
            {
                int indexA = int(random(matingPool.size()));
                int indexB = int(random(matingPool.size()));
                parentA = matingPool.get(indexA).dna;
                parentB = matingPool.get(indexB).dna;
            }
            DNA child = parentA.crossover(parentB);
            child.mutate(mutation);
            
            pop.add(new Rocket(width / 2, height - 10, child));
        }
    }
    
    void reset()
    {
        aliveCount = pop.size();
        generation++;
    }
}
