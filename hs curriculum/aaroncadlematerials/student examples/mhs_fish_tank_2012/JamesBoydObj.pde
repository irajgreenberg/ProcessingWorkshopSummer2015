/** Good Enough for now */

class JamesBoydObj extends AnimatedObject
{
  private final int W;
  private final int H;
  private ArrayList<TeslaMig> Migs;
  private ArrayList<Mig> Ents;
  PFont font;
  
  JamesBoydObj(int hig, int wid) //Send in the bounds of the mhs fishtank
  {
    Migs = new ArrayList<TeslaMig>();
    Ents = new ArrayList<Mig>();
    this.H = hig;
    this.W = wid;
    font = loadFont("ComicSansMS-Bold-20.vlw"); 
    textFont(font);
    for(int i = 0; i < 10; i++)//--=
    {
      Mig t1 = (Mig) new TeslaMig(H, W, new PVector(-100, (random(W / 2) + W / 4)), 1, Ents);
      Mig t2 = (Mig) new TeslaMig(H, W, new PVector(H + 100,  (random(W / 2) + W / 4)), 2, Ents);
      Ents.add(t1);
      Ents.add(t2);
    }
    
    for( Mig m : Ents )
    {
      if( m instanceof TeslaMig)
      {
        Migs.add( (TeslaMig) m);
      }
    }
  }
  
  void display()
  {
    textFont(font); 
    for(Mig m : Ents)
    {
      m.display();
    }
  }
  
  void move()
  {
    for(int i = 0; i < Ents.size(); i++)
    {
      Mig m = Ents.get(i);
      m.move();
      calcAI();
      collision();
      
      if(m instanceof TeslaMig)
      {
        TeslaMig mt = (TeslaMig) m;
        if(mt.getHealth() <= 0 || mt.remove)
        {
          int fac = mt.getFaction();
          Ents.add(new Splosion(m.getPos().x, m.getPos().y, mt.getSze() * 5, 15));
          Ents.remove(i);
          
          for(int v = 0; v < Migs.size(); v++)
          {
            if(Migs.get(v).getHealth() <= 0)
            {
              Migs.remove(v);
              if(fac == 1)
              {
                Mig t1 = (Mig) new TeslaMig(H, W, new PVector(-100, random(W / 2) + W / 4), 1, Ents);
                Ents.add(t1);
                Migs.add( (TeslaMig) t1);
              }
              else if(fac == 2)
              {
                Mig t2 = (Mig) new TeslaMig(H, W, new PVector(H + 100,  random(W / 2) + W / 4), 2, Ents);
                Ents.add(t2);
                Migs.add( (TeslaMig) t2);
              }
            }
          }
        }
      }        
      if(m.remove)
      {
        Ents.remove(i);
      }        
    }
  }
  
  void calcAI()
  {
    for(TeslaMig m : Migs)
    {
      m.calcAI(Migs);
    }
  }
  
  void collision()
  {
    for(int i = 0; i < Ents.size(); i++)
    {
      for(int v = 0; v < Ents.size(); v++)
      {
        
        Mig e1 = Ents.get(i);
        Mig e2 = Ents.get(v);
        
        
        
        if(v != i)
        {
          //double distance = Math.pow((e1.getPos().x - e2.getPos().x), 2) + Math.pow((e1.getPos().y - e2.getPos().y), 2);
          if(PVector.dist(e1.getPos(), e2.getPos()) <= e1.getSze() + e2.getSze())
          {
            fill(255, 255, 255);
            if(e1 instanceof TeslaMig && e2 instanceof Shot)
            {
              if(e1.getID() != e2.getID())
              {
                if(((Shot) e2).speed > 5)
                {
                  ((TeslaMig) e1).hurt(10);
                  ((Shot)e2).impact((TeslaMig) e1, Ents);
                }
              }
            }
            if(e1 instanceof TeslaMig && e2 instanceof TeslaMig)
            {
              if(e1.getID() != e2.getID())
              {
                ///gps
                if(e1.getSze() + e2.getSze() >= e1.getPos().dist(e2.getPos()))
                {
                  float multi = .0005;
                  TeslaMig e1t = (TeslaMig) e1;
                  TeslaMig e2t = (TeslaMig) e2;
                  PVector difvect1 = PVector.sub(e1.getPos(), e2.getPos());
                  PVector difvect2 = PVector.sub(e2.getPos(), e1.getPos());
                  difvect1.mult(multi);
                  difvect2.mult(multi);
                  e1t.addvel.add(difvect1);
                  e2t.addvel.add(difvect2);
                }
              }
            }
          }
        }
      }
    }
  }
  
