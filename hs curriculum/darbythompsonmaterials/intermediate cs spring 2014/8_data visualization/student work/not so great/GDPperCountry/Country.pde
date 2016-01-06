class Country {
  float number;
  float GDP;
  String country;
  float x;
  float y=650;
  Country (float position, String name, float product, float startx) {
    country=name;
    GDP=product;
    number=position;
    x=startx;
  }
  void calculate() {
    println(country + ": $" + GDP);
  }
  void display (){
    fill(255,0,0);
    stroke(255,0,0);
    rect(x,y,20,(-1)*GDP/2);
    textSize(6);
    fill(0);
    text(country, x, 750);
    textSize(10);
    text("$"+GDP,x,height-GDP/2-170);
  }
}
