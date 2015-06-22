class Rectangle implements Drawable {

  int x;
  int y;
  int wid;
  int hite;
  int r;
  int g;
  int b;
  int s;

  Rectangle(int x1, int y1,int r1,int g1,int b1, int s1) {
    x=x1;
    y=y1;
    wid=0;
    hite=0;
    r=r1;
    g=g1;
    b=b1;
    s=s1;
  }

  void display() {
    stroke(0);
    strokeWeight(s);
    fill(r, g, b);
    rect(x, y, wid, hite);
  }
  
  void update(int a, int b){
    wid=a-x;
    hite=b-y;
  }
}