  int getX()
  {
    return Integer.MIN_VALUE;
  }
  
  int getY()
  {
    return Integer.MIN_VALUE;
  }
}

class Mig extends AnimatedObject
{
  protected int W;
  protected int H;
  protected int Sze;
  protected long ID;
  protected PVector pos;
  protected PVector vel;
  boolean remove;
  
  Mig()
  {
    
  }
  
  void display()
  {
    
  }
  
  int getSze()
  {
    return Sze;
  }
  
  long getID()
  {
    return ID;
  }
  
  PVector getPos()
  {
    return pos;
  }
  
  PVector getVel()
  {
    return vel;
  }
  
  int getSize()
  {
    return Sze;
  }
  
  int getX()
  {
    return (int) pos.x;
  }
  
  int getY()
  {
    return (int) pos.y;
  }
  
  void move()
  {
    
  }
}

class TeslaMig extends Mig
{
  final int NUM_SPARKS;
  final long ID;
  
  private long startTime;
  private float angle;
  private float angleS;
  private float angleB;
  private float protrusion;
  private float protrusionS;
  private float protrusionB;
  private float angleVel;
  private float angleVelS;
  private float angleVelB;
  private float health;
  private int faction;
  private color c;
  private TeslaMig target;
  private int shootFreq;
  boolean remove;
  PVector addvel;
  
  private boolean isInAction;
  private boolean enteringScreen;
  
  private PVector angoff;
  private PVector angoffo;
  private PVector angoffS;
  private PVector angoffB;
  private long lastShot;
  
  private ArrayList<Spark> sparks;
  private ArrayList<Mig> Ents;
  
  PFont font;
  
  TeslaMig(int w, int h, PVector pos, int faction, ArrayList<Mig> Ents) //--------------------------------------------TeslaMig class-----------------------------------
  {
    super();
    addvel = new PVector();
    ID = System.nanoTime();
    font = loadFont("ComicSansMS-Bold-20.vlw"); 
    textFont(font); 
    enteringScreen = true;
    startTime = millis();
    shootFreq = 1000;
    Sze = 10;// CSze
    health = 100;
    this.W = w - Sze;
    this.H = h - Sze;
    NUM_SPARKS = 5;
    this.faction = faction;
    isInAction = false;
    this.Ents = Ents;
    remove = false;
    lastShot = -1;
    switch(faction)
    {
      case 1 :
        angle = 0.0f;
        angleS = 0.0f;
        c = color(0, 0, 255);
        break;
      case 2 : 
        angle = PI;
        angleS = PI;
        c = color(255, 0, 0);
        break;
      default : 
        angle = 0.0f;
        angleS = 0.0f;
    };
    angleB = 0.0f;
    angleVel = 0.0f;
    angleVelS = 0.0f;
    angleVelB = 0.1f;
    this.pos = pos;
    vel = new PVector();
    angoff = new PVector();
    angoffS = new PVector();
    angoffB = new PVector();
    angoffo = new PVector();
    protrusion = 2.0f;
    protrusionS = 30.0f;
    protrusionB = 2.0f;
    sparks = new ArrayList<Spark>();
    for(int i = 0; i < NUM_SPARKS; i++)
    {
      sparks.add(new Spark( Sze, 100, color(random(55) + 200, random(55) + 200, random(55) + 200)));
    }
  }
  
  PVector getPos()
  {
    return pos;
  }
  
  long getID()
  {
    return ID;
  }
  
  boolean isEnteringScreen()
  {
    return enteringScreen;
  }  
  
