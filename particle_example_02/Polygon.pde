class Polygon{
  
 //properties
 int sides;
 PVector loc;
 float radius;
 PVector spd = new PVector(1.5, 1.5);
 float rot;
 float rotSpd = 1.5;
 
 // cstrs
 Polygon(){
   this.sides = 3;
   this.loc = new PVector();
   this.radius = 1;
 }
 
 Polygon(int sides, PVector loc, float radius){
   this.sides = sides;
   this.loc = loc;
   this.radius = radius;
 }
 
 void move(){
   loc.add(spd);
 }
 
 void polyRotate(){
   rot += radians(rotSpd);
 }
 
 
 // methods
 void display(){
   // real time calculation
   float theta = 0.0;
   float x = 0.0;
   float y = 0.0;
   pushMatrix();
   translate(loc.x, loc.y);
   rotate(rot);
   beginShape();
   for(int i=0; i<sides; i++){
     x = cos(theta)*radius;
     y = sin(theta)*radius;
     vertex(x, y);
     theta += TWO_PI/sides;
   }
   endShape(CLOSE);
   popMatrix();
 }
 
 // getters/setters
  
  
}
