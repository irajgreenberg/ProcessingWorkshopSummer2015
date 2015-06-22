boolean Start(int cB) {
 background(220);
  /*if(cB == 1) {
   rect1x1 /= 1.1; 
   rect1y1 /= 1.1;
   rect2y1 /= 1.1;
   rect3y1 /= 1.1;
   rect4y1 /= 1.1;
   rect2x1 /= 1.1;
   rect3x1 /= 1.1;
   rect4x1 /= 1.1;
  }
  */
  
  
  
  
 float starttime = millis();
 if(numseconds%30 == 28 && starttime%2 == 0) {
   w++; 
 }
 // text("Seconds Paused:", 100, 50);
  //text("" + numclicks/100, 100, 100);
 fill(r/2,g/2,b/2);
  rect(0,0,w,600);
  rect(0,0,600,w);
  rect(0, 600-w, 600, w);
  rect(600-w, 0, w, 600);
  fill(r,g,b);
  rect1x += rect1x1;
  rect1y += rect1y1;
  rect2x += rect2x1;
  rect2y += rect2y1;
  rect3x += rect3x1;
  rect3y += rect3y1;
  rect4x += rect4x1;
  rect4y += rect4y1;
  ellipse(rect1x, rect1y, 40, 40);
  ellipse(rect2x, rect2y, 40, 40);
  ellipse(rect3x, rect3y, 40, 40);
  ellipse(rect4x, rect4y, 40, 40);
  textSize(24);

  fill(0,0,0);
  text("Level: " + nf((level),2,0) + "/56", 100, 100);
  textSize(24);
  if(level < 18) {
    text("Beginner", 400, 200); 
  }
  else if (level < 34) {
    text("Medium", 400, 200);
  }
  else if (level <= 56) {
    text("Extreme", 400, 200); 
  }

  if (rect1x >= 570-w) {
    rect1x1 = -1*rect1x1;
  }
  if (rect2x >= 570-w) {
    rect2x1 = -1*rect2x1;
  }
  if (rect4x >= 570-w) {
    rect4x1 = -1*rect4x1;
  }
  if (rect3x >= 570-w) {
    rect3x1 = -1*rect3x1;
  }
  if (rect1y >= 570-w) {
    rect1y1 = -1*rect1y1;
  }
  if (rect2y >= 570-w) {
    rect2y1 = -1*rect2y1;
  }
  if (rect3y >= 570-w) {
    rect3y1 = -1*rect3y1;
  }
  if (rect4y >= 570-w) {
    rect4y1 = -1*rect4y1;
  }









  if (rect1x <= w) {
    rect1x1 = -1*rect1x1;
  }
  if (rect2x <= w) {
    rect2x1 = -1*rect2x1;
  }
  if (rect4x <= w) {
    rect4x1 = -1*rect4x1;
  }
  if (rect3x <= w) {
    rect3x1 = -1*rect3x1;
  }
  if (rect1y <= w) {
    rect1y1 = -1*rect1y1;
  }
  if (rect2y <=w) {
    rect2y1 = -1*rect2y1;
  }
  if (rect3y <= w) {
    rect3y1 = -1*rect3y1;
  }
  if (rect4y <= w) {
    rect4y1 = -1*rect4y1;
  }
 textSize(30);
  
  fill(0,0,0);
  if(numseconds/60 > 2) {
    
  text("" + nf((numseconds/60 - 2), 2, 2), 480, 500);
  }
  
  //if statements
  if((keyPressed && key == 'g')) {
    inv = true; 
  }
  if(keyPressed && key == 'h') {
    inv = false; 
    return true;
  }
  if(inv) {
    text("Invincible!", 300,300);
      return true;
  }
  
  
  if(!inv){
  if(numseconds/60 > 2) {
    text("Go!", 300, 300);
  if (abs(mouseX - rect1x) <= 20 && abs(mouseY - rect1y) <= 20) {
    Lose(timer);
    return false;
  }
  if (abs(mouseX - rect2x) <= 20 && abs(mouseY - rect2y) <= 20) {
    Lose(timer);
    return false;
  }

  if (abs(mouseX - rect3x) <= 20 && abs(mouseY - rect3y) <= 20) {
    Lose(timer);
    return false;
  }
  if (abs(mouseX - rect4x) <= 20 && abs(mouseY - rect4y) <= 20) {
    Lose(timer);
    return false;
  }
  if(mouseX > 600-w || mouseX < w || mouseY > 600-w || mouseY < w) {
    return false; 
  }
  return true;
  }
  else{
   text("Ready?", 300, 300); 
   textSize(30);
   return true;
  }
  
  }
  return true;
}

