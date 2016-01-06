class GhostObj extends AnimatedObject {

  float x;
  float y;
  float s;
  int transparent;
  int costume;
  int chompTime;
  boolean goingRight;
  
  GhostObj(float sze)
  {
      x = random(width);
      y = random(height);
      s = sze/30.0;
      costume = 1;
      chompTime = millis();
      goingRight = true;
      transparent = 255;        //keeps track of how transparent I am.
  }

  void display()
  {
      pushStyle();
      pushMatrix();
      translate(x,y);
      scale(s);
      smooth();
      noStroke();
      fill(255,255,255,transparent);
      if(!goingRight)
          rotate(PI);
      
      if(costume % 2 == 0)
          ellipse(0,0,40,40);
      else
      {
           arc(0,0,40,40, 0+ PI/6, 2*PI - (PI / 3)+ PI/6);   
      }
      
      popMatrix();
      popStyle();
  }

 
  /** Advances the object's animation by one frame 
   *  Note: Implement only one of the move() functions, but NOT both.
   */
  void move() 
  {
      if( millis() - chompTime > 500)
      {
          costume++;
          chompTime = millis();
      }
      
      if(goingRight)
          x = x+2;
      else
          x = x-2;
          
      if( x > width + 70)
          goingRight = false;
      else if(x < -100)
          goingRight = true;
      
      
      
  }

  /** Advances the object's animation by one frame.
   *  Note: Implement only one of the move() functions, but NOT both.
   *  @param allObjectsLocations an array of the locations of ALL objects in the environment
   */
  void move(PVector[] allObjectsLocations) { 
    
      //allObjectsLocations is array of PVectors (or array of objects that contain a (x,y) location)
      int numClose = 0;
      for(PVector p: allObjectsLocations)  //go through all PVectors calling each one p
      {
          float distance = dist(this.x, this.y, p.x, p.y); //get distance between me (this.x, this.x)
                                                           //and current PVector (p.x,p.y)
          if(distance < 250)                        //see if I am within 250 pixels of other object)
              numClose++;
      }

        //SAME as CODE above just uses old for loop instead of advanced
//      for(int i=0; i<allObjectsLocation.length; i++)
//      {
//          PVector p = allObjectsLocation[i];
//          float distance = dist(this.x, this.y, p.x, p.y);
//          if(distance < 100)
//              numClose++;
//      }
      
      
      if(numClose > 5)                                //
          transparent = 50;                   //transparent
      else    
          transparent = 255;                //solid

      
      move();                //still call old move method to move to new spot
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
