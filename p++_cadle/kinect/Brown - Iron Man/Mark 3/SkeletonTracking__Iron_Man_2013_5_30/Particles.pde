

public abstract class Particle{
  PVector loc;
  int appearTime, disappearTime;
  
  public Particle(PVector l, int dTime){
    loc = l;
    disappearTime = dTime;
    appearTime = millis();
  }
  
  abstract void display();
  
  abstract void act();
  
  boolean isExpired(){
    return millis() > disappearTime;
  }
}

public class TextParticle extends Particle{
  String text;
  color fill;
  public TextParticle(PVector l, String s, color c){
    super(l, millis() + 3000);
    text=s;
    fill=c;
  }
  
  void display(){
    textAlign(CENTER,CENTER);
    textFont(menuScriptFont);
    strokeText(text, loc.x, loc.y, fill);
  }
  
  void act(){
    loc.y -= 5.0 / frameRate;
    fill = color( red(fill), green(fill), blue(fill), 255 - (255.0 * (millis() - appearTime) / (disappearTime - appearTime)) );
  }
}
