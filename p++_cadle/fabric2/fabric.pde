/*
  Curtain (Fabric Simulator)
  Made by BlueThen on February 5th, 2011; updated February 10th and 11th, 2011 and July 18th and 19th, 2011
  To interact, left click and drag, right click to tear,
               press 'G' to toggle gravity, and press 'R' to reset
  www.bluethen.com
*/
 
ArrayList particles;
 
// every particle within this many pixels will be influenced by the cursor
float mouseInfluenceSize = 15;
// minimum distance for tearing when user is right clicking
float mouseTearSize = 8;
float mouseInfluenceScalar = 1;
 
// force of gravity is really 9.8, but because of scaling, we use 9.8 * 40 (392)
// (9.8 is too small for a 1 second timestep)
float gravity = 392;
 
// Dimensions for our curtain. These are number of particles for each direction, not actual widths and heights
// the true width and height can be calculated by multiplying restingDistances by the curtain dimensions
final int curtainHeight = 56;
final int curtainWidth = 80;
final int yStart = 25; // where will the curtain start on the y axis?
final float restingDistances = 5;
final float stiffnesses = 1;
final float curtainTearSensitivity = 50; // distance the particles have to go before ripping
 
// These variables are used to keep track of how much time is elapsed between each frame
// they're used in the physics to maintain a certain level of accuracy and consistency
// this program should run the at the same rate whether it's running at 30 FPS or 300,000 FPS
long previousTime;
long currentTime;
// Delta means change. It's actually a triangular symbol, to label variables in equations
// some programmers like to call it elapsedTime, or changeInTime. It's all a matter of preference
// To keep the simulation accurate, we use a fixed time step.
final int fixedDeltaTime = 15;
float fixedDeltaTimeSeconds = (float)fixedDeltaTime / 1000.0;
 
// the leftOverDeltaTime carries over change in time that isn't accounted for over to the next frame
int leftOverDeltaTime = 0;
 
// How many times are the constraints solved for per frame:
int constraintAccuracy = 3;
 
// instructional stuffs:
PFont font;
final int instructionLength = 3000;
final int instructionFade = 300;
void setup () {
  // I find that P2D is the fastest renderer for 2D graphics
  // OPENGL may be faster for some people
  // The default renderer is JAVA2D
  size(640,480, P2D);
   
  // we square the mouseInfluenceSize and mouseTearSize so we don't have to use squareRoot when comparing distances with this.
  mouseInfluenceSize *= mouseInfluenceSize;
  mouseTearSize *= mouseTearSize;
   
  // create the curtain
  createCurtain();
   
  font = loadFont("LucidaBright-Demi-16.vlw");
  textFont(font);
}
 
