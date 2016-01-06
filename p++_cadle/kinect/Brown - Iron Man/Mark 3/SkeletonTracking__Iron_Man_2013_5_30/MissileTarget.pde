public abstract class Target extends DamageableCircle {
  /*float health;
   int maxHealth;
   boolean hasBeenKilled;*/

  public Target(int maxH) {
    super(maxH);
    //    health = maxHealth = maxH;
    hasBeenKilled = false;
  }

  public abstract PVector loc();

  //will be called every frame, for the target to handle itself; probably through moving, or regeneration
  public abstract void act();

  public void display() {
    displayOutline(#000000, true);
    if(isAlive())
      displayCenter(#0000FF, true);
    else
      displayCenter(#000000, true);
    displaySheild();                //smart, won't do anything if it doesn't have to.
  }
  
  //displays the sheild. If it is not protected or if the target is dead, this method returns without doing anything.
  public void displaySheild(){
    if(!isProtected() || hasBeenKilled) return;
    strokeWeight(2*protectionStrength());
    stroke(#7DF9FF);
    noFill();
    ellipse(loc().x, loc().y, maxHealth(), maxHealth());
  }
  
  public void subtractHealth(float amount){
    if (isProtected()) return;
    super.subtractHealth(amount);
    if(hasBeenKilled){
      if(extraLives>0){
        extraLives--;
        revive();
      }
    }
  }
  
  boolean isProtected() {
    return endOfInvincibility>millis();
  }

  float protectionStrength() {
    return isProtected()?5.0*(endOfInvincibility-millis())/POW_DURATIONS[POW_INVINCIBILITY]:0;
  }
  
  //restores a dead target back to half health, and returns whether or not a change has been made.
  //first checks if a revive is necessary, and then if it is possible, and returns without doing anything if it is not needed
  public boolean revive(){
    if(!hasBeenKilled || extraLives==0) return false;
    hasBeenKilled = false;
    addHealth(maxHealth()/2.0);
    extraLives--;
    return true;
  }
}

//the basic instantiable target; moves on the screen with the assigned joint
public class JointTarget extends Target {
  int joint;
  int userId;

  public JointTarget(int maxH, int uId, int jointType) {
    super(maxH);
    joint = jointType;
    userId = uId;
  }

  //returns the constantly-changing location
  public PVector loc() {
    PVector temp = getJointPosition(userId, joint);
    temp.z=0;
    return temp;
  }

  //revives if necessary, otherwise does nothing.
  //in this case, it accounts for many of the power-ups
  public void act() {
    if(hasBeenKilled && extraLives>0) revive();
    if(endOfRegeneration > millis())
      addHealth(1.0/TOTAL_REGENERATION_HEALTH);
  }
}

//the center of the player, representing the "core" of Iron Man.
//As long as the joints are intact this is protected, but when it dies, the game is over.
public class CoreTarget extends JointTarget {

  public CoreTarget(int maxHealth, int uId) {
    super(maxHealth, uId, SimpleOpenNI.SKEL_TORSO);
  }

  void display() {
    displayOutline(#FFFFFF, true);
    displayCenter(#000000, false);  //doesn't actually use these parameters
    if(isProtected())
      displaySheild();
  }

  //completely overrides the default display for the center
  void displayCenter(color fill, boolean showHealthiness) {
    float flashPeriod = 1000 * percentHealth();
    fill(127 + 64 + 32*sin(millis()*2*PI/flashPeriod));    //flashes between grey and white every .5 seconds
    noStroke();
    ellipse(loc().x, loc().y, health(), health());
  }

  //same as the parent's subtract health, but may stop the game if a death occurs
  public void subtractHealth(float amount) {
    super.subtractHealth(amount);  //if it is protected, the parent method does nothing, and the core remains alive.
    
    //if the core dies from the loss of health, the game ends.
    if (!isAlive()) {
      stopGame();
    }
  }
  
  //since the core is protected by other joints, this overriding is necessary
  boolean isProtected() {
    if(super.isProtected()) return true;
    for (Target t : targets)
      if (t!=this && t.isAlive()) return true;
    return false;
  }
  
  //since the core is protected by other joints, this overriding is necessary
  float protectionStrength() {
    return max(numberOfAliveTargets()-1,super.protectionStrength());
  }
}

public int numberOfAliveTargets() {
  int count = 0;
  for (Target t : targets)
    if (t.isAlive()) count++;
  return count;
}



public void drawExtraLives(){
  if(extraLives > 0){
    fill(POW_COLORS[POW_RESTORE_LIFE]);
    stroke(POW_COLORS[POW_INVINCIBILITY]);
    for(int i = 0 ; i < extraLives ; ){
      ellipse(width-DEFAULT_JOINT_HEALTH*(++i)-5,height-DEFAULT_JOINT_HEALTH-5,DEFAULT_JOINT_HEALTH,DEFAULT_JOINT_HEALTH);
    }
  }
}

public class ImmoveableCoreTarget extends CoreTarget{
  PVector loc;
  public ImmoveableCoreTarget(PVector l){
    super( 50, playerId );
    loc = l;
  }
  
  public PVector loc(){
    return loc;
  }
}
