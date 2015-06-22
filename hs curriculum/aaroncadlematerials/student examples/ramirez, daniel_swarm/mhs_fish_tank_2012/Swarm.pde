/* Models a school of fish. The fish will act as though they have some central hivemind, utilizing some simple artificial intelligence
 * known within the field as "swarm intelligence" The algorithms used to acomplish this are largely based of those of Craig Reynold's
 * who detailed them in his 1987 paper "Flocks, Herds, and Schools: A Distributed Behavioral Model" (Which can be read here: 
 * http://www.red3d.com/cwr/papers/1987/boids.html). Each individual fish is called a "Boid", which, according to wikipedia, "refers 
 * to a 'bird-like object', but its pronunciation evokes that of 'bird' in a stereotypical New York accent." Another paper that was of
 * great use to me was Conrad Parker's writeup "Boids Pseudocode" (http://www.kfish.org/boids/pseudocode.html). The code written here is
 * by no means a direct implementation of Parker's pseudocode, many optimizations have been made, as well as tweaks to achieve a school 
 * of fish look, as opposed to a flock of birds. 
 *
 * Pass true as the second parameter to multithread the program, its uses a kludge lock system that doesn't
 * offer any gains when this is the only fish in the tank, it should dramatically speed things up when other
 * fish are in the tank though.
 */

class Swarm extends AnimatedObject {
  ArrayList<Boid> boids;
  int maxSpeed;     /* the max speed the boids can fly so they don't perpetually accelerate */
  float maxForce;   /* the maximum force we can have applied. This is used for the steering vectors in calcForces */
  int counter;
  
  PVector[] neighborLocs;
  boolean interact;
  
  /* multithreading PIV's, including a kludge of a lock system */
  moveThread thread;
  boolean moveThreadRunning;
  boolean multithreaded;
  
 
  
  /* create a new swarm containing num boids */
  Swarm(int num, boolean threaded, boolean inter) {
    maxSpeed = 2;      /* these values are taken from another boids program, could have been determined progmatically but it wouldve been a pain in the ass */
    maxForce = 0.03;
    boids = new ArrayList<Boid>();
    counter = 0;
    multithreaded = threaded;
    thread = new moveThread();
    moveThreadRunning = false;
    interact = inter;
    for (int i = 0; i < num; i++) 
      boids.add(new Boid());
  }
  
  /* calculates each boid's new positition and updates arraylist accordingly */
  void step() {
    PVector forces;
    Boid b;
    
    for (int i = 0; i < boids.size(); i++) {
     b = boids.get(i);
     forces = calcForces(b);
      
     b.velocity.add(forces);
     b.velocity.limit(maxSpeed);
     b.loc.add(b.velocity);
     borders(b);  
    }
    counter++;
  }
  
  void move(PVector[] locs) {
    neighborLocs = locs;
    move(); 
  }
  
  void move() {
    if (multithreaded && !moveThreadRunning) thread.run();
    else step();
  }
  