void draw () {
  background(255);
   
  /******** Physics ********/
  // time related stuff
  currentTime = millis();
  // deltaTimeMS: change in time in milliseconds since last frame
  long deltaTimeMS = currentTime - previousTime;
  previousTime = currentTime; // reset previousTime
  // timeStepAmt will be how many of our fixedDeltaTime's can fit in the physics for this frame.
  int timeStepAmt = (int)((float)(deltaTimeMS + leftOverDeltaTime) / (float)fixedDeltaTime);
  // Here we cap the timeStepAmt to prevent the iteration count from getting too high and exploding
  timeStepAmt = min(timeStepAmt, 5);
   
  leftOverDeltaTime += (int)deltaTimeMS - (timeStepAmt * fixedDeltaTime); // add to the leftOverDeltaTime.
 
  // If the mouse is pressing, it's influence will be spread out over every iteration in equal parts.
  // This keeps the program from exploding from user interaction if the timeStepAmt gets too high.
  mouseInfluenceScalar = 1.0 / timeStepAmt;
   
  // update physics
  for (int iteration = 1; iteration <= timeStepAmt; iteration++) {
    // solve the constraints multiple times
    // the more it's solved, the more accurate.
    for (int x = 0; x < constraintAccuracy; x++) {
      for (int i = 0; i < particles.size(); i++) {
        Particle particle = (Particle) particles.get(i);
        particle.solveConstraints();
      }
    }
     
    // update each particle's position
    for (int i = 0; i < particles.size(); i++) {
      Particle particle = (Particle) particles.get(i);
      particle.updateInteractions();
      particle.updatePhysics(fixedDeltaTimeSeconds);
    }
  }
  // draw each particle or its links
  for (int i = 0; i < particles.size(); i++) {
    Particle particle = (Particle) particles.get(i);
    particle.draw();
  }
   
  if (millis() < instructionLength)
    drawInstructions();
  
  if (frameCount % 60 == 0)
    println("Frame rate is " + frameRate);
}
void createCurtain () {
  // We use an ArrayList instead of an array so we could add or remove particles at will.
  // not that it isn't possible using an array, it's just more convenient this way
  particles = new ArrayList();
   
  // midWidth: amount to translate the curtain along x-axis for it to be centered
  // (curtainWidth * restingDistances) = curtain's pixel width
  int midWidth = (int) (width/2 - (curtainWidth * restingDistances)/2);
  // Since this our fabric is basically a grid of points, we have two loops
  for (int y = 0; y <= curtainHeight; y++) { // due to the way particles are attached, we need the y loop on the outside
    for (int x = 0; x <= curtainWidth; x++) {
      Particle particle = new Particle(new PVector(midWidth + x * restingDistances, y * restingDistances + yStart));
       
      // attach to
      // x - 1  and
      // y - 1 
      // particle attachTo parameters: Particle particle, float restingDistance, float stiffness
      // try disabling the next 2 lines (the if statement and attachTo part) to create a hairy effect
      if (x != 0)
        particle.attachTo((Particle)(particles.get(particles.size()-1)), restingDistances, stiffnesses);
      // the index for the particles are one dimensions,
      // so we convert x,y coordinates to 1 dimension using the formula y*width+x 
      if (y != 0)
        particle.attachTo((Particle)(particles.get((y - 1) * (curtainWidth+1) + x)), restingDistances, stiffnesses);
         
/*
      // shearing, presumably. Attaching invisible links diagonally between points can give our cloth stiffness.
      // the stiffer these are, the more our cloth acts like jello.
      // these are unnecessary for me, so I keep them disabled.
      if ((x != 0) && (y != 0))
        particle.attachTo((Particle)(particles.get((y - 1) * (curtainWidth+1) + (x-1))), restingDistances * sqrt(2), 0.1, false);
      if ((x != curtainWidth) && (y != 0))
        particle.attachTo((Particle)(particles.get((y - 1) * (curtainWidth+1) + (x+1))), restingDistances * sqrt(2), 1, true);
*/
       
      // we pin the very top particles to where they are
      if (y == 0)
        particle.pinTo(particle.position);
         
      // add to particle array 
      particles.add(particle);
    }
  }
}
 
// Controls. The r key resets the curtain, g toggles gravity
void keyPressed() {
  if ((key == 'r') || (key == 'R'))
    createCurtain();
  if ((key == 'g') || (key == 'G'))
    toggleGravity();
}
void toggleGravity () {
  if (gravity != 0)
    gravity = 0;
  else
    gravity = 392;
}
 
void drawInstructions () {
  float fade = 255 - (((float)millis()-(instructionLength - instructionFade)) / instructionFade) * 255;
  stroke(0, fade);
  fill(255, fade);
  rect(0,0, 200,45);
  fill(0, fade);
  text("'r' : reset", 10, 20);
  text("'g' : toggle gravity", 10, 35);
}
 
// Credit to: http://www.codeguru.com/forum/showpost.php?p=1913101&postcount=16
float distPointToSegmentSquared (float lineX1, float lineY1, float lineX2, float lineY2, float pointX, float pointY) {
  float vx = lineX1 - pointX;
  float vy = lineY1 - pointY;
  float ux = lineX2 - lineX1;
  float uy = lineY2 - lineY1;
   
  float len = ux*ux + uy*uy;
  float det = (-vx * ux) + (-vy * uy);
  if ((det < 0) || (det > len)) {
    ux = lineX2 - pointX;
    uy = lineY2 - pointY;
    return min(vx*vx+vy*vy, ux*ux+uy*uy);
  }
   
  det = ux*vy - uy*vx;
  return (det*det) / len;
}

