void setup() {


  size(800, 500);
}

int x=0;
int movex=0;
int movey=0;

void draw() {


  background(255);

 
  fill(0, 120, 0);
  rect(600,430,50,70);
  
  fill(0, 0, 120);
  rect(150,430,50,70);
  
  fill(220, 50, 50);
  rect(100, 230, 600, 200);
  
  fill(50, 50, 220);
  rect((100+movex),(200+movey),50,28);
  
  fill(50,220,220);
  triangle((150+movex),(200+movey),(150+movex),(228+movey),(170+movex),(228+movey));
  
  fill(220,220,50);
  triangle((100+movex),(180+movey),(100+movex),(200+movey),(130+movex),(200+movey));
  
  if ((x % 60)<=30) { 
    line(200, 250, 200, 400);

    line(200, 325, 270, 325);

    line(270, 250, 270, 400);

    line(320, 250, 320, 400);

    line(320, 250, 370, 250);

    line(320, 325, 370, 325);

    line(320, 400, 370, 400);

    line(400, 250, 400, 400);

    line(400, 400, 460, 400);

    line(490, 250, 490, 400);

    line(490, 400, 550, 400);
    
    fill(220,50,50);
    ellipse(610, 325, 90, 150);
    
  }
  if (x%2==0) {
    movex+=4.5;
    if (movex>=125) {
      movey+=-2;
      movex+=5.5;
    }
  }
  if (movex>800) {
    movex=0;
    movey=0;
  }
    
  x+=1;
}

