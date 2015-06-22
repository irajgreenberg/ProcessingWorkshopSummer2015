class Square implements DrawableObject{
  int cornerx;
  int cornery;
  int sidex;
  int sidey;
  int r;
  int g;
  int b;
  
  Square(int cornerxx, int corneryy, int sidexx, int sideyy, int rr, int gg, int bb){
    cornerx=cornerxx;
    cornery=corneryy;
    sidex=sidexx;
    sidey=sideyy;
    r=rr;
    g=gg;
    b=bb;
  }
  
  void draw(){
    fill(r, g, b);
    stroke(r, g, b);
    rect(cornerx, cornery, sidex-cornerx, sidey-cornery);
  }
  
  void update(){
    sidex=mouseX;
    sidey=mouseY;
  }
}