  void display()
  {
    noStroke();
    

    //float x1, x2, x3, y1, y2, y3;
    //x1 = pos.x;
    //y1 = pos.y;
//    x2 = pos.x + (angoff.x * Sze) * -5;
//    y2 = pos.y + (angoffo.x * Sze) * -5;
//    x3 = pos.x + (angoff.x * Sze) * -5;
//    y3 = pos.y + (angoffo.x * Sze) * 5;//blong
    
    
    
    
    //fill(0, 20, 100);
    //triangle(x1, y1, x2, y2, x3, y3);  
    fill(c);
    ellipse(pos.x, pos.y, Sze*2, Sze*2);
    fill(0, 100, 155);
    ellipse(pos.x, pos.y, Sze * angoffB.x * protrusion, Sze * angoffB.y * protrusion);
    fill(0, 255, 0);
    ellipse(pos.x + angoffS.x * Sze, pos.y + angoffS.y * Sze, Sze, Sze);
    
    //text( pos.x + "  " + x2 + "  " + x3, pos.x, pos.y);
    //text( pos.y + "  " + y2 + "  " + y3, pos.x, pos.y + 20);
    
    for( Spark s : sparks )
    {
      s.display();
    }
    
  }
  
  void update()
  {
    if(pos.x < W && pos.x > Sze && pos.y < H && pos.y > Sze)
    {
      enteringScreen = false;
      if((millis() - startTime) % 100 == 0)
      {
        angleVel = random(.02) - .01;
        
      }
    }
    else
    {
      float multi = .01;
      float dampen = 50;
      boolean top = (pos.y <= Sze);
      boolean bottom = (pos.y >= H);
      boolean left = (pos.x <= Sze);
      boolean right = (pos.x >= W);
      if(!enteringScreen)
      {
        if(right)
        {
          addvel.add(new PVector((W - 50 - pos.x) * multi, 0));
          angleVel = (-TWO_PI - angle)/dampen;
        }
        else if(left)
        {
          addvel.add(new PVector((Sze + 50 - pos.x) * multi, 0));
          angleVel = (0 - angle)/dampen;
        }
        else if(bottom)
        {
          addvel.add(new PVector(0, (H - 50 - pos.y) * multi));
          angleVel = (-PI - angle)/dampen;
        }
        else if(top)
        {
          addvel.add(new PVector(0, (Sze + 50 - pos.y) * multi));
          angleVel = (PI - angle)/dampen;
        }
      }
      if(top && left || top && right || bottom && right || bottom && left)
      {
        hurt(100);
      }
    }
    
    if(isInAction)
    {
      
    }
    else
    {
      float dampen = 50;
      angleVelS = (angle - angleS)/dampen;
      if(angleVelS > (PI/dampen) || angleVelS < -(PI/dampen))
      {
        //angleVelS = (TWO_PI/dampen) - angleVelS;
        
      }
    }
    
    angoff.x = cos(angle);
    angoff.y = sin(angle);
    angoffo.x = cos(angle + HALF_PI);
    angoffo.y = sin(angle + HALF_PI);
    angoffS.x = cos(angleS);
    angoffS.y = sin(angleS);
    angoffB.x = cos(angleB);
    angoffB.y = sin(angleB);
    
    angle = angClamp(angle);
    angleS = angClamp(angleS);
    angleB = angClamp(angleB);
    angleVel = angClamp(angleVel);
    angleVelS = angClamp(angleVelS);
    angleVelB = angClamp(angleVelB);
    angleVel = 0; //Enable movement stuff
    angle += angleVel;
    angleS += angleVelS;
    angleB += angleVelB;
    
    vel.x = angoff.x * 5 / (Sze /2);
    vel.y = angoff.y * 5 / (Sze /2);
    pos.add(PVector.add(vel, addvel));
    addvel.mult(.5);
    
    for( Spark s : sparks )
    {
      if(!s.noMove || s.pos.dist(pos) > 100)
      {
        if(enteringScreen)
        {
          s.pos.x = pos.x + (random(Sze * 200) - (Sze * 100));
          s.pos.y = pos.y + (random(Sze * 200) - (Sze * 100));
        }
        s.pos.x = pos.x;
        s.pos.y = pos.y;
      }
      s.update();
    }
  }
  
