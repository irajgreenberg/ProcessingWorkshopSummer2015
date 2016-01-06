class SpaceInvaders{
  
  Player p;
  ArrayList<Bullet> bullets;
  ArrayList<Alien> aliens;
  ArrayList<Missile> missiles;
  String gameover="";
 
  SpaceInvaders(){
    p = new Player(width/2, height-150);
    bullets = new ArrayList();
    aliens = new ArrayList();
    missiles = new ArrayList();
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
    if(gameover ==""){
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
    while(b<missiles.size()){
      missiles.get(b).update();
      if(collide(missiles.get(b), p)){
        gameover = "You Lost!";
      } else if(missiles.get(b).position.y>height){
        missiles.remove(b);
      } else {
        b++;
      }
    } 
    b=0;
    for(Alien a : aliens){
      a.update();
      if(((int)random(5000))<a.firingProbability){
        missiles.add(new Missile(a.position.x+a.w/2, a.position.y+a.h/2)); 
      }
      if(a.position.x<0 || a.position.x>width-a.w){
        b++;
      }
      if(a.position.y+a.h>=p.position.y){
       gameover="You Lost!"; 
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
    
    if(aliens.size()==0){
      gameover="You Won!";
    }
    
    }
    
  }
  
  boolean collide(Bullet b, Alien a){
    if(b.position.x>=a.position.x && b.position.x+b.w<=a.position.x+a.w && b.position.y>=a.position.y && b.position.y+b.h<=a.position.y+a.h ){
      return true;
    }
    return false;
  }
  
  boolean collide(Missile b, Player a){
    if(b.position.x>=a.position.x && b.position.x+b.w<=a.position.x+a.w && b.position.y>=a.position.y && b.position.y+b.h<=a.position.y+a.h ){
      return true;
    }
    return false;
  }
  
  void action(char k){
    if(gameover==""){
      if (k=='d'){
        p.moveRight();
      } else if(k=='a'){
        p.moveLeft();
      } else if(k=='s'){
        p.stop(); 
      }else if(k==' '){
        bullets.add(new Bullet(p.position.x+p.w/2, p.position.y-p.h/2)); 
      }
    }
  }
  
  void display(){
    p.display();
    for(Bullet b : bullets){
      b.display();
    }
    for(Missile m : missiles){
      m.display();
    }
    for(Alien a : aliens){
      a.display();
    }
    fill(255,0,0);
    textAlign(CENTER);
    textSize(50);
    text(gameover, width/2,height/2);
  }
  
}
