class CadleObj extends AnimatedObject {

  float x;                    //PIVs
  float y;
  float s;                    //size of CadleObj
  int costume;                //used to switch between open and close mouth
  int chompTime;              //used to calculate times between costume change
  boolean goingRight;         
  
  CadleObj(float sze)        //Constructor w/ one Parameter to change size
  {
      x = random(width);
      y = random(height);
      s = sze/30.0;            //sze is between 30 and 50 dividing by 30
                              //keeps me from becoming HUGE
      costume = 1;            
      chompTime = millis();    //grabs current time from system clock
      goingRight = true;
  }

  void display()
  {
      pushStyle();        //Similar to pushMatrix, but for 
                          //fill, stroke, and other visual changes
      pushMatrix();
      translate(x,y);
      scale(s);
      smooth();
      noStroke();
      fill(255,255,0);
      
      if(!goingRight)
          rotate(PI);    //turn myself other direction, easy if I am a circle
      
      if(costume % 2 == 0)    //pick cosutme 
          ellipse(0,0,40,40);                    //closed mouth
      else
      {
           arc(0,0,40,40, 0+ PI/6, 2*PI - (PI / 3)+ PI/6);   //open mouth
      }
      
      popMatrix();    //return to orginal origin and rotation
      popStyle();        //reset fill color, stroke color, etc.
  }

 
  /** Advances the object's animation by one frame 
   *  Note: Implement only one of the move() functions, but NOT both.
   */
  void move() 
  {
      if( millis() - chompTime > 500)  //checks current time to last 
                                       //"chompTime", if 1/2 second (500 milliseconds)
                                       //passed, change costume and reset chompTime
      {
          costume++;
          chompTime = millis();
      }
      
      if(goingRight)    //which way to go!
          x = x+2;
      else
          x = x-2;
          
      if( x > width + 70)        // turn around if I hit edge
          goingRight = false;
      else if(x < -100)
          goingRight = true;
      
      
      
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