  void calcAI(ArrayList<TeslaMig> Migs)
  {
    TeslaMig m;

    float cup = (float) Integer.MAX_VALUE;
    float dis = cup;
    
    if(isEnteringScreen())
    {
      return;
    }
    
    for( int i = 0; i < Migs.size(); i++ )
    {
      m = Migs.get(i);
      
      if(m.ID != this.ID && !m.isEnteringScreen())
      {
        if(m.getFaction() != this.faction)
        {
          dis = PVector.dist(pos, m.getPos());
          
          if(dis <= Sze * 50)
          {
            if(dis <= cup)
            {
              cup = dis;
              target = m;
            }
          }
        }
      }
    }
    
    if(target != null)
    {
      //TERMINATE
      if(!isInAction)
      {
        isInAction = true;
      }
      
      
      float angleBn = asin((target.getHeading().y - pos.y) / PVector.dist(pos, target.getHeading()));
      if(target.getPos().x > pos.x)//Begin-----------------------------------------------------------------------------------
      {
        angleS = angleBn;
        //angleVel = ((angleBn + HALF_PI) - angle)/50;
        if(angleBn <= 0)
        {
          //angleVel = ((angleBn - HALF_PI) - angle)/50;
          if(PVector.dist(target.getPos(), pos) < Sze * 20)
          {
            angleVel = (angleBn - angle)/50;
          }
          else if(PVector.dist(target.getPos(), pos) > Sze * 30)
          {
            angleVel = (angleBn - PI - angle)/50;
          }
        }
        else
        {
          //angleVel = ((angleBn - HALF_PI) - angle)/50;
          if(PVector.dist(target.getPos(), pos) < Sze * 20)
          {
            angleVel = (angleBn - PI - angle)/50;
          }
          else if(PVector.dist(target.getPos(), pos) > Sze * 30)
          {
            angleVel = (angleBn - angle)/50;
          }
        }
      }
      else if (target.getPos().x <= pos.x)
      {
        angleS = PI - angleBn;
        if(angleBn <= 0)
        {
          //angleVel = ((angleBn - HALF_PI) - angle)/50;
          if(PVector.dist(target.getPos(), pos) < Sze * 20)
          {
            angleVel = (angleBn - angle)/50;
          }
          else if(PVector.dist(target.getPos(), pos) > Sze * 30)
          {
            angleVel = (angleBn - PI - angle)/50;
          }
        }
        else
        {
          //angleVel = ((angleBn - HALF_PI) - angle)/50;
          if(PVector.dist(target.getPos(), pos) < Sze * 20)
          {
            angleVel = (angleBn - PI - angle)/50;
          }
          else if(PVector.dist(target.getPos(), pos) > Sze * 30)
          {
            angleVel = (angleBn - angle)/50;
          }
        }
      }//End-----------------------------------------------------------------------------------
      
      float dampen = 50;
      if(angleVel > (PI/dampen) || angleVel < -(PI/dampen))
      {
        //angleVel = angleVel - (TWO_PI/dampen);
      }
      
      if((millis() - lastShot) >= 1000 || lastShot == -1)//-=-=
      {
        shoot(target);
        lastShot = millis();
      }
      if(target.getHealth() <= 0 || PVector.dist(pos, target.getPos()) > Sze * 20)
      {
        target = null;
      }
    }
    else
    {
      if(isInAction)
      {
        isInAction = false;
      }
    }
  }
  
  void shoot(TeslaMig t)
  {
    addvel.add(PVector.mult(angoffS, -5));//fs
    Ents.add(new Shot(pos.x + angoffS.x * Sze, pos.y + angoffS.y * Sze, angleS + angleVelS, Sze, ID, Ents));
    //Splosion spl = new Splosion(pos.x + angoffS.x * Sze, pos.y + angoffS.y * Sze, 1, 20);
    //spl.type = 1;
    //Ents.add(spl);
  }
  
  float getHealth()
  {
    return health;
  }
  
  void hurt(int num)
  {
    health -= num;
  }
  
  int getFaction()
  {
    return faction;
  }
  
  float angClamp(float ang)
  {
//    float nang = ang;
//    if(ang > PI)
//    {
//      nang -= TWO_PI;
//    }
//    if(ang < -PI)
//    {
//      nang += TWO_PI;
//    }
    return ang;
  }
  
  void move()
  {
    update();
  }
    
  PVector getHeading()
  {
    PVector head = new PVector();
    head = PVector.add(pos, PVector.mult(vel, 5));
    return head;
  }
}


/**James's Other Classes*/

class Spark
{
  private float randP;
  private long startTime;
  private long sTime;
  boolean noMove;
  
  float rad;
  float ang;
  PVector angoff;
  PVector pos;
  boolean shouldDisp;
  int freq;
  color c;
  float randSize;
  
  Spark( float rad, int freq, color c )
  {
    startTime = millis() + (int) random(freq * 100);
    sTime = -1;
    noMove = false;
    this.rad = rad;
    this.freq = freq;
    this.c = c;
    randP = random(rad);
    ang = random(TWO_PI);
    pos = new PVector();
    angoff = new PVector();
    randSize = random(5);
  }
  
