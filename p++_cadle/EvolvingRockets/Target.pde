class Target
{
    PVector loc;
    float radius;
    
    Target(float xPos, float yPos, float r)
    {
        loc = new PVector(xPos, yPos);
        radius = r;
    }
    
    void render()
    {
        pushMatrix();
        pushStyle();
        
        noStroke();
        fill(200, 220, 255);
        translate(loc.x, loc.y);
        ellipseMode(CENTER);
        ellipse(0, 0, radius * 2, radius * 2);
        
        popStyle();
        popMatrix();
    }
}
