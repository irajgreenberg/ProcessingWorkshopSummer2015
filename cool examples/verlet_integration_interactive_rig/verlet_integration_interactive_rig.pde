/**
 * Verlet Integration - ragdoll chain
 * Pos  = pos + (pos-posOld)
 * alternative to  x += speed
 *  -with free rotational velocity
 */

int particles = 10;
VerletBall[] balls = new VerletBall[particles];
int bonds = particles-1;
VerletStick[] sticks = new VerletStick[bonds];

PVector[] rectNodes = new PVector[particles*2];

void setup() {
  size(400, 400);
  float shapeR = 40;
  float tension = .05;
  for (int i=0; i<particles; i++) {
    PVector push = new PVector(random(3, 6.5), random(3, 6.5));
    PVector p = new PVector(width/2+shapeR*i, height/2);
    balls[i] = new VerletBall(p, push, 5);

    if (i>0) {
      sticks[i-1] = new VerletStick(balls[i-1], balls[i], tension);
    }
  }

  // balls[0].pos.y += 2.2;
}

void draw() {
  background(255);
  for (int i=0; i<bonds; i++) {
    sticks[i].render();
    sticks[i].constrainLen();
  }

  for (int i=0; i<particles; i++) {
    if (i<particles-1) {
      balls[i].verlet();

      // calculate rect cage
      PVector temp = new PVector();
      temp.set(balls[i+1].pos);
      temp.sub(balls[i].pos);

      println("balls[i+1].pos = " + balls[i+1].pos);
      println("balls[i].pos = " + balls[i].pos);
      println("temp = " + temp);


      float tx = temp.x;
      temp.x = -temp.y;
      temp.y = tx;
      temp.normalize();

      line( balls[i].pos.x, balls[i].pos.y, balls[i].pos.x+temp.x*35, balls[i].pos.y+temp.y*35);
      line( balls[i].pos.x, balls[i].pos.y, balls[i].pos.x+temp.x*-35, balls[i].pos.y+temp.y*-35);
    }
    balls[i].render();
    balls[i].boundsCollision();
  }



  if (mousePressed) {
    if (mouseX > balls[0].pos.x-12 && mouseX < balls[0].pos.x+12 &&
      mouseY > balls[0].pos.y-12 && mouseY < balls[0].pos.y+12) {
      balls[0].pos.x = mouseX;
      balls[0].pos.y = mouseY;
    }
  }
}