class Ground extends BasicFlyingObject {


  Ground() {

    x=width+w;
    y=int(random(50, 730));
    w=125;
    h=20;
    speedx=int(random(-6, -1));
       
}

  void update() {
    x=x+speedx;
  }

  void display() {
    fill(234, 7, 79);
    stroke(234, 7, 79);
    rect(x, y, w, h);
  }
}

