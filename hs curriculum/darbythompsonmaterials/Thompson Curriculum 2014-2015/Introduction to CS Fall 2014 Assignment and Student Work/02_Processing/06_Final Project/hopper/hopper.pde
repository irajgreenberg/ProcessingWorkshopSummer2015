//"Hopper" game: get the little frog to the other side
//the object is to cross the road and land the frog in one of the rectangular water spots on the other side of the river
//once the frog gets to one of the spots, he restarts. Try to land in each unique spot to win.
//WASD controls, press R to respawn after death

//NOTE: many positions were originally calculated for drawing shapes with the center as the reference point
//but as I replaced default shapes with images, the reference point became the corner, so later I just subtracted
//half the width from the original value etc. this is because I didn't feel like changing the numbers themselves.

//variable declarations:
int xPos=350;
int yPos=850;
int frogVelocity=50;
int freezeCount=0;
int xCar1=-70;
int xCar2=-540;
int xCar3=970;
int xCar4=1490;
int xCar5=970;
int xCar6=1350;
int xCar7=-70;
int xCar8=-580;
int carVelocity1=5;
int carVelocity2=-8;
int carVelocity3=-4;
int carVelocity4=7;
boolean dead=false;
int deadRadX=30;
int deadRadY=30;
int retryCount=3;
PFont font;
PImage frog;
PImage retryFrog;
PImage winFrog;

int xLog1=0;
int xLog2=300;
int xLog3=550;
int xLog4=700;
int xLog5=400;
int xLog6=150;
int xLog7=0;
int xLog8=780;
int xLog9=620;
int xLog10=560;
int xLog11=320;
int xLog12=100;
int xLog13=-20;
int xLog14=100;
int xLog15=300;
int xLog16=500;
int xLog17=-30;
int xLog18=200;
int xLog19=450;
int xLog20=600;
int logVelocity1=2;
int logVelocity2=-3;
int logVelocity3=-1;
int logVelocity4=2;
int logVelocity5=1;

int score=0;
int scoreCount=0;

int kcount=0;

boolean deadInWater=false;
boolean click=false;

boolean win1=false;
boolean win2=false;
boolean win3=false;
boolean win4=false;
boolean win5=false;
int winScore=0;

boolean start=false;
int activate=0;
//images being declared
PImage car1;
PImage car2;
PImage car3;
PImage car4;
PImage car5;
PImage car6;
PImage car7;
PImage car8;
PImage coin;
PImage grass;
PImage water;
PImage log1;
PImage log2;
PImage log3;
PImage log4;
PImage title;




void setup() {
  //create window, load images
  size(700, 950);
  frog=loadImage("frog1.png");
  retryFrog=loadImage("frog1.png");
  winFrog=loadImage("frog3.png");
  font=loadFont("EurostileBold-48.vlw");
  car1=loadImage("car1.png");
  car2=loadImage("car2.png");
  car3=loadImage("car3.png");
  car4=loadImage("car4.png");
  car5=loadImage("car5.png");
  car6=loadImage("car6.png");
  car7=loadImage("car7.png");
  car8=loadImage("car8.png");
  coin=loadImage("coin.png");
  grass=loadImage("grass.png");
  water=loadImage("water.png");
  log1=loadImage("log1.png");
  log2=loadImage("log2.png");
  log3=loadImage("log3.png");
  log4=loadImage("log4.png");
  title=loadImage("title.png");
  
  
}

