class Block{
  
  PVector coor = new PVector (height, width-50); //sets the coordinate of a block
  int speed; //sets the speed of a block
  
  Block(int speed1){
    speed=speed1;
  }
  
  void draw() {
    stroke(255, 0, 0); //displays the block
    fill(255, 0, 0);
    rect(coor.x, coor.y, 50, 50);
  }

  void move() {
    coor.x=coor.x-speed; //moves the block
  }
  
}
