class Cloud{
  
  PVector coor = new PVector (width+383, random(height-760, height-450)); //sets coordinate of cloud
  PImage img = loadImage ("Cloud.png"); //loads of image of cloud
  int speed; //sets speed of cloud
  
  Cloud(int speed1){
    speed=speed1;
  }
  
  void draw() {
    image(img, coor.x, coor.y); //displays cloud
  }
  
  void move(){
    coor.x=coor.x-speed; //moves cloud
  }
  
}
