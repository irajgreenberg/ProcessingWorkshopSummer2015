class Data {
 //properties */
  int deaths;
  int year;
  int order;
  int r;
  int g;
  int b;
 //constructors */
 Data(int d, int y, int xpos) {
  deaths = d;
  year = y;
  order = xpos;
   b = 0;
   g = 0;
 }
 
 //abilities
 void display() {
   fill(r,g,b);
   ellipse(width/24 * order, height/2, deaths/50,deaths/50);
   fill(255);
   text(deaths + " deaths",width*0.4,height/8);
   textSize(24);
   fill(255);
   text(year, width*0.4, height/8 + 50);
 //
  
}

 void display2() {
   fill(r,g,b);
   ellipse(width/24 * order, height/2, deaths/50,deaths/50);
   
 //
  
}
}
