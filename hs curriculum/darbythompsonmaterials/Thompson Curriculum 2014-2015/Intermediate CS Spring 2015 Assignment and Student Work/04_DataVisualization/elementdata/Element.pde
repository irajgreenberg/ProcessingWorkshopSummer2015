class Element {
  String name1;
  float size;
  double presence;
  float atomic;
  PVector epos;
  PVector ev;
  float radius;
  float theta;
  float velocity;
  Element(String name, float mass, double prevalence, int number, float xpos, float ypos) {
    epos= new PVector(0, 0);
    ev = new PVector(0, 0);
    name1 = name;
    size = mass;
    theta=random(0, 2*PI);
    ev.x=cos(theta)*velocity;
    ev.y=sin(theta)*velocity;
    presence = prevalence;
    atomic = number;
    epos.x=xpos;
    epos.y=ypos;
  }

  void move() {
    velocity=30/size;
    if (velocity>15){
      velocity=15;
    }
    //30 is mass*velocity constant ie each element will have the same amount of momentum, 20 Ns
    ev.x=cos(theta)*velocity;
    ev.y=sin(theta)*velocity;
    epos.add(ev);
  }

  void display() {
    fill(atomic/110*255, 0, 255-atomic/110*255, 60);
    ellipse(epos.x, epos.y, 2*radius, 2*radius);
  }
}