void draw() {
  
    //this following block (when start=true) is the running of the game, the most important part
  if (start==true) {
    
    //this counter makes the "code activated" text appear for a certain amount of time
    if(activate>=1){
      activate=activate+1; 
    }
    if(activate==50){
      activate=0;
    }
    //this keeps the score running
    if (dead==false&&deadInWater==false&&winScore==0) {
      scoreCount=scoreCount+1;
      score=10000-scoreCount;
    }
    //this controls the death animation
    if (dead==true||deadInWater==true) {
      deadRadX=deadRadX+1;
      deadRadY=deadRadY+1;
    }

    if (deadRadX>80) {
      deadRadX=deadRadX-1; //stops the death animation from expanding once it hits a critical point
      deadRadY=deadRadY-1;
    }

  
    //car and log motion controls
    xCar1=xCar1+carVelocity1;
    xCar2=xCar2+carVelocity1;
    xCar3=xCar3+carVelocity2;
    xCar4=xCar4+carVelocity2;
    xCar5=xCar5+carVelocity3;
    xCar6=xCar6+carVelocity3;
    xCar7=xCar7+carVelocity4;
    xCar8=xCar8+carVelocity4;

    xLog1=xLog1+logVelocity1;
    xLog2=xLog2+logVelocity1;
    xLog3=xLog3+logVelocity1;
    xLog4=xLog4+logVelocity2;
    xLog5=xLog5+logVelocity2;
    xLog6=xLog6+logVelocity2;
    //xLog7=xLog7+logVelocity2;   //some logs have been taken out in order to make the log stage an actual challenge
    xLog8=xLog8+logVelocity3;     
    xLog9=xLog9+logVelocity3;
    //xLog10=xLog10+logVelocity3;
    xLog11=xLog11+logVelocity3;
    xLog12=xLog12+logVelocity3;
    xLog13=xLog13+logVelocity4;
    //xLog14=xLog14+logVelocity4;
    xLog15=xLog15+logVelocity4;
    xLog16=xLog16+logVelocity4;
    xLog17=xLog17+logVelocity5;
    xLog18=xLog18+logVelocity5;
    xLog19=xLog19+logVelocity5;
    xLog20=xLog20+logVelocity5;


    //this bit makes it so that the frog moves bit by bit instead of at a constant rate
    if (freezeCount>0) {
      freezeCount=freezeCount+1;
    }

    if (freezeCount==15) {
      freezeCount=0;
    }
    
    //this following part displays the background and static images
    image(grass,0,0);
    rectMode(CENTER);
    fill(100, 100, 100);
    noStroke();
    rect(350, 625, 700, 200);
    fill(0);
    rect(350, 925, 700, 50);
    rect(350, 25, 700, 50);
    image(water,0,75);



    //these statements control the death animation (and which one shows up depending on car death or water death)
    if (dead==true) {
      fill(155, 12, 12);
      ellipse(xPos, yPos, deadRadX, deadRadY);
    }

    if (deadInWater==true) {
      fill(91, 130, 255);
      ellipse(xPos, yPos, deadRadX, deadRadY);
    }
    
    //displaying the logs    
    image(log1,xLog1-100,180);
    image(log1,xLog2-100,180);
    image(log1,xLog3-100,180);
    image(log2,xLog4-50,230);
    image(log2,xLog5-50,230);
    image(log2,xLog6-50,230);
    //image(log2,xLog7-50,230);   //the omitted logs from before
    image(log3,xLog8-65,280);
    image(log3,xLog9-65,280);
    //image(log3,xLog10-65,280);
    image(log3,xLog11-65,280);
    image(log3,xLog12-65,280);
    image(log2,xLog13-50,330);
    //image(log2,xLog14-50,330);
    image(log2,xLog15-50,330);
    image(log2,xLog16-50,330);
    image(log4,xLog17-55,380);
    image(log4,xLog18-55,380);
    image(log4,xLog19-55,380);
    image(log4,xLog20-55,380);

    noStroke();

    //displaying the frog, our young protagonist who seeks to cross the road and return to his home in the river
    if (dead==false&&deadInWater==false) {
      fill(33, 103, 10);
      image(frog, xPos-25, yPos-25);
    }


    //moves the frog depending on which key is pressed
    if (keyPressed&&freezeCount==0&&dead==false&&deadInWater==false) {

      if (key=='w'&&yPos>50) {
        yPos=yPos-frogVelocity;
        freezeCount=1;
        frog=loadImage("frog1.png");//these lines make the frog face the correct direction
      }

      if (key=='a'&&xPos>50) {
        xPos=xPos-frogVelocity;
        freezeCount=1;
        frog=loadImage("frog4.png");
      }

      if (key=='s'&&yPos<850) {
        yPos=yPos+frogVelocity;
        freezeCount=1;
        frog=loadImage("frog3.png");
      }

      if (key=='d'&&xPos<650) {
        xPos=xPos+frogVelocity;
        freezeCount=1;
        frog=loadImage("frog2.png");
      }
    }


    //this determines whether or not the konami code has been activated by the player, or how far along in the code the player is
    //w w s s a d a d b a space
    if (keyPressed&&dead==false&&deadInWater==false&&click==false) {
      if (kcount==0&&key=='w') {
        kcount=1;
      } else if (kcount==1&&key=='w') {
        kcount=2;
      } else if (kcount==2&&key=='s') {
        kcount=3;
      } else if (kcount==3&&key=='s') {
        kcount=4;
      } else if (kcount==4&&key=='a') {
        kcount=5;
      } else if (kcount==5&&key=='d') {
        kcount=6;
      } else if (kcount==6&&key=='a') {
        kcount=7;
      } else if (kcount==7&&key=='d') {
        kcount=8;
      } else if (kcount==8&&key=='b') {
        kcount=9;
      } else if (kcount==9&&key=='a') {
        kcount=10;
      } else if (kcount==10&&key==' ') {
        kcount=11;
      } else {
        kcount=0;
      }
    }
    //these make it so that holding down the "up" key (W) only registers as one press of W, as opposed to many
    //quick presses in succession
    if (keyPressed) {
      click=true;
    }
    if (!keyPressed) {
      click=false;
    }

    //acitvates the konami code! 30 extra lives. Helps with testing. 
    if (kcount==11) {
      retryCount=retryCount+30;
      kcount=0;
      activate=1;
    }
    //displays code activated text
    if(activate>0){
      text("Code Activated", 200, 500); 
    }
    //controls the "press r to respawn" function
    if (keyPressed&&(dead==true||deadInWater==true)&&retryCount>0) {
      if (key=='r') {
        dead=false;
        deadInWater=false;
        deadRadY=30;
        deadRadX=30;
        xPos=350;
        yPos=850;
        retryCount=retryCount-1;  //takes away one life for respawning
      }
    }



   //hit detection for the cars
    if (yPos>=525 && yPos<=575 && (abs(xCar1-xPos)<=50||abs(xCar2-xPos)<=50)&&dead==false) {
      dead=true;
      scoreCount=scoreCount+500;//you lose points if you die
    }
    if (yPos>=575 && yPos<=625 && (abs(xCar3-xPos)<=50||abs(xCar4-xPos)<=50)&&dead==false) {
      dead=true;
      scoreCount=scoreCount+500;
    }
    if (yPos>=625 && yPos<=675 && (abs(xCar5-xPos)<=50||abs(xCar6-xPos)<=50)&&dead==false) {
      dead=true;
      scoreCount=scoreCount+500;
    }
    if (yPos>=675 && yPos<=725 && (abs(xCar7-xPos)<=50||abs(xCar8-xPos)<=50)&&dead==false) {
      dead=true;
      scoreCount=scoreCount+500;
    }

    //hit detection for the logs (excpet you WANT to be on the logs, so it moves you with the log if you are on
    if (yPos>=175&&yPos<=225&&deadInWater==false&&dead==false) {
      if (abs(xLog1-xPos)<100||abs(xLog2-xPos)<100||abs(xLog3-xPos)<100) {
        xPos=xPos+logVelocity1;  

        if (xPos<0||xPos>700) {
          dead=true;
          scoreCount=scoreCount+500;//kills you if you ride a log off the screen
        }
      } else {
        deadInWater=true;
        scoreCount=scoreCount+500;//kills you if you're not on a log
      }
    }
    if (yPos>=225&&yPos<=275&&deadInWater==false&&dead==false) {
      if (abs(xLog4-xPos)<50||abs(xLog5-xPos)<50||abs(xLog6-xPos)<50||abs(xLog7-xPos)<50) {
        xPos=xPos+logVelocity2;

        if (xPos<0||xPos>700) {
          dead=true;
          scoreCount=scoreCount+500;
        }
      } else {
        deadInWater=true;
        scoreCount=scoreCount+500;
      }
    }
    if (yPos>=275&&yPos<=325&&deadInWater==false&&dead==false) {
      if (abs(xLog8-xPos)<50||abs(xLog9-xPos)<50||abs(xLog10-xPos)<50||abs(xLog11-xPos)<50|abs(xLog12-xPos)<50) {
        xPos=xPos+logVelocity3;

        if (xPos<0||xPos>700) {
          dead=true;
          scoreCount=scoreCount+500;
        }
      } else {
        deadInWater=true;
        scoreCount=scoreCount+500;
      }
    }
    if (yPos>=325&&yPos<=375&&deadInWater==false&&dead==false) {
      if (abs(xLog13-xPos)<50||abs(xLog14-xPos)<50||abs(xLog15-xPos)<50||abs(xLog16-xPos)<50) {
        xPos=xPos+logVelocity4;

        if (xPos<0||xPos>700) {
          dead=true;
          scoreCount=scoreCount+500;
        }
      } else {
        deadInWater=true;
        scoreCount=scoreCount+500;
      }
    }
    if (yPos>=375&&yPos<=425&&deadInWater==false&&dead==false) {
      if (abs(xLog17-xPos)<50||abs(xLog18-xPos)<50||abs(xLog19-xPos)<50||abs(xLog20-xPos)<50) {
        xPos=xPos+logVelocity5;

        if (xPos<0||xPos>700) {
          dead=true;
          scoreCount=scoreCount+500;
        }
      } else {
        deadInWater=true;
        scoreCount=scoreCount+500;
      }
    }

    //displays the cars
    image(car1,xCar1-35,530);
    image(car2,xCar2-35,530);
    image(car3,xCar3-35,580);
    image(car4,xCar4-35,580);
    image(car5,xCar5-35,630);
    image(car6,xCar6-35,630);
    image(car7,xCar7-35,680);
    image(car8,xCar8-35,680);


    //loops the car motion (i.e. when it drives off the screen it reappears on the other side again)
    if (xCar1>770) {
      xCar1=-70;
    }
    if (xCar2>770) {
      xCar2=-70;
    }
    if (xCar3<-70) {
      xCar3=770;
    }
    if (xCar4<-70) {
      xCar4=770;
    }
    if (xCar5<-70) {
      xCar5=770;
    }
    if (xCar6<-70) {
      xCar6=770;
    }
    if (xCar7>770) {
      xCar7=-70;
    }
    if (xCar8>770) {
      xCar8=-70;
    }

    //loops the log motion
    if (xLog1>770) {
      xLog1=-70;
    }
    if (xLog2>770) {
      xLog2=-70;
    }
    if (xLog3>770) {
      xLog3=-70;
    }
    if (xLog4<-70) {
      xLog4=770;
    }
    if (xLog5<-70) {
      xLog5=770;
    }
    if (xLog6<-70) {
      xLog6=770;
    }
    if (xLog7<-70) {
      xLog7=770;
    }
    if (xLog8<-70) {
      xLog8=770;
    }
    if (xLog9<-70) {
      xLog9=770;
    }
    if (xLog10<-70) {
      xLog10=770;
    }
    if (xLog11<-70) {
      xLog11=770;
    }
    if (xLog12<-70) {
      xLog12=770;
    }
    if (xLog13>770) {
      xLog13=-70;
    }
    if (xLog14>770) {
      xLog14=-70;
    }
    if (xLog15>770) {
      xLog15=-70;
    }
    if (xLog16>770) {
      xLog16=-70;
    }
    if (xLog17>770) {
      xLog17=-70;
    }
    if (xLog18>770) {
      xLog18=-70;
    }
    if (xLog19>770) {
      xLog19=-70;
    }
    if (xLog20>770) {
      xLog20=-70;
    }

    //detects when a player has landed in a winning spot
    if (yPos==150) {
      if (xPos>=0&&xPos<=100&&win1==false) {
        win1=true;
        scoreCount=scoreCount-1200;
        xPos=350;
        yPos=850;
      } else if (xPos>=150&&xPos<=250&&win2==false) {
        win2=true;
        scoreCount=scoreCount-1200;
        xPos=350;
        yPos=850;
      } else if (xPos>=300&&xPos<=400&&win3==false) {
        win3=true;
        scoreCount=scoreCount-1200;
        xPos=350;
        yPos=850;
      } else if (xPos>=450&&xPos<=550&&win4==false) {
        win4=true;
        scoreCount=scoreCount-1200;
        xPos=350;
        yPos=850;
      } else if (xPos>=600&&xPos<=700&&win5==false) {
        win5=true;
        scoreCount=scoreCount-1200;
        xPos=350;
        yPos=850;
      } else {
        deadInWater=true;
      }
    }
    
    //displays a frog character to mark where the player as already achieved the goal
    if (win1==true) {
      image(winFrog, 25, 125);
    }
    if (win2==true) {
      image(winFrog, 175, 125);
    }
    if (win3==true) {
      image(winFrog, 325, 125);
    }
    if (win4==true) {
      image(winFrog, 475, 125);
    }
    if (win5==true) {
      image(winFrog, 625, 125);
    }
    
    //when you have filled all 5 spots, you win
    //displays the "do you want to continue" window
    if (win1&&win2&&win3&&win4&&win5) {
      fill(0);
      rect(350, 450, 300, 300);
      fill(255, 0, 0);
      text("YOU WIN!", 240, 400);
      if (winScore==0) {
        winScore=1;
      }
      stroke(255);
      noFill();
      rect(350, 475, 150, 50);
      rect(350, 550, 150, 50);
      fill(255);
      textSize(20);
      text("Insert Coin", 305, 480);
      text("I'm Done", 315, 555);
      if (mousePressed) {
        //if you click "yes":
        if (mouseX>275&&mouseX<425&&mouseY>450&&mouseY<500) {
          start=false;
          retryCount=3;
          xPos=350;
          yPos=850;
          dead=false;
          deadInWater=false;
          deadRadX=30;
          deadRadY=30;
          score=0;
          scoreCount=0;
          win1=false;
          win2=false;
          win3=false;
          win4=false;
          win5=false;
          winScore=0;
        }
        //if you click "no":
        if (mouseX>275&&mouseX<425&&mouseY>525&&mouseY<575) {
          exit();
        }
      }
    }
    //gives you 5000 points for winning
    if (winScore==1) {
      scoreCount=scoreCount-5000;
      winScore=2;//this ensures that once you've won, you can't win again (and you wont get 5000 points for every tick you spend on the winning GUI)
    }

    //displays the "extra life" frogs at the bottom
    for (int i=1; i<retryCount+1; i++) {
      image(retryFrog, 50*i-50, 900);
    } 
    
    textFont(font);
    fill(255);


    //displays the "Continue?" GUI if you die and have no lives left
    if ((dead==true||deadInWater==true) && retryCount==0) {
      fill(0);
      rect(350, 450, 300, 300);
      fill(255);
      text("Continue?", 250, 400);
      stroke(255);
      noFill();
      rect(350, 475, 150, 50);
      rect(350, 550, 150, 50);
      fill(255);
      textSize(32);
      text("Yes", 325, 485);
      text("No", 330, 560);
      if (mousePressed) {
        if (mouseX>275&&mouseX<425&&mouseY>450&&mouseY<500) {
          start=false;
          retryCount=3;
          xPos=350;
          yPos=850;
          dead=false;
          deadInWater=false;
          deadRadX=30;
          deadRadY=30;
          score=0;
          scoreCount=0;
          win1=false;
          win2=false;
          win3=false;
          win4=false;
          win5=false;
          winScore=0;
        }
        if (mouseX>275&&mouseX<425&&mouseY>525&&mouseY<575) {
          exit();
        }
      }
    }
    //displays your score in real time at the top of the screen
    textSize(50);
    text(score, 0, 45);
  }
  
  //NOW we get out of the code for the game itself and to the "insert coin to begin" screen
  //If you've won and are playing again, died and are trying again, or just starting the program, you see this page first

  else if (start==false) {
    rectMode(CORNER);
    
    //these if statements discern which side of the window the mouse is on, just to make the coin look like
    //it's going into a slot from both sides. Nothing more than a bit of graphical whimsy. Why not?
    if (mouseX<350) {
      fill(150, 150, 150);
      rect(0, 0, 350, 950);
      noStroke();
      fill(0);
      rect(347, 450, 6, 120);
      fill(205, 200, 30);
      textFont(font);
      textSize(30);
      image(coin,mouseX-30, mouseY-30);
      fill(150, 150, 150);
      rect(350, 0, 350, 950);
      fill(0);
      rect(350, 450, 6, 120);
      text("Insert Coin to Begin", 242, 400);
    } 
    else if(mouseX>=350) {
      fill(150, 150, 150);
      rect(350, 0, 350, 950);
      fill(0);
      rect(350, 450, 6, 120);
      noStroke();
      fill(205, 200, 30);
      textFont(font);
      textSize(30);
      image(coin,mouseX-30, mouseY-30);
      fill(150,150,150);      
      rect(0, 0, 350, 950);
      fill(0);
      rect(347, 450, 6, 120);
      fill(150, 150, 150);
      fill(0);
      text("Insert Coin to Begin", 242, 400);
    }
    
    image(title,85,160);
    //if the coin enters the slot, we begin!:
    if(mouseX>=340&&mouseX<=360&&mouseY>440&&mouseY<560){
      start=true;
    }
  }

}

