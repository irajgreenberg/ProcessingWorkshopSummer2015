class Player {

  PVector coor = new PVector (width/7, height-200); //sets coordinate of player
  int jump = 0; 
  int score = 0; //sets the score
  int lives = 3; //sets the lives
  PImage img = loadImage ("CommanderVideo.png"); //loads the charecter sprite
  PImage imgjump = loadImage ("CommanderVideoJumping.png");
  boolean inair; //for checking if the charecter is in the air
  boolean bullettime = false; //sets frame rate to normal

  void draw() {
    if (inair==false){
      image(img, coor.x, coor.y);
    }
    else{
      image(imgjump, coor.x, coor.y);
    }
  }

  void move() {
    coor.y=coor.y-jump; //makes the charecter jump
    if (coor.y<height-200) {
      jump--; //bring the charecter up
    }
    if (coor.y>height-200) {
      coor.y=height-200; //brings the charecter down
      inair=false; //lets the charecter jump after he jumps
    }
  }

  void action() {
    if (keyCode==SHIFT){
      bullettime=true; //sets bullettime to true which reduces the frame rate
    }
    if (keyCode==CONTROL){
      bullettime=false; //sets bullettime to false which sets the frame rate back to normal
    }
    if ((keyCode==UP || keyCode==' ') && inair==false && keyCode!=SHIFT) {
      jump=17; //makes the charecter jump
      inair=true;
    }
  }
}

