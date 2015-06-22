import SimpleOpenNI.*;

String overheadText="";
color overheadColor = #FFFFFF;
PFont overheadFont, menuScriptFont;
SimpleOpenNI kinect;

PImage headImage;

ArrayList<Target> targets;
ArrayList<Missile> missiles;
ArrayList<Particle> particles;

boolean isOnMenu, isOnCredits, isOnHowTo;

float SCREEN_DIAGONAL;
/*WORKLIST
 * complete AI for SmartMissiles
 * finish setting up menu
 * make instructions more clear
 * set up high score
 * set up menu option to return to menu after game over
 */
/*CHANGELOG
 *2013 04 23
 * changes : powerups
 * need to complete powerups
 *2013 04 25
 * powerups coded
 * added comments
 * made improvements to how targets are displayed
 * added a debug variable
 *2013 04 26
 * improved power-ups
 * added Score tab
 * added SmartMissiles
 *2013 05 14
 * took things from the drawSkeleton() method and put it into separate methods, primarily with the GameTicker Tab
 * solved a bug where other users could "steal" the game from the user by making a Y
 *2013 05 20
 * added a menu screen
 * made it possible for players to quit from the menu (just reseets the sketch)
 * added instructions and credits
 * added a menu option at game over that lets you return to the menu
 */

final boolean _debug = true, 
_debug_missiles = false, 
_debug_powerups = false, 
_debug_pose = true, 
_useRGB = false;

void setup()
{
  size(640, 480);
  SCREEN_DIAGONAL = sqrt(sq(width/2)+sq(height/2));

  setUpKinect();

  overheadFont = loadFont("AgencyFB-Bold-48.vlw");
  menuScriptFont = loadFont("AgencyFB-Bold-38.vlw");
  textFont(overheadFont);
  textAlign(CENTER, TOP);
  imageMode(CENTER);
  ellipseMode(CENTER);

  headImage = loadImage("iron-man head.png");

  particles = new ArrayList<Particle>();

  initializeSketch();

  if (_debug_powerups) {
    for (int i = 0; i < POW_PROBABILITIES.length;i++) {
      POW_PROBABILITIES[i]*=10;
    }
  }
}

