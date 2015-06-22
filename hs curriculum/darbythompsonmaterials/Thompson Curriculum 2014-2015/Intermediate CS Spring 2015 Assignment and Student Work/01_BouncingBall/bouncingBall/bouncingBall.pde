Ball b;

void setup(){
  size(800,800);
  b  = new Ball();
}

void draw(){
  background(255);
  
  b.move();
  b.display();
  
}
