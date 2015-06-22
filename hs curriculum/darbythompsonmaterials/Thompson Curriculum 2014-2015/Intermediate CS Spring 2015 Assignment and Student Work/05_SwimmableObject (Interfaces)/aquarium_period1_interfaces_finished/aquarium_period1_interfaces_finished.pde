

ArrayList<BasicFish> fishies;


void setup(){
  size(1200,1000);
  
  fishies = new ArrayList<BasicFish>();
  
  // load all sea creatures
  fishies.add(new ZachMazlishSeaCreature());
  /*fishies.add(new AdrianSeaCreature());
  fishies.add(new AlyaAhmedSeaCreature());  
  fishies.add(new CharlieOMaraSeaCreature());  
  fishies.add(new DevinOhlsonSeaCreature());
  fishies.add(new ErinPaigeSeaCreature());
  fishies.add(new GyorgyBrevnovSeaCreature());
  fishies.add(new JadeLintottSeaCreature());
  fishies.add(new JunhoKimLeeSeaCreature());
  fishies.add(new NeeknazAbariSeaCreature());
  fishies.add(new SolomonFaisonSeaCreature());*/
  
  
}

void draw(){
  background(88,181,250);
  
  // tell all sea creatures to swim 
  for (BasicFish fish : fishies){
    fish.swim();  
  }
 
  
  // tell all sea creatures to display

  for (BasicFish fish : fishies){
    fish.display();  
  }
 
  
}
