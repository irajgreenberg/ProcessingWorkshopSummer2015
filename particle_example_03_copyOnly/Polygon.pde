class Polygon{
  
 //properties
 int sides;
 PVector loc;
 PVector spd = new PVector(1.2, 0);
 float radius;
 float gravity = .05;
 float friction = .95;
 float damping = .875;
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
   spd.y += gravity;
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
 
 void collide(){
    if(loc.x > width - radius) {
    loc.x = width - radius;
    spd.x *= -1;
  } else
  
  if(loc.x < radius) {
    loc.x = radius;
    spd.x *=  -1;
  }
  
  if(loc.y > height - radius) {
    loc.y = height - radius;
    spd.y = spd.y * -1;
    spd.y *= damping;
    spd.x *= friction;
  } else 
  
  if(loc.y < radius) {
    loc.y =radius;
    spd.y = spd.y * -1;
  }
 }
 
 // getters/setters
  
  
}
