import processing.core.*;
class Maze {

  Cell[][] grid;
  PVector start;
  PVector goal;
  private PApplet parent;

  public Maze(PApplet p) {
    this("map1.txt", p); // load default maze file
  }

  public Maze(int level, PApplet p) {
    this("map"+level+".txt", p); // load appropriate maze file
  }

  public Maze(String mazefile, PApplet p) { // load specified maze file
    parent=p;


    // load maze from file
    String[] file= parent.loadStrings(mazefile);
    // first line is the size of the grid
    // initialize empty maze
    String[] nums = parent.split(file[0], " ");
    grid = new Cell[Integer.parseInt(nums[0])][Integer.parseInt(nums[1])];
    nums = parent.split(file[1], " ");
    start=new PVector(Integer.parseInt(nums[0]), Integer.parseInt(nums[1]));
    nums = parent.split(file[2], " ");
    goal=new PVector(Integer.parseInt(nums[0]), Integer.parseInt(nums[1]));

    for (int r=0; r<grid.length; r++) {
      for (int c=0; c<grid.length; c++) {
        grid[r][c]= new Cell(r, c, false, false, false, false, parent);
      }
    }
    parent.size(Cell.cellSize*grid[0].length, Cell.cellSize*grid.length);

    // load paths
    PVector[][] instructions;
    instructions = new PVector[file.length-3][2];
    for (int i=0; i<instructions.length; i++) {
      nums = parent.split(file[i+3], " ");
      instructions[i][0] = new PVector(Integer.parseInt(nums[0]), Integer.parseInt(nums[1]));
      instructions[i][1] = new PVector(Integer.parseInt(nums[2]), Integer.parseInt(nums[3]));
    }

    for (PVector[] path:instructions) {
      if (path[0].x==path[1].x) {// vertical path
        grid[(int)path[0].x][(int)(parent.min(path[0].y, path[1].y))].S=true;
        grid[(int)path[0].x][(int)(parent.max(path[0].y, path[1].y))].N=true;
        for (int i=(int)(parent.min(path[0].y, path[1].y))+1; i<(int)(parent.max(path[0].y, path[1].y)); i++) {
          grid[(int)(path[0].x)][i].N=true;
          grid[(int)(path[0].x)][i].S=true;
        }
      } 
      else {// horizontal path
        grid[(int)(parent.min(path[0].x, path[1].x))][(int)(path[0].y)].E=true;
        grid[(int)(parent.max(path[0].x, path[1].x))][(int)(path[0].y)].W=true;
        for (int i=(int)(parent.min(path[0].x, path[1].x))+1; i<(int)(parent.max(path[0].x, path[1].x)); i++) {
          grid[i][(int)(path[0].y)].E=true;
          grid[i][(int)(path[0].y)].W=true;
        }
      }
    }



    checkMaze();
  }

  private void checkMaze() {
    // error checking for maze creation
    // check that start is valid 
    if (!grid[(int)(start.x)][(int)(start.y)].isDeadEnd()) {
      System.out.println("error with start - it is not a dead end");
      parent.noLoop();
    }
    // check goal is valid
    if (!grid[(int)(goal.x)][(int)(goal.y)].isDeadEnd()) {
      System.out.println("error with goal - it is not a dead end");
      parent.noLoop();
    }
  }

  boolean isAtGoal(PVector location) {
    return location.x==goal.x && location.y==goal.y;
  }

  boolean isAtStart(PVector location) {
    return location.x==start.x && location.y==start.y;
  }
  PVector getStartPos() {
    return new PVector(start.x, start.y);
  }

  int getStartDir() {
    if (grid[(int)(start.x)][(int)(start.y)].N) return Robot.NORTH;
    else if (grid[(int)(start.x)][(int)(start.y)].S) return Robot.SOUTH;
    else if (grid[(int)(start.x)][(int)(start.y)].E) return Robot.EAST;
    else return Robot.WEST;
  }

  void draw() {
    for (Cell[] c2 : grid) {
      for (Cell c : c2) {
        c.draw();
      }
    }
    // draw start indicator (orange)
    parent.fill(250, 125, 8);
    parent.ellipse((float)(start.x*Cell.cellSize+Cell.cellSize*.5), (float)(start.y*Cell.cellSize+Cell.cellSize*.5), 10f, 10f);
    // draw end indicator (blue)
    parent.fill(0, 0, 255);
    parent.ellipse((float)(goal.x*Cell.cellSize+Cell.cellSize*.5), (float)(goal.y*Cell.cellSize+Cell.cellSize*.5), 10f, 10f);
  }
}