  void display()
  {
    fill(c);
    ellipse( pos.x + angoff.x * randP, pos.y + angoff.y * randP, randSize, randSize);
  }
  
  void update()
  {
    if(!noMove)
    {
      randP += .5;
    }
    else
    {
      randP += .1;
    }
    if(randP > rad && !noMove)
    {
      noMove = true;
      sTime = millis();
    }
    if(millis() - sTime >= 1000 || sTime == -1)
    {
      randP = random(rad);
      noMove = false;
      sTime = millis();
    }
    ang = angClamp(ang);
    //ang = random(TWO_PI);
    //ang += .1;
    angoff.x = cos(ang);
    angoff.y = sin(ang);
    pos.y -= .5;
  }
  
  float angClamp(float oang)
  {
    float nang = oang;
    if(oang > TWO_PI)
    {
      nang -= TWO_PI;
    }
    if(oang < 0)
    {
      nang += TWO_PI;
    }
    return nang;
  }
}

class Shot extends Mig
{
  final int NUM_SPARKS;
  PVector pos;
  PVector vel;
  PVector angoff;
  
  float ang;
  float angVel;
  float speed;
  float friction;
  int Sze;
  int dir;
  boolean done;
  SmokeTrail smokeT;
  ArrayList<Mig> Ents;
  ArrayList<Spark> sparks;
  
  long Owner;
  
  PFont font;
  
  Shot(float x, float y, float angle, int Sze, long ID, ArrayList<Mig> Ents)
  {
    NUM_SPARKS = 25;
    remove = false;
    speed = 20;
    dir = round(random(2) - 1);
    pos = new PVector();
    vel = new PVector();
    angoff = new PVector();
    friction = .97f;
    ang = angle;
    this.ID = ID;
    this.Sze = Sze/2;
    pos.x = x;
    pos.y = y;
    Sze = 5;
    done = false;
    this.Ents = Ents;
    
    sparks = new ArrayList<Spark>();
    for(int i = 0; i < NUM_SPARKS; i++)
    {
      sparks.add(new Spark( Sze, 100, color(random(55) + 200, random(55) + 200, random(55) + 200)));
    }//check
  }
  
  void display()
  {    
    fill(255, 255, 255);
    ellipse(pos.x, pos.y, Sze, Sze);
    for( Spark s : sparks )
    {
      s.display();
    }
  }
  
  void move()
  {
    super.move();
    update();
  }
  
  void update()
  {
    angoff.x = cos(ang);
    angoff.y = sin(ang);
    ang += angVel;
    vel.x = angoff.x * speed;
    vel.y = angoff.y * speed;
    speed *= friction;
    ang = angClamp(ang);
    pos.x += vel.x;
    pos.y += vel.y;
    
    for( Spark s : sparks )
    {
      if(!s.noMove || s.pos.dist(pos) > 200)
      {
        s.pos.x = pos.x;
        s.pos.y = pos.y;
      }
      s.update();
    }
    
    if(speed < 1)
    {
      remove = true;
    }
  }
  
  float angClamp(float oang)
  {
    float nang = oang;
    if(oang > TWO_PI)
    {
      nang -= TWO_PI;
    }
    if(oang < 0)
    {
      nang += TWO_PI;
    }
    return nang;
  }
  
  int getX()
  {
    return (int) pos.x;
  }
  
  int getY()
  {
    return (int) pos.y;
  }
  
  long getID()
  {
    return ID;
  }
  
  PVector getPos()
  {
    return pos;
  }
  int getSze()
  {
    return Sze;
  }
  void impact(TeslaMig other, ArrayList<Mig> Ents)
  {
    //heyguy
    if(!remove)
    {
      Ents.add(new Splosion(pos.x, pos.y, Sze * 1, 20));
    }
    remove = true;
  }
}

class Splosion extends Mig
{
  
  PVector pos;
  PVector vel;
  long startTime;
  int time;
  float rad;
  int c, a, r;
  int type;
  
  Splosion(float x, float y, float rad, int time)
  {
    pos = new PVector();
    vel = new PVector();
    startTime = millis();
    remove = false;
    pos.x = x;
    pos.y = y;
    this.time = time;
    this.rad = rad;
    c = 0;
    a = 255;
    Sze = 0;
    type = 0;
  }
  
