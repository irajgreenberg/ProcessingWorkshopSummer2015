////////////////////////////////////////////
// MAKE A BALL BOUNCE, PROCESSING EDITION //
// Giri Srinivasan                        //
// January 28, 2014 (2014/1/28)           //
////////////////////////////////////////////

ball sirRound;
float[] rgb;

void setup() {
  size(960, 540);
  sirRound = new ball();
  sirRound.draw();
  rgb = new float[3];
  for (int i = 0; i < rgb.length; ++i) {
    rgb[i] = random(255);
  }
}

void draw() {
  //background(random(255), random(255), random(255));
  background(rgb[0], rgb[1], rgb[2]);
  sirRound.move();
  sirRound.draw();
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
  loop();
}
