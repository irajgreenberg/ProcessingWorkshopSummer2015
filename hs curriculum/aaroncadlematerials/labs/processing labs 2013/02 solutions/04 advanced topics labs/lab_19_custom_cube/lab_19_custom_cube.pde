//Code example is taken from 
//Processing, Creative Coding and Computational Art
//Ira Greenberg
//ISBN 978-1-59059-617-3
//pg 616-623
//reproduction for educational purposes only

void setup()
{
    size(800,600, P3D);
}

void draw()
{
    background(0);
    translate(width/2,height/2);
    if(mousePressed)
        rotateY(frameCount * PI / 60);
    
    pushMatrix();
    translate(-50,-50);
    fill(255,0,0);
    box(100);
    popMatrix();
    
    pushMatrix();
    translate(50,-50);
    fill(0,255,0);
    box(100);
    popMatrix();
    
    pushMatrix();
    translate(-50,50);
    fill(255,255,0);
    box(100);
    popMatrix();
    
    pushMatrix();
    translate(50,50);
    fill(0,0,255);
    box(100);
    popMatrix();
}