void draw()
{
  kinect.update();
  PImage depth;
  if (_useRGB) depth = kinect.rgbImage();
  else       depth = kinect.depthImage();
  image(depth, width/2, height/2);
  //    background(196);

  IntVector userList = new IntVector();

  kinect.getUsers(userList);
  if (_debug) print("userList");                                                        //debug
  if (_debug) for (int i  = 0 ; i < userList.size(); i++) print(" "+userList.get(i));    //debug
  if (_debug) println();                                                                //debug

  //    if (userList.size() > 0)
  //    {
  //        int userId = userList.get(0);

  if (playerId >= 1) {
    if (kinect.isTrackingSkeleton(playerId))
    {
      stroke(0);
      drawSkeleton(playerId);
      //this will actually draw & update the skeleton and the mask
      handleAndDisplayObjects(playerId);
      //this will actually draw & update the targets and the missiles, as well as display the relevant power up effects
      handleAndDisplayParticles();

      if (isOnMenu) {
        if (isOnCredits) {
          overheadText = "Credits";
          displayCredits();
        } 
        else if (isOnHowTo) {
          //                overheadText = String.format("Instructions - page %d\t\t",howToPage);
          overheadText = "Instructions";
          displayHowTo();
        } 
        else {
          overheadText = "Iron Man Missile Defense";
        }
      } 
      else {

        if (gameOver) {
          overheadText = "Game over.\nTotal points: "+points+" Time Alive: "+(gameEndTime - gameStartTime)/1000;
        }
        else if (gameStartTime > 0) {
          if (gameStartTime>millis())
            overheadText = "Game will start in "+(1000+gameStartTime-millis())/1000+" seconds.";
          else {
            overheadText = ((points==0)?("Defend yourself!"):("Points: "+points+"   Time Alive:"+(millis()-gameStartTime)/1000));
            //handles missiles
            if (_debug_missiles) println("Missiles: "+missiles);                                //-debug
            if (targets.size() > 0) {
              generateMissles();
            }
            handlePowerUps();  //handles powerups
            drawExtraLives();  //displays extra lives
          }
        }
      }
    } 
    else {
      stopGame();
      overheadText = "";
      playerId = -1;
    }
  } 
  else {
    overheadText = "Make a muscleman pose!";

    stroke(0, 255, 255);
    strokeWeight(5);
    PVector lHand, rHand, lElbow, rElbow, torso, head, hips;
    torso = new PVector(width/2, 250);
    head = PVector.add(torso, new PVector(0, -50));
    lElbow = PVector.sub(torso, new PVector(100, 0));
    rElbow = PVector.add(torso, new PVector(100, 0));
    lHand = PVector.add(lElbow, new PVector(0, -75));
    rHand = PVector.add(rElbow, new PVector(0, -75));
    hips = PVector.add(torso, new PVector(0, 150));

    line(head, hips);
    line(lElbow, rElbow);
    line(lHand, lElbow);
    line(rHand, rElbow);

    ellipse(head.x, head.y, 50, 50);
  }
  //    }

  textAlign(CENTER, TOP);
  textFont(overheadFont);
  strokeText(overheadText, width/2, 0, overheadColor, #000000);
  if (gameStartTime > 0) {
    textAlign(CENTER, BASELINE);
    strokeText("Level:\t"+level(), width/2, height, overheadColor, #000000);
  }
}

void drawSkeleton(int userId) {

  //draws the skeleton
  stroke(0, 255, 255);
  strokeWeight(5);

  //drawing the actual skeleton
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_HEAD, SimpleOpenNI.SKEL_NECK);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_LEFT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_LEFT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_ELBOW, SimpleOpenNI.SKEL_LEFT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_NECK, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_RIGHT_ELBOW);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW, SimpleOpenNI.SKEL_RIGHT_HAND);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER, SimpleOpenNI.SKEL_TORSO);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_LEFT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
  kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);


  //draws the head
  PVector headPosition = new PVector(), neckPosition = new PVector();
  headPosition = this.getJointPosition(userId, SimpleOpenNI.SKEL_HEAD);
  neckPosition = this.getJointPosition(userId, SimpleOpenNI.SKEL_NECK);

  float neckLength = abs(neckPosition.y-headPosition.y);

  image(headImage, headPosition.x, headPosition.y, neckLength, neckLength*headImage.height/headImage.width);
}

void drawJoint(int userId, int jointId) {
  PVector joint = new PVector();

  //from 0 to 1
  float confidence = kinect.getJointPositionSkeleton(userId, jointId, joint);
  if (confidence<0.5) return;

  PVector cJoint = new PVector();
  kinect.convertRealWorldToProjective(joint, cJoint);
  ellipse(cJoint.x, cJoint.y, 10, 10);
}

void onNewUser(int userId)
{
  if (playerId > 0) return;
  overheadText = "Start pose detection.\nMake a muscleman pose\n(with your arms up!)";
  overheadColor = #FFFFFF;
  kinect.startPoseDetection("Psi", userId);
}

void onEndCalibration(int userId, boolean successful)
{
  if (playerId > 0) {
    if (_debug_pose) println("Duplicate player.");
    return;
  }
  else {
    if (successful)
    {
      overheadText = "User Calibrated !!!";
      overheadColor = #00FF20;
      kinect.startTrackingSkeleton(userId);
      createTargets(userId);               //will create the missile's targets for the user
      playerId = userId;
      //        populateMenu();                      //will set up the menu
      isOnHowTo = true;                    //starts the user on the instructions page
      isOnMenu = true;
      howToPage = 0;
      populateHowTo();
    }
    else
    {
      overheadText ="Failed to calibrate user !!!\nPlease retry.";
      overheadColor = #FF0000;
      kinect.startPoseDetection("Psi", userId);
    }
  }
}

void onStartPose(String pose, int userId)
{
  overheadText = "Started pose for user";
  overheadColor = #FFFFFF;
  kinect.stopPoseDetection(userId);
  kinect.requestCalibrationSkeleton(userId, true);
}

