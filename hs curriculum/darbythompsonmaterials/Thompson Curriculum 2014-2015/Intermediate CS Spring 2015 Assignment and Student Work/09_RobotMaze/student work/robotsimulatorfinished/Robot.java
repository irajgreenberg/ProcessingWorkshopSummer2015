import processing.core.*;

class Robot {

  static final int NORTH=0;
  static final int EAST=1;
  static final int SOUTH=2;
  static final int WEST=3;

  private PVector location;
  private int direction; 
  private Maze m;
  private PImage img;
  private boolean foundgoal;
  private PApplet parent;

  public Robot(PApplet p) {
    parent = p;
    m = new Maze(parent);
    location=m.getStartPos();
    direction = m.getStartDir();
    img = parent.loadImage("robot.gif");
    foundgoal=false;
  }
  public Robot(PApplet p, String mapfile) {
    parent = p;
    m = new Maze(mapfile, parent);
    location=m.getStartPos();
    direction = m.getStartDir();
    img = parent.loadImage("robot.gif");
    foundgoal=false;
  }

  public boolean isAtGoal() {
    return m.isAtGoal(location);
  }
  public boolean isAtStart() {
    return m.isAtStart(location);
  }

  public boolean hasFoundGoal() {
    return foundgoal;
  }

  public boolean canGoRight() {
    if (direction==NORTH) {
      return m.grid[(int)(location.x)][(int)(location.y)].E;
    } 
    else if (direction==SOUTH) {
      return m.grid[(int)(location.x)][(int)(location.y)].W;
    } 
    else if (direction==EAST) {
      return m.grid[(int)(location.x)][(int)(location.y)].S;
    } 
    else {
      return m.grid[(int)(location.x)][(int)(location.y)].N;
    }
  }

  public boolean canGoLeft() {
    if (direction==NORTH) {
      return m.grid[(int)(location.x)][(int)(location.y)].W;
    } 
    else if (direction==SOUTH) {
      return m.grid[(int)(location.x)][(int)(location.y)].E;
    } 
    else if (direction==EAST) {
      return m.grid[(int)(location.x)][(int)(location.y)].N;
    } 
    else {
      return m.grid[(int)(location.x)][(int)(location.y)].S;
    }
  }

  public boolean canGoStraight() {
    if (direction==NORTH) {
      return m.grid[(int)(location.x)][(int)(location.y)].N;
    } 
    else if (direction==SOUTH) {
      return m.grid[(int)(location.x)][(int)(location.y)].S;
    } 
    else if (direction==EAST) {
      return m.grid[(int)(location.x)][(int)(location.y)].E;
    } 
    else {
      return m.grid[(int)(location.x)][(int)(location.y)].W;
    }
  }

  public void turnLeft() {
    direction = (direction+3)%4;
  }

  public void turnRight() {
    direction = (direction+1)%4;
  }

  public void move() {
    if (canGoStraight()) {
      if (direction==NORTH) {
        location.y--;
      } 
      else if (direction==SOUTH) {
        location.y++;
      } 
      else if (direction==EAST) {
        location.x++;
      } 
      else {
        location.x--;
      }
    } 
    else {
      System.out.println("Error, you cannot move straight");
      parent.noLoop();
    }
    if (isAtGoal()) {
      foundgoal=true;
    }
  }

  public void draw() {
    parent.background(255);
    m.draw();
    parent.imageMode(parent.CENTER);
    parent.pushMatrix();
    parent.translate((float)(location.x*Cell.cellSize+Cell.cellSize*.5), (float)(location.y*Cell.cellSize+Cell.cellSize*.5));
    parent.rotate(direction*parent.HALF_PI);
    parent.image(img, 0, 0);
    parent.popMatrix();
    parent.textAlign(parent.CENTER);
    if (foundgoal) {
      parent.fill(0, 255, 0);
      parent.text("Found Goal: YES", parent.width/2, parent.height-20);
    } 
    else {
      parent.fill(255, 0, 0);
      parent.text("Found Goal: NO", parent.width/2, parent.height-20);
    }
  }
}

