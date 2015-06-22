Ball b;

void setup(){
  size(800,800);
  b= new Ball();
  b.x=(int)random(width);
  b.y=(int)random(height);
  b.speedX=4;
  b.speedY=3;
  b.radius=50;
}

void draw(){
  background(230,230,250);
  b.move();
  b.draw();
}
