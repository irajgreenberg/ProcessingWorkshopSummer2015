class Goal extends SquareThing{//simple squarething
  public int pepes;
  private PImage pic;
  private int speed;
  private int way;
  
  public Goal(int startX, int startY){
    x=startX;
    y=startY;
    pic=loadImage("goal.png");
    wide=250;
    tall=300;
    speed=3;
    pepes=0;//should i make player or goal store number of pepes
    //both, both is good
    
  }
  
  public void move(){
    if(way==1){
     x=x-speed; 
   }
   else if(way==-1){
     x=x+speed; 
   }
  }
  
  public void display(){
    imageMode(CENTER);
    image(pic,x,y);
    ellipseMode(CENTER);
    fill(90,142,60);
    for(int i=0;i<pepes;i++){
      ellipse((x+14)+40*i,y-87,27,27);//this displays how many pepes have been collected
    }
  }
  
  public void changeDirection(int direction){
    way=direction;
  }
  
  public int howManyPepesLeft(){
    return 3-pepes;//this is asked by gamemanager to determine how many pepes need to be collected
  }
  
  public void setPepe(int num){
    pepes=num;//sets pepe value, because i was indecisive about who should store pepes
  }
  
}
