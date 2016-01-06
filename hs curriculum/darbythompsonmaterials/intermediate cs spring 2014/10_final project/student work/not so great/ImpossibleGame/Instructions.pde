class Instructions {
  int x;
  int y;
  Instructions() {
    x = width/2-250;
    y=height/2-100;
  }
  void draw() {
    fill(255);
    textSize(20);
    text("Bounce on the green platform to get 1 point!", x, y+20);
    text("But dont hit it from underneath!" , x+50, y+40);
    text("Get the yellow bonus ball for 5 extra points!", x, y+60);
    text("Avoid the red death block and dont go off the screen!", x-30, y+80);
    text("Press s to start and w to jump!", x+50, y+100);
  }
  

}


