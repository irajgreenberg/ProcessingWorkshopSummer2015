class SpaceInvaders{
  
  Player p;
  ArrayList<Bullet> bullets;
 
  SpaceInvaders(){
    p = new Player(width/2, height-150);
    bullets = new ArrayList();
  }
 
 
  void update(){
    p.update();
    int i=0;
    while(i<bullets.size()){
      bullets.get(i).update();
      if(bullets.get(i).position.y<0){
        bullets.remove(i);
      } else {
        i++;
      }
    }    
  }
  
  void action(char k){
    if (k=='d'){
      p.moveRight();
    } else if(k=='a'){
      p.moveLeft();
    } else if(k=='s'){
        p.stop(); 
    } else if(k==' '){
      bullets.add(new Bullet(p.position.x+p.w/2, p.position.y-p.h/2)); 
    }
    
  }
  
  void display(){
    p.display();
    for(Bullet b : bullets){
      b.display();
    }
  }
  
}
