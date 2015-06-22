void Start() {
  background(220);
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
  
  if(rect1x >= 560) {
     rect1x1 = -1*rect1x1; 
  }
  if(rect2x >= 560) {
     rect2x1 = -1*rect2x1; 
  }
  if(rect4x >= 560) {
     rect4x1 = -1*rect4x1; 
  }
  if(rect3x >= 560) {
     rect3x1 = -1*rect3x1; 
  }
  if(rect1y >= 560) {
     rect1y1 = -1*rect1y1; 
  }
  if(rect2y >= 560) {
     rect2y1 = -1*rect2y1; 
  }
  if(rect3y >= 560) {
     rect3y1 = -1*rect3y1; 
  }
  if(rect4y >= 560) {
     rect4y1 = -1*rect4y1; 
  }
  
  
  
  
  
  
  
  
  
  if(rect1x <= 20) {
     rect1x1 = -1*rect1x1; 
  }
  if(rect2x <= 20) {
     rect2x1 = -1*rect2x1; 
  }
  if(rect4x <= 20) {
     rect4x1 = -1*rect4x1; 
  }
  if(rect3x <= 20) {
     rect3x1 = -1*rect3x1; 
  }
  if(rect1y <= 20) {
     rect1y1 = -1*rect1y1; 
  }
  if(rect2y <= 20) {
     rect2y1 = -1*rect2y1; 
  }
  if(rect3y <= 20) {
     rect3y1 = -1*rect3y1; 
  }
  if(rect4y <= 20) {
     rect4y1 = -1*rect4y1; 
  }
  
}

