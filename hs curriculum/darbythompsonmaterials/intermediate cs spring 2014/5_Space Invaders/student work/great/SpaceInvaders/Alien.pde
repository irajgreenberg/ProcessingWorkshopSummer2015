class Alien {

  float x;
  float y;
  float v;
  float xi;

  Alien(float startx, float starty, float startv) {
    x = startx;
    xi = startx;
    y = starty;
    v = startv;
  }

  void draw() {
    stroke(0, 255, 0);
    fill(0, 255, 0);
    beginShape();
    vertex(x+10,y);
    vertex(x+15,y);
    vertex(x+15,y+5);
    vertex(x+20,y+5);
    vertex(x+20,y+10);
    vertex(x+30,y+10);
    vertex(x+30,y+5);
    vertex(x+35,y+5);
    vertex(x+35,y);
    vertex(x+40,y);
    vertex(x+40,y);
    vertex(x+40,y+5);
    vertex(x+35,y+5);
    vertex(x+35,y+10);
    vertex(x+40,y+10);
    vertex(x+40,y+15);
    vertex(x+45,y+15);
    vertex(x+45,y+20);
    vertex(x+50,y+20);
    vertex(x+50,y+40);
    vertex(x+45,y+40);
    vertex(x+45,y+30);
    vertex(x+40,y+30);
    vertex(x+40,y+45);
    vertex(x+35,y+45);
    vertex(x+35,y+50);
    vertex(x+27.5,y+50);
    vertex(x+27.5,y+45);
    vertex(x+35,y+45);
    vertex(x+35,y+35);
    vertex(x+15,y+35);
    vertex(x+15,y+45);
    vertex(x+22.5,y+45);
    vertex(x+22.5,y+50);
    vertex(x+15,y+50);
    vertex(x+15,y+45);
    vertex(x+10,y+45);
    vertex(x+10,y+25);
    vertex(x+5,y+25);
    vertex(x+5,y+40);
    vertex(x,y+40);
    vertex(x,y+20);
    vertex(x+5,y+20);
    vertex(x+5,y+15);
    vertex(x+10,y+15);
    vertex(x+10,y+10);
    vertex(x+15,y+10);
    vertex(x+15,y+5);
    vertex(x+10,y+5);
    vertex(x+10,y);
    endShape();
    stroke(0);
    fill(0);
    rect(x+15,y+20,5,5);
    rect(x+30,y+20,5,5);
  }

  void move() {
    x=x+v;
  }
}

