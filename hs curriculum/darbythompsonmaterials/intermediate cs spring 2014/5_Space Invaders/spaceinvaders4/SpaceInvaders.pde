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
    int b=0;
    while(b<bullets.size()){
      bullets.get(b).update();
      if(bullets.get(b).position.y<0){
        bullets.remove(b);
      } else {
        b++;
      }
    } 
    b=0;
    for(Alien a : aliens){
      a.update();
      if(a.position.x<0 || a.position.x>width-a.w){
        b++;
      }
    }
    if(b>0){ // hit a wall
      for(Alien a : aliens){
        a.switchDirection();
        a.update();
      }
    }
    b=0;
    while(b<bullets.size()-1){
      int a=0;
      while(a<aliens.size()){
       if(collide(bullets.get(b), aliens.get(a))){
         bullets.remove(b);
         aliens.remove(a);
         b--;
         break; 
       } else {
        a++; 
       }
      }
      b++;
    }
    
    
  }
  
  boolean collide(Bullet b, Alien a){
    if(b.position.x>=a.position.x && b.position.x+b.w<=a.position.x+a.w && b.position.y>=a.position.y && b.position.y+b.h<=a.position.y+a.h ){
      return true;
    }
    return false;
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
