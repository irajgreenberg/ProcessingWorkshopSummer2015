Country[] countries;
int x;
int y;

//NO COLLISION DETECTION!

void setup() {

  size(1105, 726);
  String[] oil= loadStrings("OilProduction.txt");
  countries=new Country[oil.length];
  for (int i=0; i<oil.length; i++) {
    String[] pieces= split(oil[i], "\t");
    x=(int)random(100,900);
    y=(int)random(100,900);
    countries[i]=new Country(/*50*i*/(int)random(100,1000), (int)random(200,600)/*i*60+60*/, pieces[1], int(pieces[2].replace(",","")), i*7);
    for (int j=0; j>i; j++) {
    }
    println("Names: " +countries[i].name+ " Barrels: " +countries[i].barrels); 
  }
  println("Data Loaded: " +oil.length +" entries.");
}

void draw() {
  PImage img;
  img=loadImage("http://www.arb.ca.gov/cc/oil-gas/images/oil%20pump%20sunset.jpg");
  background(img);
  for (int i=0; i<countries.length; i++) {
   countries[i].draw();
  }
  textSize(60);
  fill(255);
  text("Oil Production in bpd by country", 75, 75);
  }


