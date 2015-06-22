class ErinPaigeSeaCreature extends BasicFish{

  float x;
  float y;
  float speedx;
  float speedy;


  ErinPaigeSeaCreature(){
    x = -100;
    y = -50;
    speedx = 1;
    speedy = 1;
  }


  void swim(){
    x=speedx+x;
    y=speedy+y;
    
    if (x>=width){
      background(0,128,255);
      x=int(random(-100,0));
      y=int(random(1,height-50));   
    }
    if (y>=height){
      background(0,128,255);
      x=int(random(1,width-100));
      y=int(random(-50,0));
      //x=int(random(1, width-100));
      //y=int(random(1,height-50)); 
    }
  }


  void display(){
    rectMode(CORNER);
    stroke(0);
    fill(255, 153, 204);
    rect(x+10, y+25, 5, 50);
    rect(x+30, y+25, 5, 60);
    rect(x+50, y+25, 5, 50);
    rect(x+70, y+25, 5, 60);
    rect(x+90, y+25, 5, 50);
    ellipseMode(CORNER);
    ellipse(x, y, 100, 50);
    fill(255,255,255);
    ellipse(x+20,y+15,20,20);
    ellipse(x+60,y+15,20,20);
    fill(0,0,0);
    ellipse(x+25,y+23,10,10);
    ellipse(x+65,y+23,10,10);
    ellipseMode(CENTER);
  }
}
