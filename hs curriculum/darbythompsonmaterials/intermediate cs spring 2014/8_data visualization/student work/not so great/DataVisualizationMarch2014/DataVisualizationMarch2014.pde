/*
Data Visualization project March 2014
Raphael Cohen-Fuentes
*/ 

ArrayList<Country> countries;
int X1;
int Y1;
int X2;
int Y2;

void setup() {
  countries = new ArrayList();
  size(900,700);
  X1= 50;
  Y1= 50;
  X2= width-50;
  Y2= height -Y1;
  String[] lines = loadStrings("FrenchSpeakersData.txt");
  //people = new float[lines.length];
  //countries = new int[lines.length];
  for (int i=0; i<lines.length; i++) {
    String[] pieces = split(lines[i], "\t");
    Country c= new Country(pieces[1], pieces[4]);
    countries.add(c);
  }
}

void draw() {
  background(0);
  rectMode(CORNERS);
  fill(0);
  rect(X1, Y1, X2, Y2);
  fill(255);
  textSize(16);
  textAlign(CENTER);
  text("French Speaking Population by Country", width/2, Y1 -10);
  for (int i=0; i<countries.size(); i++){
    Country c = countries.get(i);
    text(c.name + " " +c.population, 250, 20*i+80);
  }
}
