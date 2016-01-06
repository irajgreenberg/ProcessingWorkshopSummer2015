import SimpleOpenNI.*;

SimpleOpenNI  kinect;

void setup()
{
  size(640, 480);
  
  kinect = new SimpleOpenNI(this);  
  kinect.enableDepth();
 
}

void draw()
{
  // update the cam
  kinect.update();
  
  background(200,0,0);
  
  int closest = 8000;
  int closeX = 0;
  int closeY = 0;
  
  int[] depthValues = kinect.depthMap();
  
  for(int x = 0; x<640; x++)
    for(int y = 0; y <480; y++)
    {
      int spot = x + (y * 640);
      int depth = depthValues[spot];
      
      if(depth > 0 && depth < closest)
      {
        closest = depth;
        closeX = x;
        closeY = y;
      }
    }
    
  PImage depthImage = kinect.depthImage();
  image(depthImage,0,0);
  
  fill(255,0,0);
  ellipse(closeX,closeY,10,10);
}



