/////////deals with the actual calculations that progress the game


public void handleAndDisplayObjects(int userId) {

  int numTargetsAlive = 0;

  for (Target t: targets) {
    t.act();
    t.display();
    if (t.isAlive()) numTargetsAlive++;
  }
  updateMissleSpawnRates(numTargetsAlive);

  //draws the beam
  PVector rightHand = new PVector(), 
  leftHand = new PVector();
  float beamWidth = readyBeam(userId, leftHand, rightHand);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HAND, SimpleOpenNI.SKEL_RIGHT_HAND);

  int clearScreenRadius = 0;
  if (millis() > startOfClearScreen && millis() < endOfClearScreen) {
    float percentDone = map(millis(), startOfClearScreen, endOfClearScreen, 0, 1);
    clearScreenRadius = (int)(SCREEN_DIAGONAL*percentDone);
    noStroke();
    fill(255, 255, 255, 255*(1-percentDone));
    ellipse(clearScreenCenter.x, clearScreenCenter.y, clearScreenRadius*2, clearScreenRadius*2);
  }

  for (int i = missiles.size()-1 ; i < missiles.size() && i >=0 ; i--) {
    Missile m = missiles.get(i);
    if (millis() > startOfClearScreen && millis() < endOfClearScreen && m.loc().dist(clearScreenCenter) < clearScreenRadius + m.health()/2) {
      addPoints(m);
      missiles.remove(i++);  //safely removes the missile WITHOUT activating its power-up
      continue;
    }
    float closeness = distToSegment(m.loc(), leftHand, rightHand);    //remember, left & right hands' projected locations are stored inside readyBeam()
    if ((m instanceof MenuOption || !isOnMenu) && closeness <= beamWidth + m.health()/2) {
      m.subtractHealth(5*abs(beamWidth/frameRate));
      //points are added inside the missile's own subtactHealth() method
    }
    m.act();
    m.display();
  }
}

void handleAndDisplayParticles() {
  for (int i = particles.size()-1 ; i >= 0 ; i--) {
    Particle p = particles.get(i);
    p.act();
    p.display();
    if (p.isExpired())
      particles.remove(i);
  }
}

//gets the game ready to draw the beam; immediatly after this in the main tab, the beam is drawn using drawLimb()
//stores the proper projected hand locations into arguments, and returns the beam's width
public float readyBeam(int userId, PVector leftHand, PVector rightHand) {
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_LEFT_HAND, rightHand);
  kinect.getJointPositionSkeleton(userId, SimpleOpenNI.SKEL_RIGHT_HAND, leftHand);

  PVector diffVector = PVector.sub(rightHand, leftHand);

  kinect.convertRealWorldToProjective(rightHand, rightHand);
  kinect.convertRealWorldToProjective(leftHand, leftHand);

  float beamWidth = min(10000/diffVector.mag(), 40);
  stroke(255);
  if (endOfBeamStrengthen > millis()) {
    float percentDone = (float)(endOfBeamStrengthen - millis()) / POW_DURATIONS[POW_STRENGTHEN_BEAM];
    beamWidth *= 1 + 2*percentDone;
    stroke(255, 255*(1-percentDone), 255*(1-percentDone));
  }
  strokeWeight(2*beamWidth);

  return beamWidth;
}

public float readyBeamWithCoordinates(PVector leftHand, PVector rightHand){
  PVector diffVector = PVector.sub(rightHand, leftHand);
  float beamWidth = min(10000/diffVector.mag(), 40);
  stroke(255);
  if (endOfBeamStrengthen > millis()) {
    float percentDone = (float)(endOfBeamStrengthen - millis()) / POW_DURATIONS[POW_STRENGTHEN_BEAM];
    beamWidth *= 1 + 2*percentDone;
    stroke(255, 255*(1-percentDone), 255*(1-percentDone));
  }
  strokeWeight(2*beamWidth);

  return beamWidth;
}

public void updateMissleSpawnRates(int numTargetsAlive) {
  if (gameOver) {
    maxTimeBetweenMissileSpawns = -1;
    timeForNextMissileSpawn = -1;
    maxTimeBetweenSuperMissileSpawns = -1;
    timeForNextSuperMissileSpawn = -1;
    maxTimeBetweenSmartMissileSpawns = -1;
    timeForNextSmartMissileSpawn = -1;
    return;
  }
  if (level() > 0) {
    if (maxTimeBetweenMissileSpawns <= 0) {
      maxTimeBetweenMissileSpawns = targets.size()*5000;
      timeForNextMissileSpawn = millis();
    }
    maxTimeBetweenMissileSpawns = min(maxTimeBetweenMissileSpawns, 1000*(1+targets.size()-numTargetsAlive), 500*(1+targets.size()-level()));
    maxTimeBetweenMissileSpawns = max(maxTimeBetweenMissileSpawns, 500);
    if (_debug) println("numTargets:\t"+targets.size());                                        //-debug
    if (_debug) println("maxTimeBetweenMissileSpawns: "+maxTimeBetweenMissileSpawns);      //-debug
  }
  if (level() > 1) {
    if (maxTimeBetweenSuperMissileSpawns <= 0) {
      maxTimeBetweenSuperMissileSpawns = targets.size()*5000;
      timeForNextSuperMissileSpawn = millis();
    }
    maxTimeBetweenSuperMissileSpawns = min(maxTimeBetweenSuperMissileSpawns, 2000*(1+targets.size()-numTargetsAlive), 2000*(1+targets.size()-level()));
    maxTimeBetweenSuperMissileSpawns = max(maxTimeBetweenSuperMissileSpawns, 500);
    if (_debug) println("maxTimeBetweenSuperMissileSpawns: "+maxTimeBetweenSuperMissileSpawns);      //-debug
  }
  if (level() > 2) {
    if (maxTimeBetweenSmartMissileSpawns <= 0) {
      maxTimeBetweenSmartMissileSpawns = targets.size()*5000;
      timeForNextSmartMissileSpawn = millis();
    }
    maxTimeBetweenSmartMissileSpawns = min(maxTimeBetweenSmartMissileSpawns, 1000*(1+targets.size()-numTargetsAlive), 500*(targets.size()-level()));
    maxTimeBetweenSmartMissileSpawns = max(maxTimeBetweenSmartMissileSpawns, 250);
    if (_debug) println("maxTimeBetweenSmartMissileSpawns: "+maxTimeBetweenSmartMissileSpawns);      //-debug
  }
}

public void handlePowerUps() {
  for (int i = 0 ; i < powerUps.size() ; i++) {
    PowerUp p = powerUps.get(i);
    if (p.isExpired())
    {
      powerUps.remove(i--);
      continue;
    }
    if (p.isActive()) continue;
    applyPowerUp(p);
  }
}