  /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
   * Calculate the various steering forces to be applied to the boid. These are all dependent on the boids "neighborhood"      *
   * as Reynold's terms it, which an area local to the boid, ie, not the whole flock. This is where the bulk of the program's  *
   * calculations occur. It could really be seperated into 3 or 4 different methods, as Conrad and Reynold's had suggested,    *
   * but I didn't think the added time complexity of 3 or 4 for loops looping through the whole array was worth the readablity *
   * gains.                                                                                                                    *
   * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
  PVector calcForces(Boid b) {
    /* these factors are very touchy, they will change how the whole swarm behaves and have the potential to break the whole program all together */
    // int matchFactor = 5;                         /* controls how fast the boid will accelerate in order to match percieved velocity */ 
    int distOfAwareness = 50;                       /* how large of an area around the current loc the boid will look at to determine what actions to take */
    int personalArea = 25;                          /* how much each boid likes to be away from other boids */
    
    PVector matchingForce;                          /* force that attempts to match the boid's velocity with others */
    PVector centeringForce;                         /* force that pulls each boid to the swarm's center of mass */
    PVector spacingForce = new PVector(0, 0);       /* force that keeps boids from colliding with eachother */
    PVector perceivedVelocity = new PVector(0, 0);  /* the percieved velocity of the boids in the distOfAwareness (an average) */
    PVector avgLoc = new PVector(0, 0);             /* average location of boids in the distOfAwareness */
    PVector sum = new PVector(0, 0);                /* the sum of all the steering forces to be returned (ie, matching + spacing + centering) */
    PVector spacingForceOther = new PVector(0, 0);  /* force that keeps the fish from colliding into other fish in the tank */
    int numBoidsAround = 0;                         /* counter of the boids this boid is aware of so we can get a proper average */
    int numBoidsTooClose = 0;                       /* counter of the boids that are considered too close */
    
    /* Move away from other fish in the tank that are near and are not a member of the swarm */
    
    /* calculations relating the position of other fish in the swarm */
    int objAvoiding = 0;
    if (interact) {
      for (int i = 0; i < neighborLocs.length; i++) {
       float dist = PVector.dist(b.loc, neighborLocs[i]);
       if (dist < 125 && dist != 0) {
         PVector temp = PVector.sub(neighborLocs[i], b.loc);
        // if (degrees(PVector.angleBetween(temp, b.velocity)) < 25) {
           PVector normalized = PVector.sub(b.loc, neighborLocs[i]);
           normalized.normalize();
           normalized.div(dist);      /* weight according to the seperation between the boids, maybe change this to an inverse square as Reynolds suggested */
           spacingForceOther.add(normalized);
           objAvoiding++;
        // }
       } 
      }
    }
    for (int i = 0; i < boids.size(); i++) {
      Boid curBoid = boids.get(i);
      float distance = PVector.dist(b.loc, curBoid.loc);
      
      if (distance < distOfAwareness && distance > 0) { 
         /* calculations for the spacing force */
         if (distance < 17) {
           PVector normalized = PVector.sub(b.loc, curBoid.loc);
           normalized.normalize();
           normalized.div(distance);      /* weight according to the seperation between the boids, maybe change this to an inverse square as Reynolds suggested */
           spacingForce.add(normalized);
           numBoidsTooClose++;
         }
         /* calculations for matching force */
         perceivedVelocity.add(curBoid.velocity);
         
         /* calculations for centering force */
         avgLoc.add(curBoid.loc);
         
         numBoidsAround++; 
      } 
    }
    
    if (objAvoiding > 0) {
        spacingForceOther.div(objAvoiding);
        spacingForceOther.normalize();
        spacingForceOther.mult(maxSpeed);
        spacingForceOther.sub(b.velocity);      /* per Reynolds, steering force is equal to the desired location minus the current velocity */
        spacingForceOther.limit(maxForce); 
    }
    else {
      spacingForceOther = new PVector(0,0); 
    }
    
    if (numBoidsAround > 0) {
      if (numBoidsTooClose > 0) {
        spacingForce.div(numBoidsTooClose);
        spacingForce.normalize();
        spacingForce.mult(maxSpeed);
        spacingForce.sub(b.velocity);      /* per Reynolds, steering force is equal to the desired location minus the current velocity */
        spacingForce.limit(maxForce);
      }
      else {
        spacingForce = new PVector(0,0); 
      }
      avgLoc.div(numBoidsAround);
      PVector normalized = PVector.sub(avgLoc, b.loc);
      normalized.normalize();
      normalized.mult(maxSpeed);
      centeringForce = PVector.sub(normalized, b.velocity);  /* moar Reynolds steering */
      centeringForce.limit(maxForce);
      
      perceivedVelocity.div(boids.size());
      perceivedVelocity.normalize();
      perceivedVelocity.mult(maxSpeed);
      matchingForce = PVector.sub(perceivedVelocity, b.velocity); /* Reynolds STEER */
      matchingForce.limit(maxForce);       
    }
    else {
      centeringForce = new PVector(0,0);
      spacingForce = new PVector(0,0);
      matchingForce = new PVector(0,0); 
    }
    
    /* look into accumulating or otherwise weighting forces here */
    if (objAvoiding > 0) {
      sum.add(centeringForce);
      sum.add(matchingForce);
      sum.add(spacingForceOther);
      spacingForce.mult(1.45);
      sum.add(spacingForce);
    }
    else {
      sum.add(centeringForce);
      sum.add(matchingForce);
      sum.add(spacingForceOther);
      spacingForce.mult(1.45);
      sum.add(spacingForce);
    }
    return sum; 
  }
  
  void borders(Boid b) {
    if (b.loc.x < 0) b.loc.x = width;
    if (b.loc.y < 0) b.loc.y = height;
    if (b.loc.x > width) b.loc.x = 0;
    if (b.loc.y > height) b.loc.y= 0;
  }

  void display() {
    while(moveThreadRunning) ;
    float size = 3.0;
       // Draw a triangle rotated in the direction of velocity
    for (int i = 0; i < boids.size(); i++) {
      Boid b = boids.get(i);
      float theta = b.velocity.heading() + radians(90);
      fill(222, 111, 27);
      stroke(0);
      pushMatrix();
      translate(b.loc.x, b.loc.y);
      rotate(theta);
      beginShape(TRIANGLES);
      /* seemingly cryptic math for drawing an oval with a triangle tail */
      vertex(0, (-size*2) + (size*4));
      vertex(-size, (size*2) + (size*2));
      vertex(size, (size*2) + (size*2));
      endShape();
      rotate(PI/2);
      ellipse(0,0, size*4, size*2);
      popMatrix();
    }
  }
  
  /*   These are here to comply with the abstract class definition. There was no good way to return a
   *   a single location since it is a swarm. A center of mass wouldn't have worked since at that location
   *   there might not be any fish at all, so it would look weird for other fish to be avoiding/responding to
   *   an empty location that they think contains this fish. 
   */
  int getX() {
    return -100;
  }
  
  int getY() {
    return -100;
  }
  
  void setThread(boolean val) {
    moveThreadRunning = val; 
  }
  
  
  /* Each individual fish is a boid */
  class Boid {
    PVector loc;
    PVector velocity;
    
    Boid() {
      loc = new PVector();
      loc.x = width/2; //random(width);
      loc.y = height/2; //random(height);
      velocity = PVector.random2D();
    }
  }
  
  /*   Thread we use for doing move calculations so this doesnt hold the rest of
   *   of the fish up.
   */
  class moveThread extends Thread {
    boolean running;
    
    moveThread() {
      running = false; 
    }
    
    void run() {
      setThread(true);
      step();
      setThread(false);
    }
    
    boolean isRunning() { 
      return running;
    }
    
    void calculate() {
      this.run(); 
    }
  }
  
}


