class Player extends SquareThing {

  //this one is un poco mucho complicado
  private int jumpSpeed;//this will store the constant 14 pixels/frame starting jump speed
  private boolean ground;//keeps track of if the player is floored or not
  private float keepJump;//and this will update constantly to be the actual specific jump speed for that frame
  private PImage rightPic;
  private PImage leftPic;
  private PImage currentPic;
  public int lives;
  public int score;
  public int pepes;

  public Player() {
    x=width/2;
    y=height-100;
    wide=30;
    tall=60;
    jumpSpeed=14;
    ground=false;
    score=0;
    pepes=0;
    lives=3;
    rightPic=loadImage("gnome1.png");
    leftPic=loadImage("gnome2.png");
    currentPic=rightPic;
  }

  public void jump() {
    if (ground) {//ONLY activates if player is on the ground (or platform)
      keepJump=jumpSpeed;
      ground=false;
    }
  }

  public void getHit() {
    keepJump=8;//if player hits enemy, they get bounced a little bit
    ground=false;
    lives=lives-1;//and lose a life
  }

  public void bounce() {
    keepJump=10;//this is if the player jumps on top of an enemy, and they bounuce off
    ground=false;
  }

  public void move(float grav) {

    if (!ground) {//if player is in the air, they either continue going up, or fall, depending on how far they are in their jump
      y=int(y-keepJump);
      keepJump=keepJump-grav;//keepJump gets lowered by a small amount over time
    }
    if (y-tall/2<=0) {
      bump(1);//if the player hits the ceiling, they get bumped
    }
  }

  public void land(int spot) {
    ground=true;
    y=spot-tall/2;//when the player lands, they could be 3 pixels or so "sunk" into the platform, this will correct their position
  }

  public void drop() {
    ground=false;  //this starts the player falling
    keepJump=-0.8;
  }

  public void bump(int spot) {
    keepJump=-0.8;//this is the "head-hitting" feature, which also needs to correct the y position, as above
    y=spot+tall/2;
  }


  public void changeDirection(int direction) {
    //way=direction;
    if (direction==1) {
      currentPic=rightPic;//makes the player sprite flip back and forth
    }
    if (direction==-1) {
      currentPic=leftPic;
    }
  }


  public void display() {
    imageMode(CENTER);
    image(currentPic, x, y);
  }

  public void addScore(int amount) {//adds an amount of score
    score=score+amount;
  }

  public void addPepe() {//adds a pepe
    pepes++;
  }

  public void reset() {
    x=width/2;//resets the players stats after death or at the beginning of a level
    y=height-100;
    wide=30;
    tall=60;
    pepes=0;
    ground=false;
    currentPic=rightPic;
    drop();
    lives=3;
  }

  public boolean hitBottom() {
    if (y-tall/2>=height) {//returns true if player has fallen off the screen
      return true;
    }
    return false;
  }
}

