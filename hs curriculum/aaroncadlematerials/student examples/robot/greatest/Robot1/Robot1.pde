
int rectL = height/2 - 50;
int ballH = height/2;
int ballW = width * 2 / 3;
int userRect = mouseY - 50;
int up = 1;
int side = 1;
int xSpeed = 20;
int ySpeed = 20;
int compScore = 0;
int userScore = -1;
int aiCount = 0;







void setup()
{
  size(1366, 760); 
  background(0);
}

void draw()
{
  if (userScore >= 15)
  {
    userScore = 15;
    fill(255);
    xSpeed = 0;
    ySpeed = 0;
    text("YOU WIN!!!!!!!!!!!!!", width * 2 / 3, height / 16);
  }

  if (compScore >= 15)
  {
    compScore = 15;
    fill(255);
    xSpeed = 0;
    ySpeed = 0;
    text("YOU LOSE!!!!!!!!!!!!!", width * 2 / 3, height / 16);
  }




  ballW = ballW + xSpeed;
  ballH = ballH + ySpeed;

  if ((ballH > height - 20) || (ballH < 20))
  {
    ySpeed = ySpeed * -1;
  }

  if (ballW > width - 20)
  {
    ballH = int(random(20, height - 20));
    ballW = width * 2 / 3;
    compScore = compScore + 1;
  }

  if (ballW < width/3 + 10)
  {
    ballH = int(random(20, height - 20));
    ballW = width * 2 / 3;
    userScore = userScore + 1;
  }


  if ((ballW > width - 45) && (ballW < width - 30) && (ballH > mouseY - 50) && (ballH < mouseY + 50))
  {
    xSpeed = xSpeed * -1;
  }

  if ((ballW < width/3 + 45) && (ballW > width/3 + 30) && (ballH > rectL - 50) && (ballH < rectL + 50))
  {
    xSpeed = xSpeed * -1;
  } 












  background(0);
  strokeWeight(1);
  rectMode(CORNER);
  stroke(255);
  noFill();
  rect(width/3 + 10, 20, width * 2 / 3 - 20, height - 40);
  rect(width/3, 0, width * 2 / 3, height);
  rectMode(CORNER);
  textSize(15);
  fill(255);
  noStroke();
  text("SAMSUNG", width * 2 / 3, height - 5);
  fill(241, 255, 57);
  rect(width/3 - 14, height/2 -100, 15, 5);
  fill(255);
  rect(width/3 - 14, height/2 -93, 15, 5);
  fill(245, 0, 0);
  rect(width/3 - 14, height/2 - 86, 15, 5);
  fill(255);
  ellipse(width/3 - 18, height/2 - 93, 5, 5);
  stroke(255);
  fill(100);
  rect(width/3 - 20, height/2 - 100, 7, 18);
  noStroke();
  fill(255, 0, 0);
  ellipse(width/3 - 16, height/2 - 93, 3, 3);
  stroke(255);
  fill(100);
  rect(width/3 - 175, height/2 - 100, 7, 18);
  noStroke();
  fill(255, 0, 0);
  ellipse(width/3 - 171, height/2 - 93, 3, 3);
  stroke(62, 643, 647);
  strokeWeight(1);
  noFill();
  beginShape();
  vertex(width/3 - 22, height/2 - 93);
  vertex(width/3 - 43, height/2 - 83);
  vertex(width/3 - 64, height/2 - 113);
  vertex(width/3 - 85, height/2 - 53);
  vertex(width/3 - 106, height/2 - 133);
  vertex(width/3 - 127, height/2 - 73);
  vertex(width/3 - 148, height/2 - 103);
  vertex(width/3 - 169, height/2 - 93);
  endShape();





  //  pong code

    fill(255);
  noStroke();



  aiCount++;

  if (aiCount %60 > 20)
  {
    //    if (random(10) > 5)
    //    {
    //      while (ballH - 50 > rectL)
    //      {
    //        rectL = int(rectL + 1);
    //      }
    //    }
    //    else
    //    {
    //      while (ballH - 101 > rectL)
    //      {
    //        rectL = int(rectL + 1);
    //      }
    //    }
    //    while (ballH - 50 <= rectL)
    //    {
    //      rectL = int(rectL - 1);
    //    }
    rectL = (int)(lerp(rectL, ballH, 1));
  }


  fill(255, 255, 0);
  rect(width/3 + 25, rectL, 15, 100);









  fill(0, 255, 0);
  rect(width - 45, mouseY - 50, 15, 100);

  fill(0);
  rect(width - 25, 1, 10, 19);
  rect(width - 25, height - 19, 10, 19);






  //  ball





  fill(255, 0, 255);
  ellipse(ballW, ballH, 20, 20);
  fill(0, 255, 255, 100);
  stroke(255);
  rect(width/3 + 10, 20, width * 2 / 3 - 20, height - 40);




  fill(0);
  stroke(0);
  rect(width/3 + 10, 1, width*2 / 3 - 15, 18);
  rect(width/3 + 10, height - 19, width*2 / 3 - 15, 18);



  stroke(255);
  fill(255, 0, 0);
  textSize(30);
  text(compScore, width * 2 / 3 - 40, height/8);
  fill(0, 0, 255);
  text(userScore, width * 2 / 3 + 40, height/8);
  fill(255);
  text("BY THE WAY:", width * 2 / 3 - 240, height/4);
  text("YOU CAN ONLY WIN", width * 2 / 3 - 240, height/4 + 36);
  text("THIS GAME", width * 2 / 3 - 240, height/4 + 72);
  text("IF YOU CAN SURVIVE", width * 2 / 3 - 240, height/4 + 108);
  text("LONG ENOUGH", width * 2 / 3 - 240, height/4 + 144);
  text("FOR THE PLAYSTATION ROBOT'S BOX", width * 2 / 3 - 240, height/4 + 180);
  text("TO MALFUNCTION.", width * 2 / 3 - 240, height/4 + 216);
  text("HAVE FUN!", width * 2 / 3 - 240, height/4 + 252);
  text("CLICK X AND PRESS CTRL + R", width * 2 / 3 - 240, height/4 + 288);
  text("TO RESTART THE GAME", width * 2 / 3 - 240, height/4 + 324);
  text("YOUR GOAL IS TO REACH 15", width * 2 / 3 - 240, height/4 + 360);
  text("BEFORE THE PLAYSTATION ROBOT DOES", width * 2 / 3 - 240, height/4 + 396);
  text("IT IS VERY EASY TO WIN", width * 2 / 3 - 240, height/4 + 432);
  text("SO DON'T LOSE", width * 2 / 3 - 240, height/4 + 468);






  if (userScore >= 15)
  {
    userScore = 15;
    fill(0, 0, 255);
    xSpeed = 0;
    ySpeed = 0;
    text("YOU WIN!!!!!!!!!!!!!", width * 2 / 3, height / 16);
  }

  if (compScore >= 15)
  {
    compScore = 15;
    fill(255, 0, 0);
    xSpeed = 0;
    ySpeed = 0;
    text("YOU LOSE!!!!!!!!!!!!!", width * 2 / 3, height / 16);
  }


  noStroke();
  rect(width * 2 / 3, 100, 100, 100);
  fill(30);
  rectMode(CENTER);
  rect(width/3 - 250, height/3 + 75/2, 150, 75);
  fill(50);
  rect(width/3 - 250, height/3 - 25/2, 125, 25);
  rect(width/3 - 250, height/3 + 225, 50, 300);


  fill(15);
  textSize(22);
  text("PS23", width/3 - 300, height/3 - 5);
  fill(10, 50, 255);
  rect(width/3 - 300, height/2 - 100, 20, 5);
  rect(width/3 - 200, height/2 - 100, 20, 5);
  fill(5);
  rect(width/3 - 250, height/2 - 75, 120, 5);
  textSize(8);
  text("CD/DVD", width/3 - 250, height/2 - 65); 
  textSize(20);

  fill(0);
  text("T", width/3 - 260, height/3 + 115 + 23*6);

  fill(10, 15, 255);
  text("P", width/3 - 260, height/3 + 115 + 23*1);
  text("A", width/3 - 260, height/3 + 115 + 23*7);

  fill(255, 0, 0);
  text("L", width/3 - 260, height/3 + 115 + 23*2);
  text("T", width/3 - 260, height/3 + 115 + 23*8);

  fill(95, 190, 75);
  text("A", width/3 - 260, height/3 + 115 + 23*3);
  text("I", width/3 - 260, height/3 + 115 + 23*9);

  fill(255, 255, 15);
  text("Y", width/3 - 260, height/3 + 115 + 23*4);
  text("O", width/3 - 260, height/3 + 115 + 23*10);

  fill(165, 10, 165);
  text("S", width/3 - 260, height/3 + 115 + 23*5);
  text("N", width/3 - 260, height/3 + 115 + 23*11);





  //  rect(width/3 - 250, height/3 + 225, 50, 300);

  rectMode(CORNER);
  fill(20);
  rect(width/3-225, height/2, 100, 25);
  rect(width/3-375, height/2, 100, 25);
  fill(0, 120, 240);
  rect(width/3-215, height/2 + 10, 90, 2);
  rect(width/3-375, height/2 + 10, 90, 2);
  
  fill(150);
  rect(width/3-225, height/2 + 200, 100, 25);
  rect(width/3-375, height/2 + 200, 100, 25);
  fill(0);
  stroke(255);
  rect(width/3-209, height/2 + 224, 67, 85);
  rect(width/3-359, height/2 + 224, 67, 85);
  
  fill(150);
  rect(width/3-225, height/2 + 200, 100, 25);
  rect(width/3-375, height/2 + 200, 100, 25);
  
  
}

