//Sea Creature
//Jan 2015

SeaCreature a;

void setup(){
  size(500,500);
  a=new SeaCreature(250,250);  
}

void draw(){
  background(55,179,211);
  a.swim();
  a.display(); 
}
