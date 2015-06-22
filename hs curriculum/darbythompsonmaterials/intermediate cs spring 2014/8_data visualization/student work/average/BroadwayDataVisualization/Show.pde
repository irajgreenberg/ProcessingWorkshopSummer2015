class Show {

  String name;
  float avgTicket;
  String avgTikt;
  String highTicket; 
  int perf;
  float attendance; //popularity red to blue
  int x;
  int y;
  int rad;
  int r;
  int g;
  int b;
  

  Show (String nam, float avtkt, String avgtkt, String htkt, int prf, float atn) {
    name = nam;
    avgTicket = avtkt;
    avgTikt = avgtkt;
    highTicket = htkt;
    perf = prf;
    attendance = atn;
    rad = round(avgTicket*.73);
    x = int(random(10, width-2*rad));
    y = int(random(10, height-2*rad));
    r = int((attendance-40)/68*255);
    b = int(10/(attendance-68)*255);
  }

  void draw(){
    fill(r, g, b);
    rect(x, y, rad, rad);
    fill(0);
    stroke(0);
    text(name, x, y, rad*1.5, rad*1.5);
    text(highTicket + "      " + avgTikt, x, float(y-15));
 
  }
}

