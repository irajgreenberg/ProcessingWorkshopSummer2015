///////////////////////////////////////////////
//  //
//             //
//-------------------------------------------//
// Giri Srinivasan                           //
// December 12, 2013 (2013/12/12)            //
///////////////////////////////////////////////

void setup() {
  size(960, 540);
  frameRate(10);
}

void firedraw(float[] fireArr) {
  beginShape();
  vertex(40, 487.5);
  for (int i = 0; i < fireArr.length; ++i) {
    vertex(i + 41, fireArr[i]);
  }
  vertex(520, 487.5);
  endShape();
}

float fireHeight = 0;

void fire(float[] fireArr) {
  for (int i = 0; i < fireArr.length; ++i) {
    float yrange = random(9);
    if (yrange < 1) {
      fireArr[i] = random(400, 450);
    } else if (yrange < 3) {
      fireArr[i] = random(300, 350);
    } else {
      fireArr[i] = random(350, 400);
    }
    fireArr[i] += (487.5 - fireArr[i]) * (1-fireHeight);
  }
  fill(#FF0000);
  firedraw(fireArr);

  for (int i = 0; i < fireArr.length; ++i) {
    fireArr[i] += (487.5 - fireArr[i]) / 4 - 37.5 / 4 * fireHeight;
  }
  fill(#FF7F00);
  firedraw(fireArr);

  for (int i = 0; i < fireArr.length; ++i) {
    fireArr[i] += (487.5 - fireArr[i]) / 3 - 37.5 / 3 * fireHeight;
  }
  fill(#FFFF00);
  firedraw(fireArr);

  for (int i = 0; i < fireArr.length; ++i) {
    fireArr[i] += (487.5 - fireArr[i]) / 2 - 37.5 / 2 * fireHeight;
  }
  fill(#FFFFFF);
  firedraw(fireArr);

  fireHeight += 0.01;
  if (fireHeight > 1) {
    fireHeight = 1;
  }
}

int flakeLimit = 0;
float snowHeight = 350;

void draw() {

  noStroke();

  fill(#CCCCCC);
  rect(0, 0, 960, 500);
  
  fill(#BBBBBB);
  rect(0,500,960,40);

  fill(#7F0000);
  rect(105, 0, 350, 270);

  stroke(#3F0000);
  for (int i = 10; i < 35; i += 20) {
    line(105, i, 454, i);
  }
  for (int i = 115; i < 455; i += 20) {
    if (i%40 < 20) {
      line(i, 0, i, 10);
      line(i, 30, i, 50);
    } else {
      line(i, 10, i, 30);
    }
  }
  noStroke();

  fill(#666666);
  rect(30, 35, 500, 500);

  fill(#000000);
  rect(35, 60, 490, 470, 25, 25, 0, 0);

  float[] fireArr = new float[479];
  fire(fireArr);

  fill(#7F3F00);
  rect(40, 450, 480, 75, 37.5);

  fill(#000000);
  textAlign(CENTER, CENTER);
  textSize(25);
  text("Happy Holidays", 280, 400);

 /* stroke(#FFFFFF);
  *   line(35, 300, 525, 300);
  *   line(35, 350, 525, 350);
  *   line(35, 400, 525, 400);
  * noStroke();
  */

  fill(#3F1F00);
  rect(620, 45, 260, 260);

  fill(#7FFFFF);
  rect(625, 50, 250, 250);

  fill(#FFFFFF);
  if (snowHeight > 50) {
    for (int i = 0; i < flakeLimit; ++i) {
      ellipse(random(627.5, 872.5), random(52.5, 297.5), 5, 5);
    }
  }
  ++flakeLimit;

  if (snowHeight < 300) {
    float[] snowArr = new float[251];
    
    beginShape();
    vertex(625, 300);
    for (int i = 0; i < snowArr.length; ++i) {
      snowArr[i] = random(snowHeight - 2, snowHeight + 2);
      if (snowArr[i] > 300) {
        snowArr[i] = 300;
      } else if (snowArr[i] < 50) {
        snowArr[i] = 50;
      }
      vertex(i + 625, snowArr[i]);
    }
    vertex(875, 300);
    endShape();
  }
  snowHeight -= 0.5;
}
