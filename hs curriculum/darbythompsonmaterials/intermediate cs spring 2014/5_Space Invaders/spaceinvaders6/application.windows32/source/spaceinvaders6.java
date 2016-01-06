import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class spaceinvaders6 extends PApplet {

SpaceInvaders game;

public void setup(){
  size(1000,1000);
  game = new SpaceInvaders();  
}


public void draw(){
  background(0);
  game.update();
  game.display();
}


public void keyPressed(){
  game.action(key); 
}
class Alien{
  
  PVector position;
  int w=81;
  int h=60;
  PVector speed= new PVector(1,50);
  int firingProbability=1;
  PImage img = loadImage("alienpic.jpg");
  
  Alien(float centerx, float centery){
    position = new PVector(centerx-w/2,centery-h/2);
  }
  
  public void switchDirection(){
    speed.x=-speed.x;
    position.y+=speed.y;
  }
  
  public void update(){
    position.x += speed.x;
  }
  
  public void display(){
    fill(255);
    //rect(position.x, position.y, w, h);
    image(img, position.x, position.y, w, h);
  }
  
  
  
}
class Bullet{
 
  PVector position;
  int w=2;
  int h=10;
  
  Bullet(float x, float y){
    position = new PVector(x,y);
  }
  
 public void update(){
   position.y -=1;
 }
  
 public void display(){
   fill(0,255,0);
   ellipse(position.x,position.y,w,h);
 } 
  
}

class Missile extends Bullet{
  
  Missile(float x, float y){
    super(x,y);
    
  }
  
 public void update(){
   position.y +=1;
 }
  
 public void display(){
   fill(255,0,0);
   ellipse(position.x,position.y,w,h);
 } 
  
}
class Player{
  
  PVector position; // top left corner
  int w=100;
  int h=50;
  float speed=0;
 
  Player(float centerx, float centery){
   position = new PVector(centerx-w/2,centery-h/2);
  }
  
  public void moveLeft(){
   speed=-1;
  }
  
  public void moveRight(){
    speed=1;
  }
  
  public void stop(){
   speed=0; 
  }
  
  public void update(){
    position.x += speed;
    if(position.x>width-w){
      position.x=width-w;
    }
    if(position.x<0){
      position.x=0;
    }
  }
 
 public void display(){
  fill(0,255,0);
  rect(position.x, position.y, w, h);
 } 
  
  
}
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
  
  public void setupAliens(){
    for(int i=50; i<width/2; i+=100){
      for(int j=50; j<400; j+=100){
        aliens.add(new Alien(i,j));
      }
    }
    
  }
 
 
  public void update(){
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
  
  public boolean collide(Bullet b, Alien a){
    if(b.position.x>=a.position.x && b.position.x+b.w<=a.position.x+a.w && b.position.y>=a.position.y && b.position.y+b.h<=a.position.y+a.h ){
      return true;
    }
    return false;
  }
  
  public boolean collide(Missile b, Player a){
    if(b.position.x>=a.position.x && b.position.x+b.w<=a.position.x+a.w && b.position.y>=a.position.y && b.position.y+b.h<=a.position.y+a.h ){
      return true;
    }
    return false;
  }
  
  public void action(char k){
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
  
  public void display(){
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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "spaceinvaders6" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
