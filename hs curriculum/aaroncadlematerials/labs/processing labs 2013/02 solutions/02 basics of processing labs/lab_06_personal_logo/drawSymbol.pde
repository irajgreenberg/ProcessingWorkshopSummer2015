void drawSymbol(float x, float y, float angle)
{
    pushMatrix();
    translate(x, y);
    rotate(angle);
 
    ellipseMode(CENTER);
    rectMode(CENTER);
    
    fill(255, 255, 0);
    noStroke();
    
    ellipse(0, 0, 100, 100);
    
    fill(255);
    stroke(0);
    ellipse(-25, -20, 15, 25);
    ellipse(25, -20, 15, 25);
    
    fill(0, 100, 255);
    noStroke();
    ellipse(-25, -14, 10, 10);
    ellipse(25, -14, 10, 10);
    
    fill(255);
    stroke(0);
    beginShape();
        vertex(18, 10);
        vertex(9, 30);
        vertex(-25, 20);
    endShape(CLOSE);
    
    popMatrix();
}