  PVector getPos()
  {
    return pos;
  }
  
  void display()
  {
    noStroke();
    if(millis() - startTime < 500)
    {
      fill(255, 255, 255, 100);
      //ellipse(pos.x, pos.y, 10000, 10000);
    }
    
    float x1, y1;
    x1 = pos.x;
    y1 = pos.y;
    
    if(c < 255)
    {
      c += time;
    }
    if(a > 0)
    {
      a -= time;
    }
    if(r < rad)
    {
      r += time;
    }
    if(type == 0)
    {
      fill(c, c, c, a);
      ellipse(x1, y1, r, r * 2);
      ellipse(x1, y1, r * 2, r);
      fill(c, c, 0, a);
      ellipse(x1, y1, r, r);
      fill(c, 0, 0, a);
      ellipse(x1, y1, r, r);
    }
    else if(type == 1)
    {
      fill(255, 0, 0, a);
      ellipse(x1, y1, r/4, r/4);
      fill(255, 255, 0, a);
      ellipse(x1, y1, r/3, r/3); 
      ellipse(x1, y1, r, r / 5);
      ellipse(x1, y1, r / 5, r);
    }
    
    if(a <= 0)
    {
      remove = true;
    }
  }
  
  void move()
  {
    super.move();
    update();
  }
  
  void update()
  {
    pos.x += vel.x;
    pos.y += vel.y;
  }
  
  long getID()
  {
    return ID;
  }
  
  int getX()
  {
    return (int) pos.x;
  }
  
  int getY()
  {
    return (int) pos.y;
  }
}

class SmokeTrail extends Mig
{
  
  PVector pos;
  PVector vel;
  long startTime;
  int time;
  float rad;
  int c, a, r;
  Mig parent;
  int maxP;
  int numP;
  long tTime;
  ArrayList<Particle> particles;
  int NUM_PARTICLES;
  
  SmokeTrail(float x, float y, float rad, Mig parent)//gon
  {
    NUM_PARTICLES = 10;
    pos = new PVector(x, y);
    vel = new PVector();
    startTime = millis();
    remove = false;
    this.time = time;
    this.rad = rad;
    c = 0;
    a = 255;
    this.parent = parent;
    this.maxP = maxP;
    numP = 0;
    tTime = -1;
    Sze = 0;
    particles = new ArrayList<Particle>();
    for(int i = 0; i < NUM_PARTICLES; i++)
    {
      particles.add(new Particle(pos.x + random(rad*3), pos.y + random(rad*3), (int) (rad/(random(1)+1)), 10));//gh
    }
  }
  
  void display()
  {
    for( Particle p : particles )
    {
      p.display();
    }
  }
  
  void move()
  {
    super.move();
    update();
  }
  
  void update()
  {
    //pos.x += vel.x;
    //pos.y += vel.y;
    pos.x = parent.getPos().x;
    pos.y = parent.getPos().y;
    rad = parent.getSze();
    
    for( Particle p : particles )
    {
      if(p.pos.dist(pos) > rad * 20)
      {
        p.a = 255;
        p.pos = pos;
      }
      p.update();
    }
  }
  
  long getID()
  {
    return ID;
  }
  
  int getX()
  {
    return (int) pos.x;
  }
  
  int getY()
  {
    return (int) pos.y;
  }
}

class Particle
{
  private float randP;
  private long startTime;
  private long sTime;
  PVector vel;
  PVector pos;
  boolean shouldDisp;
  int freq;
  color c;
  double rise;
  int fade;
  int a;
  int Sze;
  long lastFade;
  long restartTime;
  boolean restart;
  int randval;
  
  Particle(float x, float y, int Sze, int fade)//gh
  {
    boolean restart = false;
    int randval = (int) random(100);
    lastFade = millis();
    restartTime = -1;
    pos = new PVector(x, y);
    vel = new PVector();
    this.Sze = Sze;
    this.fade = fade;
    a = 255;
  }
  
  void display()
  {
    fill(255, 255, 255, a);
    ellipse(pos.x, pos.y, Sze, Sze);//heyguy
  }
  
  void update()
  {
    vel.y += rise;
    if(vel.y >= 2)
    {
      vel.y = 2;
    }
    if((millis() - lastFade) >= 10 || lastFade == -1)//jj
    {
      a -= fade;
      lastFade = millis();
    }
    pos.add(vel);
  }
}
