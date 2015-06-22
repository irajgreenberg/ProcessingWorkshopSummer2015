class CharlieOMaraSeaCreature extends BasicFish {
  float t=0;
  PVector s;
  PVector p;
  int cs=0;
  CharlieOMaraSeaCreature(){
    p = new PVector(random(60, width-60), random(60, height-60));
    s= new PVector(0, 0);
    if (random(1,2)>=1.5){
      s.x=random(1, 3);
    }
    else {
      s.x=random(-3, -1);
    }
    if (random(1,2)>=1.5){
      cs=1;
    }
  }
  
  void swim(){
    if (cs==0){
      s.y=sin(t)*5;
    }
    else {
      s.y=-sin(t)*5;
    }
    p.add(s);
    t+=.05;
  }
  
  void display(){
    stroke(0);
    ellipseMode(CENTER);
    rectMode(CORNER);
    fill(255, 0, 0);
    ellipse(p.x, p.y, 100, 20);
    if (s.x>0){
      triangle(p.x-50+10, p.y, p.x-50-10, p.y+10, p.x-50-10, p.y-10);
    }
    else {
      triangle(p.x+50-10, p.y, p.x+50+10, p.y-10, p.x+50+10, p.y+10);
    }
    if (p.x>width-60){
      s.x=-s.x;
      p.x=width-61;
    }
    else if (p.x<60){
      s.x=-s.x;
      p.x=61;
    }
    if (p.y>height){
      s.y=-s.y;
      p.y=0;
    }
    else if (p.y<0){
      s.y=-s.y;
      p.y=height;
    }
  }
  
}
