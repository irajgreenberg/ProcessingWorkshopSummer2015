final PVector GRAVITY = new PVector(0, 0.04);
final float DAMPENING = 0.999;

class TweetBall
{
    String user;
    String text;
    PVector loc;
    PVector vel;
    color c;
    color h;
    color t;
    float radius;

    TweetBall(String user, String text)
    {
        this.user = "@" + user;
        this.text = text;
        radius = 50 + (text.length() / 140.0 * 50.0);
        loc = new PVector(width / 2, height / 2);
        vel = new PVector(text.length() / 14 + 1, text.length() / 14 + 1);
        c = color(random(80, 255), random(80, 255),random(80, 255));
        h = color(constrain(red(c)*1.5, 0, 255), constrain(green(c)*1.5, 0, 255), constrain(blue(c)*1.5, 0, 255));
        float b = (red(c) + green(c) + blue(c)) / 3;
        t = (b > 100) ? color(0) : color(255);
    }

    void drawSelf()
    {
        vel.add(GRAVITY);
        loc.add(vel);

        loc.x = (loc.x + width) % width;
        
        if (loc.y > height - radius)
        {
            loc.y = height - radius;
            vel.y = -vel.y;
            vel.mult(0.9);
        }
        
        for (TweetBall o : tweets)
        {
            if (o != this && collide(o))
            {
                rebound(o);
            }
        }
        float mouseDist = dist(loc.x, loc.y, mouseX, mouseY);
        pushMatrix();
        pushStyle();
        translate(loc.x, loc.y);
        if (mouseDist > radius)
        {
            fill(c);
            noStroke();
            ellipse(0, 0, radius * 2, radius * 2);
        }
        else
        {
            fill(h);
            stroke(255);
            strokeWeight(2);
            ellipse(0, 0, radius * 2.2, radius * 2.2);
        }
        
        fill(t);
        stroke(t);
        if (mouseDist < radius)
        {
            rectMode(CENTER);
            text(text, 0, 0, radius * 1.60, radius * 1.60);
        }
        else
        {
            text(user, -(textWidth(user) / 2), 0);
        }
        popStyle();
        popMatrix();
    }
    
    boolean collide(TweetBall other)
    {
        return (loc.dist(other.loc) < radius + other.radius);
    }

    void rebound(TweetBall other)
    {
        PVector dn = PVector.sub(loc, other.loc);
        float dist = dn.mag();
        
        if (dist == 0) return;
        
        dn.normalize();
        PVector dt = new PVector(dn.y, -dn.x);
        
        PVector minTrans = PVector.mult(dn, (radius + other.radius - dist));
        loc.add(PVector.mult(minTrans, 0.5));
        other.loc.sub(PVector.mult(minTrans, 0.5));
        
        PVector v1n = PVector.mult(dn, vel.dot(dn));
        PVector v1t = PVector.mult(dt, vel.dot(dt));
        
        PVector v2n = PVector.mult(dn, other.vel.dot(dn));
        PVector v2t = PVector.mult(dt, other.vel.dot(dt));
        
        vel = PVector.add(v1t, PVector.mult(dn, PVector.mult(v2n, DAMPENING).mag()));
        other.vel = PVector.sub(v2t, PVector.mult(dn, PVector.mult(v1n, DAMPENING).mag()));
    }
}

