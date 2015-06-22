class ball {
  float x;
  float y;
  float xMove;
  float yMove;
  
  float[] rgbF;
  float[] rgbS;
  
  float sizeLow;
  float sizeHigh;
  float radius;
  float gravity;
  
  float[] xTrail;
  float[] yTrail;
  float[] rTrail;
  int trailLength;
  int iterations;
  
  ball() {
    x = random(width);
    y = random(height);
    xMove = 10;
    yMove = 10;
    
    rgbF = new float[3];
    rgbS = new float[3];
    for (int i = 0; i < 3; ++i) {
      rgbF[i] = random(255);
      rgbS[i] = random(255);
    }
    fill(rgbF[0], rgbF[1], rgbF[2]);
    stroke(rgbS[0], rgbS[1], rgbS[2]);
    
    sizeLow = 5;
    sizeHigh = 50;
    radius = random(sizeLow, sizeHigh);
    
    trailLength = 10;
    xTrail = new float[trailLength];
    yTrail = new float[trailLength];
    rTrail = new float[trailLength];
    iterations = 0;
    
    gravity = 0;
  }
  
  void draw() {
    fill(random(255), random(255), random(255));
    stroke(random(255), random(255), random(255));
    //radius = random(sizeRange);
    
    if (iterations != 0) {
      if (iterations >= trailLength) {
        for (int i = 0; i < iterations - 1; ++i) {
          xTrail[i] = xTrail[i+1];
          yTrail[i] = yTrail[i+1];
          rTrail[i] = rTrail[i+1];
        }
      } else {
        ++iterations;
      }
      xTrail[iterations-1] = x;
      yTrail[iterations-1] = y;
      rTrail[iterations-1] = radius;
      
      for (int i = 0; i < iterations; ++i) {
        fill(rgbF[0], rgbF[1], rgbF[2], 255 * i/iterations);
        stroke(rgbS[0], rgbS[1], rgbS[2], 255 * i/iterations);
        ellipse(xTrail[i], yTrail[i], rTrail[i]*2, rTrail[i]*2);
      }
    } else {
      ++iterations;
    }
    ellipse(x, y, radius*2, radius*2);
  }
  
  void move() {
    x += xMove;
    y += yMove + gravity;
    if (x < radius) {
      xMove = -xMove;
      //radius = random(sizeLow, sizeHigh);
      x = radius;
    } else if (x > width - radius) {
      xMove = -xMove;
      //radius = random(sizeLow, sizeHigh);
      x = width - radius;
    }
    if (y < radius) {
      yMove = -yMove;
      //radius = random(sizeLow, sizeHigh);
      gravity = -gravity;
      y = radius;
    } else if (y > height - radius) {
      yMove = -yMove;
      //radius = random(sizeLow, sizeHigh);
      gravity = -gravity;
      y = height - radius;
    }
    ++gravity;
  }
}
