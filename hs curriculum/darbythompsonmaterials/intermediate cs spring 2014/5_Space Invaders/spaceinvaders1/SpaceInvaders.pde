class SpaceInvaders{
  
  Player p;
 
  SpaceInvaders(){
    p = new Player(width/2, height-150);
  }
 
 
  void update(){
    p.update();
  }
  
  void action(char k){
    if (k=='d'){
      p.moveRight();
    } else if(k=='a'){
      p.moveLeft();
    } else if(k=='s'){
        p.stop(); 
    }
    
  }
  
  void display(){
    p.display();
  }
  
}
