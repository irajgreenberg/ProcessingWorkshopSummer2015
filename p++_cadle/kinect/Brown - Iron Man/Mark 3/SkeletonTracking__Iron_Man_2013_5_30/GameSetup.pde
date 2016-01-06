int gameStartTime = -1,
    gameEndTime = -1;

//variables related to power ups:
ArrayList<PowerUp> powerUps;
int endOfBeamStrengthen = -1,
    endOfInvincibility = -1,
    endOfRegeneration = -1,
    startOfClearScreen = -1,
    endOfClearScreen = -1;
PVector clearScreenCenter;
int extraLives = 0; //the number of lives available for restoring targets. Obtained through power-ups.
final int TOTAL_REGENERATION_HEALTH = 5;    //will restore this amount of health to every living Target every second

//for missile generation
//WILL EVENTUALLY BE CHANGED TO WORK IN "WAVES" OF MISSLES
int timeForNextMissileSpawn = -1, //the time in milliseconds when the next missile should be spawned
    maxTimeBetweenMissileSpawns = -1, //the maximum time in milliseconds between missile spawns
    timeForNextSuperMissileSpawn = -1, //the time in milliseconds when the next Super missile should be spawned
    maxTimeBetweenSuperMissileSpawns = -1, //the maximum time in milliseconds between Super missile spawns
    timeForNextSmartMissileSpawn = -1, //the time in milliseconds when the next Super missile should be spawned
    maxTimeBetweenSmartMissileSpawns = -1; //the maximum time in milliseconds between Super missile spawns

boolean gameOver = false;

CoreTarget core;

int playerId = -1;

final int DEFAULT_JOINT_HEALTH = 20,
          DEFAULT_CORE_HEALTH = 50;

public void createTargets(int userId){
  targets = new ArrayList<Target>();
  
  targets.add(core = new CoreTarget(DEFAULT_CORE_HEALTH,userId));
  targets.add(new JointTarget(DEFAULT_JOINT_HEALTH,userId,SimpleOpenNI.SKEL_LEFT_ELBOW));
  targets.add(new JointTarget(DEFAULT_JOINT_HEALTH,userId,SimpleOpenNI.SKEL_RIGHT_ELBOW));
  targets.add(new JointTarget(DEFAULT_JOINT_HEALTH,userId,SimpleOpenNI.SKEL_LEFT_HIP));
  targets.add(new JointTarget(DEFAULT_JOINT_HEALTH,userId,SimpleOpenNI.SKEL_RIGHT_HIP));
}

public void startGame(int userId, int millisToStart){
  isOnMenu = false;
  gameStartTime = millisToStart+millis();
  gameEndTime = -1;
  endOfBeamStrengthen = -1;
  endOfInvincibility = -1;
  endOfRegeneration = -1;
  startOfClearScreen = endOfClearScreen = -1;
  clearScreenCenter = new PVector();
  extraLives = 0;
  gameOver = false;
  
  level = 1;
  points = 0;
  
  missiles.clear();
  createTargets(userId);
  playerId = userId;
  
  timeForNextMissileSpawn = gameStartTime; //the time in milliseconds when the next missile should be spawned
  maxTimeBetweenMissileSpawns = 1000; //the maximum time in milliseconds between missile spawns
  timeForNextSuperMissileSpawn = -1; //the time in milliseconds when the next Super missile should be spawned
  maxTimeBetweenSuperMissileSpawns = -1; //the maximum time in milliseconds between Super missile spawns
  timeForNextSmartMissileSpawn = -1; //the time in milliseconds when the next smart missile should be spawned
  maxTimeBetweenSmartMissileSpawns = -1; //the maximum time in milliseconds between smart missile spawns
}

public void stopGame(){
  if(gameOver) return;
  gameOver = true;
  gameEndTime = millis();
  overheadColor = #FFFF00;
//  applyPowerUp(new PowerUp(POW_CLEAR_SCREEN));
  missiles.add( Menu_returnToMenu = new MenuOption(new PVector(width-50, height/2), "Return to Menu",RIGHT,CENTER) );
}

public void resetSketch(){
  initializeSketch();
  IntVector users = new IntVector();
  kinect.getUsers(users);
  for(int i = 0 ; i < users.size() ; i++){
    onNewUser(users.get(i));
  }
}

public void initializeSketch(){
  targets = new ArrayList<Target>();
  missiles = new ArrayList<Missile>();
  powerUps = new ArrayList<PowerUp>();
  
  isOnMenu = true;
  isOnCredits = isOnHowTo = false;
  
  gameStartTime = -1;
  gameEndTime = -1;
  endOfBeamStrengthen = -1;
  endOfInvincibility = -1;
  endOfRegeneration = -1;
  startOfClearScreen = endOfClearScreen = -1;
  clearScreenCenter = new PVector();
  extraLives = 0;
  gameOver = false;
  
  playerId = -1;
  
  level = 1;
  points = 0;
  
  missiles.clear();
  
  timeForNextMissileSpawn = -1; //the time in milliseconds when the next missile should be spawned
  maxTimeBetweenMissileSpawns = -1; //the maximum time in milliseconds between missile spawns
  timeForNextSuperMissileSpawn = -1; //the time in milliseconds when the next Super missile should be spawned
  maxTimeBetweenSuperMissileSpawns = -1; //the maximum time in milliseconds between Super missile spawns
  timeForNextSmartMissileSpawn = -1; //the time in milliseconds when the next smart missile should be spawned
  maxTimeBetweenSmartMissileSpawns = -1; //the maximum time in milliseconds between smart missile spawns
}

void setUpKinect(){
  kinect = new SimpleOpenNI(this);
  kinect.enableDepth();
  kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
  kinect.setMirror(true);
  if(_useRGB){
    kinect.enableRGB();
    kinect.alternativeViewPointDepthToImage();
  }
}

void keyPressed(){
  if(key==CODED){
    if(keyCode == java.awt.event.KeyEvent.VK_END){
      resetSketch();
    } else if(keyCode == java.awt.event.KeyEvent.VK_HOME && playerId >= 1){
      if(!gameOver){
        stopGame();
      }
      gameEndTime = gameStartTime = -1;
      populateMenu();
      isOnMenu = true;
      isOnCredits = false;
      isOnHowTo = false;
    }
  }
}
