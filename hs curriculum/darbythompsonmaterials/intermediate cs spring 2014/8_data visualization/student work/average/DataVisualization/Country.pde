class Country {
 String name;
 int barrels;
 int x;
 int y;
 int c;
 int h;
 float w;
 Country(int xx,int yy, String a, int b, int cc) {
   x=xx;
   y=yy;
   name=a;
   barrels=b;
   c=cc;
   h=barrels/100000;
   w=textWidth(name);
 }
 void draw() {
  fill(0+c,0,255-c);
  textSize(barrels/120000);
  text(""+ name, x,y);
 }
  
}
