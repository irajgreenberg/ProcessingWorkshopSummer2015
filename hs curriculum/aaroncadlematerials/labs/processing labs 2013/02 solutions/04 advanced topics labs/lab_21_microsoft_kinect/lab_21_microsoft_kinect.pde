//Code example is taken from 
//Making Things See
//Greg Borenstein
//ISBN 978-1-449-30707-3
//pg 78-79
//reproduction for educational purposes only

import SimpleOpenNI.*;

SimpleOpenNI  kinect;
float closeX = 0;
float closeY = 0;
  
float[] recentX = new float[5];
float[] recentY = new float[5];

int index = 0;

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

  
  int[] depthValues = kinect.depthMap();
  
  for(int x = 0; x<640; x++)
    for(int y = 0; y <480; y++)
    {
      int spot = x + (y * 640);
      int depth = depthValues[spot];
      
      if(depth > 0 && depth < closest)
      {
        closest = depth;
        recentX[index] = x;
        recentY[index] = y;
      }
    }
    
  index++;
  index %= recentX.length;
  
  float sumX =0;
  float sumY =0;
  for(int i =0;i<recentX.length;i++)
  {
      sumX +=recentX[i];
      sumY +=recentY[i];
  }
  
  closeX = sumX / recentX.length;
  closeY = sumY / recentY.length;
    
  PImage depthImage = kinect.depthImage();
  image(depthImage,0,0);
  
  fill(255,0,0);
  ellipse(closeX,closeY,10,10);
}



