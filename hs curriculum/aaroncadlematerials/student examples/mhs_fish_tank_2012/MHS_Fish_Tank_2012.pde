PImage mhs;
ArrayList<AnimatedObject> objs = new ArrayList<AnimatedObject>();

int SAND_HEIGHT = 120;

void setup() {
  mhs = loadImage("martin2.jpg");
  size(mhs.width,mhs.height);
  smooth();


  AnimatedObject JB1 = new JamesBoydObj(mhs.width, mhs.height);
  objs.add(JB1);
  objs.add(new BakerObj((int)random(30,50),(int)random(30,50)));
  objs.add(new KyleObj());

    objs.add(new YourNameObj(random(21,50)));
    
  
  objs.add(new BrownObj(random(30,50))); 
  objs.add(new BrownObj()); 
  objs.add(new LelandObj(random(30,50)));
  objs.add(new NguyenL_ghoti());
   objs.add(new HawkinsObj());
   
//   OsmanObj o = new OsmanObj(width/2,height/2);
//  objs.add(o);

 ElansariObj a = new ElansariObj(3,3,3.0);
 objs.add(a);
  
}


//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//DO NOT CHANGE CODE BELOW!!!!!!!
//EVER. PERIOD. END OF STORY.
void draw() {

  drawTankBackground();                    
 
  PVector[] locations = new PVector[objs.size()];
  for (int i=0; i<objs.size(); i++) {
      AnimatedObject obj = objs.get(i);
      locations[i] = new PVector(obj.getX(), obj.getY());
  }

  for (AnimatedObject ao: objs) {
      pushStyle();
      ao.display();
      popStyle();
      ao.move(locations);
      resetMatrix();           
      
    }
  
}

void drawTankBackground() {
    
  rectMode(CORNER);
  tint(0,130,237);
  image(mhs,0,0);
  //background(50, 50, 255);
  color topColor = color(168, 168, 50);
  color bottomColor = color(68,68,0);
  float rDiff = red(topColor) - red(bottomColor);
  float gDiff = green(topColor) - green(bottomColor);
  float bDiff = blue(topColor) - blue(bottomColor);
  rDiff /= SAND_HEIGHT;
  gDiff /= SAND_HEIGHT;
  bDiff /= SAND_HEIGHT;
  for(int i =0; i<SAND_HEIGHT; i++)
  {
      stroke(red(topColor)-i*rDiff,green(topColor)-i*gDiff, blue(topColor)-i*bDiff);
      line(0, height-SAND_HEIGHT+i, width, height-SAND_HEIGHT+i);
  }
//  rect(0, height-SAND_HEIGHT, width, SAND_HEIGHT);    //sandy bottom
  //castle
  
//  stroke (0);
//  strokeWeight (1);
//  fill (142, 137, 137,200);
//  rectMode (CORNER);
//  //botton part of castle
//  rect (10, 390-80, 200, 170);
//  //middle part of castle
//  rect (30, 300-80, 160, 90);
//  //top part of castle
//  rect (50, 250-80, 120, 50);
//  //castle flag
//  strokeWeight (2);
//  line (110, 250-80, 110, 210-80);
//  fill (255, 0, 0,127);
//  triangle (110, 210-80, 110, 230-80, 130, 220-80);
//  //castle door
//  noStroke ();
//  fill (109, 190, 250,127);
//  rect (90, 490-80, 40, 70);
//  ellipseMode (CENTER);
//  arc (110, 490-80, 40, 40,PI,2*PI);
//  //castle windows
//  stroke (0);
//  rect (130, 330-80, 30, 30);
//  line (145, 330-80, 145, 360-80);
//  line (130, 345-80, 160, 345-80); 
//  rect (60, 330-80, 30, 30);
//  line (75, 330-80, 75, 360-80);
//  line (60, 345-80, 90, 345-80);
}


