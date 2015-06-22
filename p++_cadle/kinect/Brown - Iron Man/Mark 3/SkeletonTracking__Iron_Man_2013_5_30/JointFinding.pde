PVector getJointPosition(int userId, int jointId){
    PVector rightHand = new PVector();
    
    //from 0 to 1
    float confidence = kinect.getJointPositionSkeleton(userId, jointId, rightHand);

    PVector convertedRightHand = new PVector();
    kinect.convertRealWorldToProjective(rightHand, convertedRightHand);
    return convertedRightHand;
}

//  stroke(0);
//  strokeWeight(1);
//  fill(255,0,0);
//  
//  drawJoint(userId, SimpleOpenNI.SKEL_HEAD);
//  drawJoint(userId, SimpleOpenNI.SKEL_NECK);
//  drawJoint(userId, SimpleOpenNI.SKEL_TORSO);
//  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_SHOULDER);
//  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_ELBOW);
//  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_WRIST);
//  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HAND);
//  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_SHOULDER);
//  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_ELBOW);
//  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_WRIST);
//  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HAND);
//  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_HIP);
//  drawJoint(userId, SimpleOpenNI.SKEL_LEFT_KNEE);
//  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_HIP);
//  drawJoint(userId, SimpleOpenNI.SKEL_RIGHT_KNEE);
