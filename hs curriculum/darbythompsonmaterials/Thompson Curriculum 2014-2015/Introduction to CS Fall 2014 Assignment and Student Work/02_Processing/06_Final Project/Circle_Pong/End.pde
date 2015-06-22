void EndScreen(){
  background(90,194,250);
  fill(0);
  stroke(0);
  strokeWeight(2);
  rectMode(CENTER);
  rect(300,200,200,100,7);
  rect(300,400,200,100,7);
  fill(255);
  textSize(40);
  text(fulltime-starttime,300,200);
  text("Try Again",300,400);
  text("Score",300,120);
  if (mousePressed){
    if (mouseX>150 && mouseX<450){
      if (mouseY>350 && mouseY<450){
        tryagain = true;
      }
    }
  }
  if(fulltime-starttime>highscore){
    highscore = highscore-highscore+(fulltime-starttime);
  }
  text("High Score",300,510);
  text(highscore,300,550);
  
}
