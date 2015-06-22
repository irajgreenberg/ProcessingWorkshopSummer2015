public interface Damageable {
  public float   health();
  public int     maxHealth();
  public float   percentHealth();
  public void    subtractHealth(float amount);
  public void    addHealth(float amount);
  public boolean isAlive();
}

public abstract class DamageableCircle implements Damageable {
  float   health;
  int     maxHealth;
  boolean hasBeenKilled = false;

  int     timeAtLastDamage = -1;
  float   lastDamage = -1;

  int     timeAtLastHeal = -1;
  float   lastHeal = -1;

  public DamageableCircle(int maxHP) {
    health = maxHealth = maxHP;
    hasBeenKilled = false;

    timeAtLastDamage = -1;
    lastDamage = -1;
  }

  public float health() {
    return health;
  }

  public int maxHealth() {
    return maxHealth;
  }

  //value from 0.0f to 1.0f
  public float percentHealth() {
    return health()/maxHealth();
  }

  public boolean isAlive() {
    return !hasBeenKilled;
  }

  public void subtractHealth(float amount) {
    health = max(health-amount, 0);
    if (health<=0) hasBeenKilled = true;

    timeAtLastDamage = millis();
    lastDamage = amount;
  }

  public void addHealth(float amount) {
    health = min(health+amount, maxHealth);

    timeAtLastHeal = millis();
    lastHeal = amount;
  }

  public abstract void display();

  //displayOutline() will show the outline of the circle.
  //takes two arguments: the color of the outline, and whether or not to glow red/green when hurt/healed
  void displayOutline(color stroke, boolean showRedness) {
    float redness = 0.0;
    float greenness = 0.0;
    if (showRedness) {
      if (hasBeenKilled) redness=1;
      else {
        float redStayingMillis = 5000;
        if (timeAtLastDamage > 0 && (millis()-timeAtLastDamage) < redStayingMillis)
          redness = 1.0-((millis()-timeAtLastDamage)/redStayingMillis);        //should be from 0 to 1
        else {
          redness = 0;
          if (timeAtLastHeal > 0 && (millis()-timeAtLastHeal) < redStayingMillis)
            greenness = 1.0-((millis()-timeAtLastHeal)/redStayingMillis);        //should be from 0 to 1
        }
      }
    }    
    noFill();

    stroke(stroke);
    strokeWeight(1);
    ellipse(loc().x, loc().y, maxHealth(), maxHealth());

    stroke(255, 0, 0, 255*redness);
    strokeWeight(1+redness*5);
    ellipse(loc().x, loc().y, maxHealth(), maxHealth());

    stroke(0, 0, 255, 255*greenness);
    strokeWeight(1+greenness*5);
    ellipse(loc().x, loc().y, maxHealth(), maxHealth());
  }

  //displayCenter() will show the center of the circle.
  //takes two arguments: the color of the fill, and whether or not to turn read as health decreases
  void displayCenter(color fill, boolean showHealthiness) {
    noStroke();

    fill(fill);
    if (health() > 0) {
      ellipse(loc().x, loc().y, health(), health());
    }
    else {
      ellipse(loc().x, loc().y, maxHealth(), maxHealth());
    }

    if (showHealthiness) {
      fill(255, 0, 0, 127*(1-percentHealth()));
      ellipse(loc().x, loc().y, health(), health());
    }
  }

  //returns the location of the object
  public abstract PVector loc();

  //does something every frame; can be nothing
  public abstract void act();
}

