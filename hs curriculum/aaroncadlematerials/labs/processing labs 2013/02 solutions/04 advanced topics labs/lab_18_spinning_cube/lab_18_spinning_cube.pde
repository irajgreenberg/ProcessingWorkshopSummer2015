//Code example is taken from 
//Processing, Creative Coding and Computational Art
//Ira Greenberg
//ISBN 978-1-59059-617-3
//pg 616-623
//reproduction for educational purposes only

void setup()
{
    size(400,400,P3D);
}

void draw()
{
    background(0);
    translate(width/2,height/2);
    rotateY(mouseX * 2*PI/height);
//    rotateX(mouseY * 2*PI/width);
//    rotateZ(frameCount* PI/120);
    box(150,150,150);

  
}


