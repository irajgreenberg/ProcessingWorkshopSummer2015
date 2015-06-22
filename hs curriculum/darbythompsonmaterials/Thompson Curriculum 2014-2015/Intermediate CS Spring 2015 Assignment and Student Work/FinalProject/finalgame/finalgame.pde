//final project
//April 28, 2015

GameManager game;
PImage treasure;
PImage lava;
PImage bomb;
PImage seaweed;
void setup(){
  size(1000,800);
  game=new GameManager();
  treasure=loadImage("ice_cream_cone_neopolitan_sprinkles_cherry.png"); 
 bomb=loadImage("bomb-44.png");
 lava=loadImage("solidifying-lava-seamless-texture-background-image-red-hot-32318615.jpg");
 seaweed=loadImage("seaweed.jpg");
}



void draw(){
  if(game.nextlevel==true){
   background(198,4,56); 
   }
   
   else{
  background(86,199,242);
   }
  game.update();
  game.display();
  
}







