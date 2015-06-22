SeaCreature bob;

void setup(){
  size(800,800);
  bob = new SeaCreature();

}

void draw(){
  background(0, 200, 200);
  bob.swim();
  bob.display();
}
