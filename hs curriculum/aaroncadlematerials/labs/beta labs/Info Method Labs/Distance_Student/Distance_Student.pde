PFont font;
float circleX;
float circleY;

void setup()
{
    size(1000,600);
    font = loadFont("AgencyFB-Bold-48.vlw");
    textFont(font,48);
    
    circleX = random(width);
    circleY = random(height);
    
    
}

void draw()
{
    background(0);
    
    fill(255);
    ellipse(circleX,circleY,10,10);
    
    stroke(255,0,0);
    line(circleX,circleY,mouseX,mouseY);
    
    
    //replace 0 with a call to your distance method
    float distance = 0;
    text(distance,mouseX,mouseY);
}

//write your distance method here





