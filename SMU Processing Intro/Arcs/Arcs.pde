int radius;

void setup() {
size(200,200);
radius = width/2;
strokeWeight(5);
background(#C8E6F5);
noFill();
}

// It goes clockwise!
void draw() {
stroke(255);
line(0,height/2,150,50);
line(0,height/2,150,height-50);
stroke(0);
curve(0,height/2, 150,50,150,height-50,0,height/2);
}
