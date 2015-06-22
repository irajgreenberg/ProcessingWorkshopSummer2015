class SpaceInvaders{
  
  Player p;
  ArrayList<Bullet> bullets;
  ArrayList<Alien> aliens;
 
  SpaceInvaders(){
    p = new Player(width/2, height-150);
    bullets = new ArrayList();
    aliens = new ArrayList();
    setupAliens();
  }
  
  void setupAliens(){
    for(int i=50; i<width/2; i+=100){
      for(int j=50; j<400; j+=100){
        aliens.add(new Alien(i,j));
      }
    }
    
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
    i=0;
    for(Alien a : aliens){
      a.update();
      if(a.position.x<0 || a.position.x>width-a.w){
        i++;
      }
    }
    if(i>0){ // hit a wall
      for(Alien a : aliens){
        a.switchDirection();
        a.update();
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
    for(Alien a : aliens){
      a.display();
    }
  }
  
}
