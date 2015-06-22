class SeaCreature{
  
  float size;
  float x;
  float y;
  float speedx;
  
  SeaCreature(){
    size = random(50, 100);
    x = random(100, width-size);
    y = random(200, height-size-200);
    speedx = random(1, size/10);
  }
  
  void swim(){
    x = x+speedx;
    y = y+sin(radians(x))*(size/12);
    
    if(x<=size/2 || x>=width-size/2){
      x = abs(x-width);
    }
   
    if(y<=size/2 || y>=height-size/2){
      y = abs(y-height);
    }
   
  }
  
  void display(){
    fill(255, 255, 0);
    rect(x,y,size,size);
    //dots
    ellipse(x+size/3.8, y+size/1.8, size/4, size/4);
    ellipse(x+size/1.2, y+size/2.3, size/5, size/5);
    ellipse(x+size/2, y+size/10, size/6, size/6);
    //nose
    arc(x+size/2, y+size/2.3, size/10, size/5, -PI, 0);
    //smile
    arc(x+size/2, y+size/2.5, size/2, size/5.5, 0, PI);
    //teeth
    fill(255);
    rect(x+size/2-size/10-size/60, y+size/2, size/10, size/10);
    rect(x+size/2+size/60, y+size/2, size/10, size/10);
    //eyes
    ellipse(x+size/3, y+size/4, size/4, size/4);
    ellipse(x+size*2/3, y+size/4, size/4, size/4);
    fill(0, 255, 255);
    ellipse(x+size/3, y+size/4, size/8, size/8);
    ellipse(x+size*2/3, y+size/4, size/8, size/8);
    fill(0);
    ellipse(x+size/3, y+size/4, size/16, size/16);
    ellipse(x+size*2/3, y+size/4, size/16, size/16);
    //pants
    fill(100, 0, 0);
    rect(x, y+size*2/3, size, size/3);
    fill(255, 0, 0);
    triangle(x+size/3, y+size*2/3, x+size/2, y+size*2/2.7, x+size/3, y+size*2/2.4);
    triangle(x+size/1.5, y+size*2/3, x+size/2, y+size*2/2.7, x+size/1.5, y+size*2/2.4);
    
  }
  
}
