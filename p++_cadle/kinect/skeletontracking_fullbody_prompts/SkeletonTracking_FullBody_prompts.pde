import SimpleOpenNI.*;
SimpleOpenNI kinect;

PFont f;
boolean onNewUser=false;
boolean onStartPose=false;
boolean onEndCalibration=false;
boolean finished=false;

void setup()
{
    size(640, 480);

    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);

    f = loadFont("AgencyFB-Bold-48.vlw");
    textFont(f,48);
    textAlign(CENTER);
}

void draw()
{
    kinect.update();
    PImage depth = kinect.depthImage();
    image(depth, 0, 0);

    if (!finished)
        if (onNewUser)
            text("start pose detection", width/2, 50);
        else if (onStartPose)
            text("Started pose for user", width/2, 50);
        else if (onEndCalibration)
            text("User Calibrated !!!", width/2, 50);
            
    IntVector userList = new IntVector();
    kinect.getUsers(userList);

    if (userList.size() > 0)
    {
        int userId = userList.get(0);

        if (kinect.isTrackingSkeleton(userId))
        {
            drawSkeleton(userId);
        }
    }
}

void drawJoint(int userId, int jointId)
{
    PVector joint = new PVector();

    float confidence = kinect.getJointPositionSkeleton(userId, jointId, joint);
    if (confidence < 0.5)
        return;

    PVector cJoint = new PVector();
    kinect.convertRealWorldToProjective(joint, cJoint);

    ellipse(cJoint.x, cJoint.y, 10, 10);
}

void drawSkeleton(int userId)
{
    stroke(255, 0, 0);
    strokeWeight(5);
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
    kinect.drawLimb(userId, SimpleOpenNI.SKEL_TORSO, SimpleOpenNI.SKEL_RIGHT_HIP);
    kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_LEFT_KNEE);
    kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_KNEE, SimpleOpenNI.SKEL_LEFT_FOOT);
    kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_HIP, SimpleOpenNI.SKEL_RIGHT_KNEE);
    kinect.drawLimb(userId, SimpleOpenNI.SKEL_RIGHT_KNEE, SimpleOpenNI.SKEL_RIGHT_FOOT);
    kinect.drawLimb(userId, SimpleOpenNI.SKEL_LEFT_HIP, SimpleOpenNI.SKEL_RIGHT_HIP);

    noStroke();
    fill(0, 255, 255);
    drawJoint(userId, SimpleOpenNI.SKEL_HEAD);
    drawJoint(userId, SimpleOpenNI.SKEL_NECK);
    drawJoint(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER);
    drawJoint(userId, SimpleOpenNI.SKEL_LEFT_ELBOW);
    drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
    drawJoint(userId, SimpleOpenNI.SKEL_LEFT_KNEE);
    drawJoint(userId, SimpleOpenNI.SKEL_LEFT_FOOT);
    drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
    drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
    drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW);
    drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HIP);
    drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_KNEE);
    drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_FOOT);
    drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
    drawJoint(userId, SimpleOpenNI.SKEL_TORSO);
}


void onNewUser(int userId)
{
    println("start pose detection");
    onNewUser = true;
    kinect.startPoseDetection("Psi", userId);
}

void onEndCalibration(int userId, boolean successful)
{
    if (successful)
    {
        println("User Calibrated !!!");
        onStartPose = false;
        onEndCalibration = true;
        kinect.startTrackingSkeleton(userId);
    }
    else
    {
        println("Failed to calibrate user !!!");
        kinect.startPoseDetection("Psi", userId);
    }
}

void onStartPose(String pose, int userId)
{
    println("Started pose for user");
    onNewUser = false;
    onStartPose = true;
    kinect.stopPoseDetection(userId);
    kinect.requestCalibrationSkeleton(userId, true);
}

