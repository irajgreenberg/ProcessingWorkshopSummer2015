void Instructions(){
  background(90,194,250);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Click any key to move the bar back and forth, click the mouse to start the ball moving",300,200,400,170);
  text("Try and keep the ball within the circle for as many seconds as you can",300,300,400,170);
  fill(0);
  rect(300,450,150,75,7);
  textSize(45);
  fill(255);
  text("Back",300,450);
  if (mousePressed){
    if (mouseX<=375 && mouseX>=225 && mouseY<=487 && mouseY>=413){
      instructions = false;
    }
  }
  
}
