import processing.opengl.*;
import SimpleOpenNI.*;

SimpleOpenNI kinect;
boolean tracking;
int userId;
int[] userMap;
PImage bImage;

void setup()
{
    size(640, 480);
    kinect = new SimpleOpenNI(this);
    kinect.enableDepth();
    kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_NONE);
    
    kinect.enableDepth();
    kinect.enableRGB();
    kinect.alternativeViewPointDepthToImage();
    bImage = loadImage("area51small.jpg");
    tracking = false;
    
}

void draw()
{
    image(bImage,0,0);
    kinect.update();

    if (tracking)
    {
        userMap = kinect.getUsersPixels(SimpleOpenNI.USERS_ALL);
        
        PImage rgbImage = kinect.rgbImage();
        rgbImage.loadPixels();

        loadPixels();
        for (int i=0; i<userMap.length; i+=1)
        {
            if (userMap[i] !=0)
                pixels[i] = rgbImage.pixels[i];
        }
        updatePixels();
    }
}

void onNewUser(int uID)
{
    userId = uID;
    tracking = true;
    println("tracking");
}

