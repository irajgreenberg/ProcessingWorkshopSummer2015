//12/15/14
//Snake with mouse acceleration
void setup() {
  size(1000, 1000);
}
double initialx=500;
double initialy=500;
double vx=0;
double vy=0;
double ax=0;
double ay=0;
double finaly=0;
double finalx=0;
int flag = 0;
int score = 0;
float sizetarget=random(20, 60);
float targetx=random(50+sizetarget, 900-sizetarget);
float targety=random(50+sizetarget, 900-sizetarget);
int flag1=0;
String score1 = "";
int count=0;
int flaghit=1;
int flag2=1;
int flag3=1;
int darby=0;
int hard=0;
int molasses=0;
int afactor=450;
float flagblock=0;
int flag5=1;
int[] blocklocation = new int[300];


void draw() {
  background(255, 0, 0);
  if (flag1==0) {
    fill(255);
    rect(50, 50, 900, 900);
    textSize(30);
    fill(0);
    text("To start game, center your mouse on the screen and press spacebar, and if you're Darby, press d first. In order to score points, run your ball over circular targets placed around the screen,  but watch out for the walls of the rectangle, those are minus 10 seconds, and the bricks that start appearing as the game continues, if you hit those it's game over. If you're feeling adventurous, press h for crazy hard mode, and m for molasses mode.  Press p to pause at anytime, and r to restart at anytime. Get the highest possible score before time runs out, and have fun!", 200, 180, 700, 700);
  }  
  if (key=='d') {
    darby=1;
  }
  if (key==' ') {
    flag=1;
    flag1=1;
  }
  if (key=='h') {
    afactor=120;
  }
  if (key=='m') {
    afactor=4000;
  }
  if (flag==1 && flag3==1) {
    textSize(25);
    fill(0);
    text(score1, 900, 20, 500, 500);
    text(calctime(count), 100, 20, 500, 500);
    fill(255);
    rect(50+score*2, 50+score*2, 900-score*4, 900-score*4);
    ellipse(targetx, targety, sizetarget, sizetarget);
    ellipse((int)initialx, (int)initialy, 40, 40);
    ax=(mouseX-initialx)/afactor;
    ay=(mouseY-initialy)/afactor;
    line(mouseX, mouseY, (int)initialx, (int)initialy);
    vy+=ay;
    vx+=ax;
    finalx=(vx+initialx);
    finaly=(vy+initialy);
    initialx=finalx;
    initialy=finaly;
    int hit=hitdetection((float)initialx, (float)initialy, targetx, targety, sizetarget);
    score+=hit;
    if (hit==1) {
      sizetarget=random(10, 30);
      targetx=random(50+score*2+sizetarget, 950-score*4-sizetarget);
      targety=random(50+score*2+sizetarget, 950-score*4-sizetarget);
      flag5=0;
    }
    if (flag5==0) {
      for (int i=0; i< (int)((score/10)*4); i=i+4)
      {
        flagblock=(int)random(1, 3);
        blocklocation[i+2]=(int)random(25, 50);
        blocklocation[i+3]=(int)random(25, 50);
        if (flagblock==1 && initialx>50+blocklocation[i+2] && initialy>50+blocklocation[i+3]) {  
          blocklocation[i]=(int)random(50+score*2, (float)initialx-50-blocklocation[i+2]);
          blocklocation[i+1]=(int)random(50+score*2, (float)initialy-50-blocklocation[i+3]);
        } else if (initialx<900-score*4-blocklocation[i+2] && initialy<900-score*4-blocklocation[i+3]) {
          blocklocation[i]=(int)random((float)initialx+50, 950-score*4-blocklocation[i+2]);
          blocklocation[i+1]=(int)random((float)initialy+50, 950-score*4-blocklocation[i+3]);
        } else if (initialx>50+blocklocation[i+2] && initialy<900-score*4-blocklocation[i+3]) {  
          blocklocation[i]=(int)random(50+score*2, (float)initialx-50-blocklocation[i+2]);
          blocklocation[i+1]=(int)random((float)initialy+50, 950-score*4-blocklocation[i+3]);
        } else if (initialx<900-score*4-blocklocation[i+2] && initialy>50+blocklocation[i+3]) {
          blocklocation[i]=(int)random((float)initialx+50, 950-score*4-blocklocation[i+2]);
          blocklocation[i+1]=(int)random(50+score*2, (float)initialy-50-blocklocation[i+3]);
        } else if (initialx>50+blocklocation[i+2] && initialy>50+blocklocation[i+3]) {  
          blocklocation[i]=(int)random(50+score*2, (float)initialx-50-blocklocation[i+2]);
          blocklocation[i+1]=(int)random(50+score*2, (float)initialy-50-blocklocation[i+3]);
        } else {
          blocklocation[i]=0;
          blocklocation[i+1]=0;
          blocklocation[i+2]=0;
          blocklocation[i+3]=0;
        }
        if (targetx>blocklocation[i]-15 && targetx<blocklocation[i]+blocklocation[i+2]+15 && targety>blocklocation[i+1]-15 && targety<blocklocation[i+1]+blocklocation[i+3]+15) {
          blocklocation[i]=0;
          blocklocation[i+1]=0;
          blocklocation[i+2]=0;
          blocklocation[i+3]=0;
        }
      }
      flag5=1;
    }
    for (int i=0; i< (int)((score/10)*4); i=i+4)
    {
      fill(0);
      rect(blocklocation[i], blocklocation[i+1], blocklocation[i+2], blocklocation[i+3]);
    }
    for (int i=0; i< (int)((score/10)*4); i=i+4)
    {
      if (hitblock((float)initialx, (float)initialy, blocklocation[i], blocklocation[i+1], blocklocation[i+2], blocklocation[i+3])==1) {
        count+=3360;
      }
    }
    count+=1;
    if (afactor==4000) {
      count+=hit*56*-4;
    } else {
      count+=hit*56*-2;
    }
    if (initialx<=50+score*2+20) {
      vx=vx*-1;
      count+=560;
      initialx=71+score*2;
    } else if (950-score*4+score*2-20<=initialx) {
      vx=vx*-1;
      count+=560;
      initialx=929-score*4+score*2;
    }
    if (initialy<=50+score*2+20) {
      vy=vy*-1;
      count+=560;
      initialy=71+score*2;
    } else if (initialy>=950+score*2-score*4-20) {
      vy=vy*-1;
      count+=560;
      initialy=929-score*4+score*2;
    }
    if (count>=3360) {
      flag3=0;
      flag=0;
    }
  }
  score1=String.valueOf(score);
  if (flag3==0) {
    background(255);
    textSize(60);
    fill(0);
    text("You Lose!", 310, 270, 500, 500);
    text(score1, 290, 330, 500, 500);
    if (darby==0) {
      if (score<10) {
        text(": decidely below average.", 390, 330, 500, 500);
      } else if (score<20) {
        text(": not bad, not good.", 390, 330, 500, 500);
      } else if (score<35) {
        text(": just average.", 390, 330, 500, 500);
      } else if (score<50) {
        text(": I'm pleasantly surprised.", 390, 330, 500, 500);
      } else if (score<100) {
        text(": nice work.", 390, 330, 500, 500);
      } else {
        text(": probably a computer.", 390, 330, 500, 500);
      }
    } else {
      if (score<10) {
        text(": you're going to be play testing this for awhile.", 390, 330, 500, 500);
      } else if (score<20) {
        text(": try harder Darby.", 390, 330, 500, 500);
      } else if (score<35) {
        text(": good enough, I suppose.", 390, 330, 500, 500);
      } else if (score<50) {
        text(": Yay Darby!.", 390, 330, 500, 500);
      } else if (score<100) {
        text(": I think you're done now...", 390, 330, 500, 500);
      } else {
        text(": probably a computer.", 390, 330, 500, 500);
      }
    }
    text("press r to restart", 310, 570, 500, 500);
  }
  if (key=='r') {  
    initialx=500;
    initialy=500;
    vx=0;
    vy=0;
    ax=0;
    ay=0;
    finaly=0;
    finalx=0;
    flag = 0;
    score = 0;
    sizetarget=random(20, 60);
    targetx=random(50+sizetarget, 900-sizetarget);
    targety=random(50+sizetarget, 900-sizetarget);
    flag1=0;
    score1 = "";
    count=0;
    flaghit=1;
    flag2=1;
    flag3=1;
    darby=0;
    hard=0;
    molasses=0;
    afactor=450;
    flagblock=0;
    flag5=1;
    blocklocation = new int[300];
  }
  if (key=='p' && flag==1) {
    flag2=0;
    flag=0;
  }
  if (flag2==0) {
    background(255);
    textSize(60);
    fill(0);
    text("Paused, press g to resume.", 310, 70, 500, 500);
  }
  if (key=='g' && flag==0) {
    flag=1;
    flag2=1;
  }
}

