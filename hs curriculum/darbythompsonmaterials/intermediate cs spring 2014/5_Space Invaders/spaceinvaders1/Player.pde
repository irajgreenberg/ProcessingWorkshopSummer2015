class Player{
  
  PVector position; // top left corner
  int w=100;
  int h=50;
  float speed=0;
 
  Player(float centerx, float centery){
   position = new PVector(centerx-w/2,centery-h/2);
  }
  
  void moveLeft(){
   speed=-1;
  }
  
  void moveRight(){
    speed=1;
  }
  
  void stop(){
   speed=0; 
  }
  
  void update(){
    position.x += speed;
    if(position.x>width-w){
      position.x=width-w;
    }
    if(position.x<0){
      position.x=0;
    }
  }
 
 void display(){
  fill(0,255,0);
  rect(position.x, position.y, w, h);
 } 
  
  
}
