//A graph showing the GDP of the ten poorest countries in the world/


float minGDP=100000000;
float maxGDP=-1000;
ArrayList<Country> c;
float GDP;
String countries;
float number;
int x1;
int x2;
int y1;
int y2;

void setup () {
  size(800, 800);
  x1=50;
  x2=width-2*x1;
  y1=50;
  y2=height-2*y1;
  c=new ArrayList<Country>();
  String[] country = loadStrings("GDP.txt");
  for (int i=country.length-10; i<country.length; i++) {
    String[] Part = split(country[i], "\t");
    GDP=float(Part[4].replace(",", ""));
    countries=Part[3];
    number=float(Part[1]);
    c.add(new Country(number, countries, GDP, 75*(i-(country.length-10))+75));
  }
  for (Country count: c){
    //count.calculate();
    count.display();
  }
  for (int i=0;i<c.size();i++){
    minGDP=Math.min(c.get(i).GDP,minGDP);
    maxGDP=Math.max(c.get(i).GDP,maxGDP);
  }
  println("MinGDP: $" + minGDP);
  println("MaxGDP: $" + maxGDP);
}
void draw(){
  stroke(0);
  fill(0);
  rect(50,650,800,10);
  rect(50,650,10,-700);
  textSize(10);
  text("Country", 400, 700);
  pushMatrix(); 
  rotate(-PI/2);
  text("GDP($)", -400, 15);
  popMatrix();
  for (int i=0; i<20; i++){
    text(100*i,25,650-50*i);
  }
  textSize(30);
  text("GDP of the ten poorest countries", 200, 100);
}

