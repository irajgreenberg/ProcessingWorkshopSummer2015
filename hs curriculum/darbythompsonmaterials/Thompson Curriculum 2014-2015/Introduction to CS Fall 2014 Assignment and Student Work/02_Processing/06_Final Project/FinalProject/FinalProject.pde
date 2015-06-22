//Final Project
int w = 0;
int ballchoice = 0;
boolean starttrue = true;
boolean switchj = true;
boolean switchk = false;
int numclicks = 0;
int updown = 0;
float timer = millis()/1000.0;
int firstnum = int(random(1, 12));
String first = "" +firstnum;
int sec = 60;
boolean losetrue = false;
float numseconds = 0;

boolean inv = false;
//Circles
int speed = 7;
int speed1 = speed;
int speed2 = speed;
int speed3 = speed;
int speed4 = speed;
int speed5 = speed;
int speed6 = speed;
int speed7 = speed;
int speed8 = speed;

int rect1x = int(random(40, 150));
int rect1y = int(random(40, 560));
//ellipse(rect1x, rect1y, 40, 40);

int rect2x = int(random(150, 300));
int rect2y = int(random(40, 560));
//ellipse(rect2x, rect2y, 40, 40);

int rect3x = checkZ(int(random(300, 450)));
int rect3y = int(random(40, 560));
//ellipse(rect3x, rect3y, 40, 40);

int rect4x = int(random(450, 560));
int rect4y = int(random(40, 560));

int rect1x1 = checkZ(int(random(-1*speed1, speed1)));
int rect1y1 = checkZ(int(random(-1*speed2, speed2)));
int rect2x1 = checkZ(int(random(-1*speed3, speed3)));
int rect2y1 = checkZ(int(random(-1*speed4, speed4)));
int rect3x1 = checkZ(int(random(-1*speed5, speed5)));
int rect3y1 = checkZ(int(random(-1*speed6, speed6)));
int rect4x1 = checkZ(int(random(-1*speed7, speed7)));
int rect4y1 = checkZ(int(random(-1*speed8, speed8)));


float avg = (abs(rect1x1)+abs(rect1y1)+abs(rect2y1)+abs(rect2x1)+abs(rect3y1)+abs(rect3x1)+abs
(rect4y1)+abs(rect4x1));
float level = (avg);
float r = random(255);
float g = random(255);
float b = random(255);



//Setup
void setup() {
  size(600, 600);
  frameRate(70);
}

void draw() {


  if (mousePressed && starttrue) {
    if (mouseX < 350 && mouseX > 250 && mouseY < 340 && mouseY > 300) {
      background(220);
      starttrue = false;
    }
  } else if (starttrue) {
    Welcome();
    if (keyPressed && key == '1') {
      ballchoice = 1;
    }
    if (keyPressed && key == '2') {
      ballchoice = 2;
    }
  } else {
    starttrue = false;
    Start(ballchoice);
    numseconds++;
    if (!Start(ballchoice)) {
      starttrue = true;

      losetrue = true;
    }
  }


  if (losetrue) {
    Lose(numseconds/30);
    if(mousePressed && Lose(numseconds/30)) {
     if(mouseX > 120 && mouseX < 240 && mouseY > 500 && mouseY < 540) {
      save("DodgeRecord.jpg");
        text("Done!", 100, 250);
     }
    } 
     if(mousePressed){
       if(mouseX > 360 && mouseX < 480 && mouseY > 500 && mouseY < 540) {
       rect1x1 = checkZ(int(random(-1*speed1, speed1)));
        rect1y1 = checkZ(int(random(-1*speed2, speed2)));
        rect2x1 = checkZ(int(random(-1*speed3, speed3)));
        rect2y1 = checkZ(int(random(-1*speed4, speed4)));
        rect3x1 = checkZ(int(random(-1*speed5, speed5)));
        rect3y1 = checkZ(int(random(-1*speed6, speed6)));
        rect4x1 = checkZ(int(random(-1*speed7, speed7)));
        rect4y1 = checkZ(int(random(-1*speed8, speed8)));
        r = random(255);
        g = random(255);
        b = random(255);
        losetrue = false;
        numseconds = 0;
        numclicks = 0;
        timer = 0;
        w=0;
        Start(ballchoice);
       
       }
    
    }
    if (keyPressed) {
      if (key == 's'&& Lose(numseconds/30)) {
        save("DodgeRecord.jpg");
        text("Done!", 100, 250);
      }
      if (key == 'r') {
        rect1x1 = checkZ(int(random(-1*speed1, speed1)));
        rect1y1 = checkZ(int(random(-1*speed2, speed2)));
        rect2x1 = checkZ(int(random(-1*speed3, speed3)));
        rect2y1 = checkZ(int(random(-1*speed4, speed4)));
        rect3x1 = checkZ(int(random(-1*speed5, speed5)));
        rect3y1 = checkZ(int(random(-1*speed6, speed6)));
        rect4x1 = checkZ(int(random(-1*speed7, speed7)));
        rect4y1 = checkZ(int(random(-1*speed8, speed8)));
        r = random(255);
        g = random(255);
        b = random(255);
        losetrue = false;
        numseconds = 0;
        numclicks = 0;
        timer = 0;
        w=0;
        Start(ballchoice);
      }
    }
    
  }
}

