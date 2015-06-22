class GyorgyBrevnovSeaCreature extends BasicFish{ 
  float x;
  float y;
  float speedx;
  float speedy; 
  int sizeFactor; 
  
  
  
  GyorgyBrevnovSeaCreature() { 
    
  sizeFactor = int(random(40, 80));
    x= int(random(sizeFactor, width-sizeFactor));
   y= int(random(sizeFactor, height- sizeFactor));  
    speedx = int(random(1,5)); 
    speedy= int(random(1,5)); 
    
    
    
  }
  
  GyorgyBrevnovSeaCreature( int startx, int starty) { 
    x = startx; 
    y= starty; 
    speedx= int(random(-5,5));
    speedy=  int(random(-5,5)); 
      sizeFactor = int(random(40, 80));

  }
  void swim(){
    x= x+speedx;
    y= y-speedy*cos(radians(speedy-x)); 
      if (x>width+200){
   
     x= int(random(0, width));
   y= int(random(-400, -200)); 
   speedx= int(random(1,5));
    speedy=  int(random(1,5)); 
     if (x<-100){
        x= int(random(0, width));
        y= int(random(height+200,height+300 )); 
        speedx= int(random(-5,-1));
    speedy=  int(random(-5,-1)); 
     }
        
    }
     if (y<-200-sizeFactor){
       y= int(random(0, height));
   x= int(random(-300, -100));
   speedx= int(random(1,5));
    speedy=  int(random(1,5)); 
   
      
    }
    if (y>height+200+sizeFactor){
       y= int(random(0, height));
   x= int(random(width+200, width+300));
   speedx= int(random(-5,-1));
    speedy=  int(random(-5,-1)); 
    }
  }
    
    void display () {
      noStroke();
      fill(255,20,147);
      triangle(x-sizeFactor, y,x+sizeFactor, y,x,y-sizeFactor*1.5);
      rect(x-sizeFactor/2,y,sizeFactor,sizeFactor*2);
      triangle(x-sizeFactor/2,y+sizeFactor*2,x-sizeFactor/1.5,y+sizeFactor*3.5,x-sizeFactor/2+sizeFactor/3,y+sizeFactor*2);
      triangle(x+sizeFactor/2,y+sizeFactor*2,x+sizeFactor/1.5,y+sizeFactor*3.5,x+sizeFactor/2-sizeFactor/3,y+sizeFactor*2);
      triangle(x+sizeFactor/2-sizeFactor/3,y+sizeFactor*2,x,y+sizeFactor*3.5,x-sizeFactor/2+sizeFactor/3,y+sizeFactor*2);
      
      fill(255,255,255);
       ellipse(x+8,y+sizeFactor,sizeFactor/3,sizeFactor/3);
      ellipse(x-8,y+sizeFactor,sizeFactor/3,sizeFactor/3);
      fill(0);
      ellipse(x+8,y+sizeFactor,sizeFactor/6,sizeFactor/6);
      ellipse(x-8,y+sizeFactor,sizeFactor/6,sizeFactor/6);
      fill(255,255,255);
      rect(x-8.5,y+sizeFactor*1.5,sizeFactor/3,sizeFactor/12); 
      fill(0,0,255);

    }
}
