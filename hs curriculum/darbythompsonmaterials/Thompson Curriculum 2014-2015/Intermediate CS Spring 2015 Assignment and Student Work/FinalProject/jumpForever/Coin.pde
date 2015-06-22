class Coin extends SquareThing{
 
 //coins give you 100 points
 private int hoverCount;
 private int speed;
 private int way;
 private PImage pic;//this (and other things in general) should be static but processing is weird
 
 public Coin(int startX, int startY){
   x=startX;
   y=startY;
   wide=22;
   tall=22;
   pic=loadImage("dogecoin.png");
   speed=3;
 }
 
 public void display(){
   imageMode(CENTER);
   image(pic,x,y);//simple
 }
 
 public void move(){
   
   if(way==1){
     x=x-speed; //this is in every squarething except the player, it is what moves the environment
   }
   else if(way==-1){
     x=x+speed; 
   }
   hover();//the hovering effect:
 }
 
 private void hover(){
   if(hoverCount==8){
     y=y+1; 
   }
   else if(hoverCount==16){//constant up/down motion
     y=y+1; 
   }
   else if(hoverCount==24){
     y=y-1; 
   }
   else if(hoverCount==32){
     y=y-1; 
   }
   else if(hoverCount==40){
     y=y-1; 
   }
   else if(hoverCount==48){
     y=y-1; 
   }
   else if(hoverCount==56){
     y=y+1; 
   }
   else if(hoverCount==64){
     y=y+1; 
     hoverCount=0;
   }
   hoverCount++;
 }
 
 public void changeDirection(int direction){
   way=direction;//this tells the squarething which way it should be moving
 }
 
  
}
