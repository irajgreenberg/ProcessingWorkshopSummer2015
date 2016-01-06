final int POW_NOTHING             = 0,        //PROBABLY WILL RARELY BE USED
          POW_RESTORE_HEALTH      = 1,
          POW_RESTORE_LIFE        = 2,
          POW_CLEAR_SCREEN        = 3,
          POW_STRENGTHEN_BEAM     = 4,
          POW_INVINCIBILITY       = 5,
          POW_REGENERATION        = 6;      
          //                                +Health  +Life    Kill all +Beam    Invinc   Regen
final float[] POW_PROBABILITIES = {0.0,     1.0/60,  1.0/300, 1.0/120, 1.0/120, 1.0/300, 1.0/300};  //must have an entry for every type of powerup, in 1.0/sec
final int[] POW_DURATIONS =       {-1,      -1,      -1,      3000,    5000,    5000,    5000   };  //duration of each power up, in ms. A duration of -1 implies a one-time use.
final color[] POW_COLORS =        {#000000, #20FF20, #8080FF, #FFFFFF, #FF0000, #7DF9FF, #FF00FF};  //the colors of each powerup-holding missile

class PowerUp{
  int type;
  int activeStartTime;
  
  public PowerUp(int t){
    type=t;
    activeStartTime = -1;
  }
  
  public int type(){
    return type;
  }
  
  public int startTime(){
    return activeStartTime;
  }
  
  public int duration(){
    return POW_DURATIONS[type];
  }
  
  public boolean isActive(){
    return activeStartTime > 0 && (duration()<0 || activeStartTime + duration() > millis());
  }
  
  public boolean isExpired(){
    return activeStartTime>0 && activeStartTime+duration()<millis();
  }
  
  public boolean activate(){
    if(isActive()) return false;
    activeStartTime = millis();
    return true;
  }
  
  public int compareTo(PowerUp p){
    if(p.type == this.type)
      return activeStartTime-p.activeStartTime;
    return this.type-p.type;
  }
  
  public String toString(){
    return powType(type);
  }
}

public String powType(int type){
  switch(type){
    case POW_NOTHING: return "NOTHING";
    case POW_RESTORE_HEALTH: return "Health Restored";
    case POW_RESTORE_LIFE: return "Extra Life";
    case POW_CLEAR_SCREEN: return "Screen Cleared";
    case POW_STRENGTHEN_BEAM: return "Super Beam";
    case POW_INVINCIBILITY: return "Invincibility";
    case POW_REGENERATION: return "Regeneration";
    default: return "POW_ERROR!";
  }
}

/*public boolean POW_isActive(int type){
  for(PowerUp p : powerUps){
    if(p.type() == type) return true;
  }
  return false;
}

public PowerUp POW_getPowerUp(int type){
  for(int i = 0 ; i < powerUps.size() ; i++){
    if(powerUps.get(i).type() == type)
      return powerUps.remove(i);
  }
  return null;
}*/

public void applyPowerUp(PowerUp p){
  if(_debug_powerups) System.out.println("Activated:\t"+p);                  //-debug
  p.activate();
  switch(p.type()){
    case POW_NOTHING:
      break;
    case POW_RESTORE_HEALTH:
      Target weakest = null;
      for(Target t : targets){
        if(t.isAlive()){
          if(t.percentHealth() < 1.0){
            if(weakest == null || t.health() < weakest.health())
              weakest = t;
          }
        }
      }
      if(weakest == null) break;
      weakest.addHealth(20);
      break;
    case POW_RESTORE_LIFE:
      extraLives++;
      break;
    case POW_CLEAR_SCREEN:
      startOfClearScreen = millis();
      endOfClearScreen = millis() + POW_DURATIONS[POW_CLEAR_SCREEN];
      clearScreenCenter.x = core.loc().x;
      clearScreenCenter.y = core.loc().y;
//      for(Missile m : missiles)
//        m.subtractHealth(m.maxHealth());
      break;
    case POW_STRENGTHEN_BEAM:
      if(endOfBeamStrengthen < millis()){
        endOfBeamStrengthen = millis();
      }
      endOfBeamStrengthen += POW_DURATIONS[p.type()];
      break;
    case POW_INVINCIBILITY:
      if(endOfInvincibility < millis()){
        endOfInvincibility = millis();
      }
      endOfInvincibility += POW_DURATIONS[p.type()];
      break;
    case POW_REGENERATION:
      if(endOfRegeneration < millis()){
        endOfRegeneration = millis();
      }
      endOfRegeneration += POW_DURATIONS[p.type()];
      break;
    default:
      System.out.println("POW_ERROR!");
      return;
  }
}
