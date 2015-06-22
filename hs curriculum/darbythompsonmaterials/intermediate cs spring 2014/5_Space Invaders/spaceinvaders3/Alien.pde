class Alien{
  
  PVector position;
  int w=80;
  int h=80;
  PVector speed= new PVector(1,50);
  
  Alien(float centerx, float centery){
    position = new PVector(centerx-w/2,centery-h/2);
  }
  
  void switchDirection(){
    speed.x=-speed.x;
    //position.y+=speed.y;
  }
  
  void update(){
    position.x += speed.x;
  }
  
  void display(){
    fill(255);
    rect(position.x, position.y, w, h);
  }
  
  
  
}
