class BrownObj extends AnimatedObject{
  PVector loc,vel;
  float spin;
  float size;
  float spinSpeed;
  
  BrownObj(){
    loc = new PVector(random(width),random(height-SAND_HEIGHT));
    vel = new PVector(random(2)-1,random(2)-1);
    spin=0.0;
    float temp = random(-1,1);
    spinSpeed=random(PI/3,PI*2/3)*(temp/abs(temp));
    size = 20;
  }
  
  BrownObj(float newSize){
    loc = new PVector(random(width),random(height-SAND_HEIGHT));
    vel = new PVector(random(2)-1,random(2)-1);
    size=constrain(newSize,10,height/3);
    spin=0.0;
    float temp = random(-1,1);
    spinSpeed=random(PI/3,PI*2/3)*(temp/abs(temp));
  }
  
  BrownObj(PVector theLoc, PVector theVel){
    loc=theLoc.get();
    vel=theVel.get();
    spin=0.0;
    size = 20;
    float temp = random(-1,1);
    spinSpeed=random(PI/3,PI*2/3)*(temp/abs(temp));
  }
  
  BrownObj(PVector theLoc, PVector theVel, float theSpin){
    loc=theLoc.get();
    vel=theVel.get();
    spin=0.0;
    size = 20;
    float temp = random(-1,1);
    spinSpeed=random(PI/3,PI*2/3)*(temp/abs(temp));
  }
  
  void display(){
    stroke(31,0,0);
    fill(255,127,127);
    ellipse(loc.x,loc.y,size,size);
    beginShape();
    for(int i = 0 ; i < 5 ; i++){
      PVector vertOut = PVector.add(loc,PVector.mult(new PVector(cos(spin+2*i*PI/5),sin(spin+2*i*PI/5)),size));
      PVector vertIn = PVector.add(loc,PVector.mult(new PVector(cos(spin+2*(i+.5)*PI/5),sin(spin+2*(i+.5)*PI/5)),size*2/5));
      vertex(vertOut.x,vertOut.y);
      vertex(vertIn.x,vertIn.y);
      
      ellipse(vertOut.x,vertOut.y,size*3/10,size*3/10);
    }
    vertex(loc.x+size*cos(spin),loc.y+size*sin(spin));
    endShape(CLOSE);
    
  }
  
  int getX(){
    return (int)loc.x;
  }
  
  int getY(){
    return (int)loc.y;
  }
  
  void move(){
    //System.out.println(vel);
    if(loc.y<size)               vel.set(vel.x,abs(vel.y),0);
    else if(loc.y>height-size-SAND_HEIGHT)   vel.set(vel.x,-abs(vel.y),0);
    else if(loc.x<size)          vel.set(abs(vel.x),vel.y,0);
    else if(loc.x>width-size)    vel.set(-abs(vel.x),vel.y,0);
    //System.out.println(vel);
    
    loc.add(vel);
    spin+=spinSpeed/frameRate;
  }
  
  void move(PVector[] locs){
    for(PVector v:locs){
      PVector diff = PVector.sub(this.loc,v);
      //System.out.println(loc+"\t"+v+"\t\t"+diff);
      int tolerance = (int)(size);
      if(diff.mag()>2 && diff.mag()<tolerance)
      {
        if(loc.y<v.y-tolerance)               vel.set(vel.x,abs(vel.y),0);
        else if(loc.y>v.y+tolerance)   vel.set(vel.x,-abs(vel.y),0);
        else if(loc.x<v.x-tolerance)          vel.set(abs(vel.x),vel.y,0);
        else if(loc.x>v.x+tolerance)    vel.set(-abs(vel.x),vel.y,0);
      }
      
    }
    
    move();
  }
}
