void HomeScreen(){
  background(90,194,250);
  strokeWeight(1);
  stroke(0);
  
  fill(255);
  ellipse(300,300,400,400);
  fill(0);
  ellipse(cxpos,cypos,40,40);
  fill(0,0,0,0);
  strokeWeight(15);
  stroke(1);
  arc(300,300,400,400, radians(80), radians(100));
  fill(255);
  textSize(25);
  textAlign(CENTER);
  text("Circle Pong",300,50);
  textSize(20);
  fill(0);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  rect(200,550,150,75,7);
  rect(400,550,150,75,7);
  fill(255);
  text("Start",400,550);
  text("Instructions",200,550); 
  if (mousePressed){
    if (mouseX<=275 && mouseX>=125 && mouseY<=587 && mouseY>=513){
      instructions = true;
    } 
  }
  if (mousePressed){
    if (mouseX<=475 && mouseX>=325 && mouseY<=587 && mouseY>=513){
      begin = true;
    }
  }
}
