import processing.core.*;
class Cell {
  static final int cellSize=50;
  boolean N;
  boolean S;
  boolean E;
  boolean W;
  PVector location;
  PApplet parent;

  Cell(int x, int y, boolean n, boolean s, boolean e, boolean w, PApplet p) {
    N=n; 
    S=s; 
    E=e; 
    W=w;
    location = new PVector(x, y);
    parent = p;
  }
  
  boolean isDeadEnd(){
    int count=0; 
    if (N) {
      count++;
    } 
    if (S) {
      count++;
    } 
    if (E) {
      count++;
    } 
    if (W) {
      count++;
    } 
    if (count==1) {
      return true;
    }
    return false;
  }
  
  void draw(){
    if(N){
     parent.line(location.x*cellSize+cellSize*.5f, location.y*cellSize+cellSize*.5f, location.x*cellSize+cellSize*.5f, location.y*cellSize );  
    }
    if(S){
     parent.line(location.x*cellSize+cellSize*.5f, location.y*cellSize+cellSize*.5f, location.x*cellSize+cellSize*.5f, (1+location.y)*cellSize);  
    }
    if(E){
     parent.line(location.x*cellSize+cellSize*.5f, location.y*cellSize+cellSize*.5f, (1+location.x)*cellSize, location.y*cellSize+cellSize*.5f );  
    }
    if(W){
     parent.line(location.x*cellSize+cellSize*.5f, location.y*cellSize+cellSize*.5f, location.x*cellSize, location.y*cellSize+cellSize*.5f );  
    }
    if(isDeadEnd())
    {
      // gray dead-end visual indicator
      parent.fill(150);
      parent.ellipse(location.x*cellSize+cellSize*.5f, location.y*cellSize+cellSize*.5f, 10, 10);
     
    }
  }
  
}

