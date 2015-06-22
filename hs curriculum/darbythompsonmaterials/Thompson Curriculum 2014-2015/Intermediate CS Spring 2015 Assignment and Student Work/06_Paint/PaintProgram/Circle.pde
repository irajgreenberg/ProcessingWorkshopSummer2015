class Circle implements Drawable{
  
  int x;
  int y;
  float rad;
  float rad2;
  int r;
  int g;
  int b;
  int s;
  
  Circle(int x1,int y1,int r1,int g1, int b1, int s1){
    
    x=x1;
    y=y1;
    rad=0;
    r=r1;
    g=g1;
    b=b1;
    s=s1;
    
  }
  
  void display(){
    stroke(0);
    strokeWeight(s);
    fill(r,g,b);
    ellipse(x,y,2*rad,2*rad2);
  }
    
  void update(int a, int b){
    rad=dist(x,0,a,0);
    rad2=dist(0,y,0,b);
  }
  
}
