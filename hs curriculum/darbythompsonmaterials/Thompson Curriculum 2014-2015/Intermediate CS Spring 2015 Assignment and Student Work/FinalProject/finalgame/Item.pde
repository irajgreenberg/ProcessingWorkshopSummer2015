class Item extends BasicFlyingObject{
  
  Item(int startx, int starty){
  x=startx;
  y=starty;
  speedx=0;
  w=treasure.width;
  h=treasure.height;
    
  }
  
  void update(){
   x=x+speedx;
    
  }     
  
  void display(){
    image(treasure,x,y);
    
  }
  
  
  
}
