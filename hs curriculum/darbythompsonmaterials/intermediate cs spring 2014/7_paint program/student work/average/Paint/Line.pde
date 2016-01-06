class Line implements DrawableObject{
  int startx;
  int starty;
  int endx;
  int endy;
  int r;
  int g;
  int b;
  
  Line(int startxx, int startyy, int endxx, int endyy, int rr, int gg, int bb){
  startx=startxx;
  starty=startyy;
  endx=endxx;
  endy=endyy;
  r=rr;
  g=gg;
  b=bb;
  }
  void draw(){
    stroke(r, g, b);
    line(startx, starty, endx, endy);
  }
  void update(){
    endy=mouseY;
    endx=mouseX;
  }
}
