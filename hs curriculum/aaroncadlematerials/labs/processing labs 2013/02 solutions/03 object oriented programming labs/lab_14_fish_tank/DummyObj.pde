class DummyObj extends AnimatedObject {

  float x;
  float y;
  float s;
  
  DummyObj(float sze)
  {
      x = random(width);
      y = random(height);
      s = sze/30.0;
  }

  void display()
  {
      pushStyle();
      pushMatrix();
      translate(x,y);
      scale(s);
      smooth();
      noStroke();
      fill(250,250,250);
      ellipse(0,0,10,10);
      popMatrix();
      popStyle();
  }
  
  /** Advances the object's animation by one frame 
   *  Note: Implement only one of the move() functions, but NOT both.
   */
  void move() 
  {
      
  }

  /** Advances the object's animation by one frame.
   *  Note: Implement only one of the move() functions, but NOT both.
   *  @param allObjectsLocations an array of the locations of ALL objects in the environment
   */
  void move(PVector[] allObjectsLocations) { 
    move();
  }

  /** Getter for the object's x position 
   *  @return the object's x position (as measured from the center of the object)
   */
  int getX()
  {
      return (int)x;
  }
  

  /** Getter for the object's y position 
   *  @return the object's y position (as measured from the center of the object)
   */
  int getY()
  {
      return (int)y;
  }
}

