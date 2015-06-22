final int DEFAULT_MISSILE_SPEED = 5;
final int DEFAULT_MISSILE_HEALTH = 10;

public class Missile extends DamageableCircle {
  Target target;
  PVector loc;
  int speed;         //in pixels per second
  float direction;   //in radians
  
  boolean isTame = false;  //if this is true, it won't move at all.

  PowerUp powerUp;

  public Missile() {
    this(randomPositionBeyondEdge(), DEFAULT_MISSILE_HEALTH, true);
  }
  public Missile(PVector startLocation, int maxH) {
    this(startLocation, maxH, true);
  }
  public Missile(PVector startLocation, int maxH, boolean allowPowerUps) {
    super(maxH);
    loc=startLocation;
    pickTarget();
    direction = directionToTarget();  //not yet correct - should adjust direction to point to the center by default
    speed = DEFAULT_MISSILE_SPEED;
    if (allowPowerUps) {
      float random = random(1);
      for (int i = 1 ; i < POW_PROBABILITIES.length ; i++) {
        float probability = POW_PROBABILITIES[i];
        if (probability <= 0.0) break;
        if (random < probability) {
          setPowerUp(i);
          break;
        } 
        random -= probability;
      }
    }
  }

  public PVector loc() {
    return loc;
  }

  public void act() {
    if(isTame) return; //there isn't anything for it to do in here if it's tame
    
    if (hasBeenKilled)
      missiles.remove(this);

    if (target == null) {
      pickTarget();
      return;
    }
    if (random(frameRate)<10) pickTarget();
    direction = lerp(direction, directionToTarget(), 10.0/frameRate);

    loc.x += speed * cos(direction);
    loc.y += speed * sin(direction);

    //println(target.health()+" "+loc.dist(target.loc())+"\t"+loc+" "+target.loc());  //-debug
    if (sqrt(dist2(loc, target.loc())) < target.maxHealth()) {
      target.subtractHealth(this.percentHealth());
      missiles.remove(this);
    }
  }

  public void display() {

    displayOutline(#000000, false);

    displayCenter((powerUp==null?#FF1F1F:POW_COLORS[powerUp.type()]), false);  //will be a specific color if it is carrying a power up, and red otherwise

    //    stroke(255);                                                                                //-debug
    //    line(loc.x,loc.y,loc.x+500*cos(direction),loc.y+500*sin(direction));                        //-debug
    //    if(target!=null){                                                                           //-debug
    //      float calculatedDirection = directionToTarget();                                          //-debug
    //      stroke(255,0,0);                                                                          //-debug
    //      line(loc.x,loc.y,target.loc().x,target.loc().y);                                          //-debug
    //      stroke(255,0,255);                                                                        //-debug
    //      line(loc.x,loc.y,loc.x+500*cos(calculatedDirection),loc.y+500*sin(calculatedDirection));  //-debug
    //    }                                                                                           //-debug
  }

  public float directionToTarget() {
    if(isTame) return 0.0;
    if (target == null) return -0.0;
    PVector v2 = PVector.sub(target.loc(), loc());
    return atan2(v2.y, v2.x);
  }

  public void pickTarget() {
    if(isTame) return;
    Target closestTarget = target;
    float closestMagnitude = Float.MAX_VALUE;
    for (Target t : targets) {
      if (closestTarget == null || (t.isAlive() && loc.dist(t.loc())<closestMagnitude+1)) {
        closestTarget = t;
        closestMagnitude = loc.dist(t.loc());
      }
    }
    target = closestTarget;
  }
  
  public void setTarget(Target t){
    this.target = t;
  }

  public void subtractHealth(float amount) {
    if (hasBeenKilled) return; //should not do anything if already dead
    super.subtractHealth(amount);
    if (hasBeenKilled) {
      addPoints(this);
      if (this.powerUp!=null) {
        powerUps.add(this.powerUp);
        particles.add( new TextParticle( loc(), powType(powerUp.type()), POW_COLORS[powerUp.type()]) );
        println(powerUps);
      }
    }
  }

  public String toString() {
    return "Missile@["+(int)loc.x+","+(int)loc.y+"]v:"+speed+"@"+round(180/PI*direction);
  }
  
  public void suppressMovement(){
    isTame = true;
  }
  
  public void setPowerUp(int type){
    if(type==POW_NOTHING){
      powerUp = null;
      return;
    }
    powerUp = new PowerUp(type);
    health = maxHealth = DEFAULT_MISSILE_HEALTH*2;
  }
}

//like a regular missile, but bigger, slower, and stronger
public class SuperMissile extends Missile {
  public SuperMissile() {
    this(randomPositionBeyondEdge());
  }
  public SuperMissile(PVector location) {
    this(location, 5*DEFAULT_MISSILE_HEALTH);
  }
  public SuperMissile(PVector location, int maxH) {
    this(location, maxH, false);    //by default, it will not allow power ups
  }
  public SuperMissile(PVector location, int maxH, boolean allowPowerUps) {
    super(location, maxH, allowPowerUps);
    super.speed -= 2;
  }

  public void display() {
    displayOutline(#000000, false);
    displayCenter((powerUp==null?#FF7F1F:POW_COLORS[powerUp.type()]), false);
  }

  public void act() {
    super.act();
//    addHealth(5.0/frameRate);
  }
}

//like a regular missile, but with an improved AI
public class SmartMissile extends Missile {
  public SmartMissile() {
    this(randomPositionBeyondEdge());
  }
  public SmartMissile(PVector location) {
    this(location, DEFAULT_MISSILE_HEALTH);
  }
  public SmartMissile(PVector location, int maxH) {
    this(location, maxH, false);    //by default, it will not allow power ups
  }
  public SmartMissile(PVector location, int maxH, boolean allowPowerUps) {
    super(location, maxH, allowPowerUps);
    super.speed -= 2;
  }

  public void display() {
    displayOutline(#000000, false);
    displayCenter((powerUp==null?#00FF3F:POW_COLORS[powerUp.type()]), false);
  }

  public void pickTarget() {
    Target closestTarget = target;
    float closestMagnitude = Float.MAX_VALUE;
    for (Target t : targets) {
      if (closestTarget == null || (t.isAlive() && !t.isProtected() && loc.dist(t.loc())<closestMagnitude+1)) {
        closestTarget = t;
        closestMagnitude = loc.dist(t.loc());
      }
    }
    target = closestTarget;
  }
}

public void generateMissles() {
  if (maxTimeBetweenMissileSpawns>0 && millis() > timeForNextMissileSpawn) {
    missiles.add(new Missile());
    timeForNextMissileSpawn = millis() + (int) random(maxTimeBetweenMissileSpawns);
  }
  if (maxTimeBetweenSuperMissileSpawns>0 && millis() > timeForNextSuperMissileSpawn) {
    missiles.add(new SuperMissile());
    timeForNextSuperMissileSpawn = millis() + (int) random(maxTimeBetweenSuperMissileSpawns);
  }
  if (maxTimeBetweenSmartMissileSpawns>0 && millis() > timeForNextSmartMissileSpawn) {
    missiles.add(new SmartMissile());
    timeForNextSmartMissileSpawn = millis() + (int) random(maxTimeBetweenSmartMissileSpawns);
  }
}
