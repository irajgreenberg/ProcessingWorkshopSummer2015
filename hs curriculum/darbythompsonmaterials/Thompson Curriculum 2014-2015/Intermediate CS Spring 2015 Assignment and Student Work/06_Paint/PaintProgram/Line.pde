class Line implements Drawable {
  int x1;
  int y1;
  int x2;
  int y2;
  int r;
  int g;
  int b;

  Line(int x1a, int y1a, int r1, int g1, int b1) {
    x1=x1a;
    y1=y1a;
    x2=x1a;
    y2=y1a;
    r=r1;
    g=g1;
    b=b1;
  }
  
  void display(){
    stroke(r,g,b);
    strokeWeight(2);
    line(x1,y1,x2,y2);
  }
  
  void update(int a, int b){
    x2=a;
    y2=b;
  }
}

