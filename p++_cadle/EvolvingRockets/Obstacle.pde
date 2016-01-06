
class Obstacle
{
    PVector loc;
    float oWidth;
    float oHeight;
    
    Obstacle(float xPos, float yPos, float w, float h)
    {
        loc = new PVector(xPos, yPos);
        oWidth = w;
        oHeight = h;
    }
    
    void render()
    {
        pushStyle();
        pushMatrix();
        
        translate(loc.x, loc.y);
        fill(127);
        noStroke();
        rect(0, 0, oWidth, oHeight);
        
        popStyle();
        popMatrix();
    }
    
    boolean contains(Rocket r)
    {
        return (r.loc.x > loc.x &&
                r.loc.x < loc.x + oWidth &&
                r.loc.y > loc.y &&
                r.loc.y < loc.y + oHeight);
    }
}
