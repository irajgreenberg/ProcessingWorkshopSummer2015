int radius;
int xAnchor;
void setup() {
size(400,200);
radius = width/2;
strokeWeight(5);
background(#C8E6F5);
noFill();
xAnchor = 0;
}

// It goes clockwise!
void draw() {
stroke(255);
line(xAnchor,height/2,width-50,50);
line(xAnchor,height/2,width-50,height-50);
stroke(0);
curve(xAnchor,height/2, width-50,50,width-50,height-50,xAnchor,height/2);
xAnchor++;
if ( xAnchor > width-50) noLoop();
}
