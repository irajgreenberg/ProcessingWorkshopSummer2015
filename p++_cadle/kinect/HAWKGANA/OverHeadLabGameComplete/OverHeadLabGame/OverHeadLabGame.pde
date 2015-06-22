import SimpleOpenNI.*;
import java.awt.Color;
SimpleOpenNI kinect;

//indicate frozen

ArrayList<Color> colors;
ArrayList<Integer> pix;
int r;
int g;
int b;
int pixelCount;
int endTime;
int gameTime;
int startTime;
int player1Size;
int player2Size;

boolean playing;
boolean started;
boolean ended;
boolean blueWin;
boolean tie;

//powerUps PIV's
int powerX;
int powerY;
int sze;
boolean inPlay;
int paintX;
int paintY;
boolean paintPlay;
int paintSize;
int freezeTime;

int player1X;
int player1Y;
int player2X;
int player2Y;

//powerUps booleans
boolean player1Bigger;
boolean player2Bigger;
boolean player1Smaller;
boolean player2Smaller;
boolean bigger;
boolean smaller;
boolean paint;
boolean freeze;
boolean player1Paint;
boolean player2Paint;
boolean player1Frozen;
boolean player2Frozen;

float player1Dist;
float player2Dist;

void setup()
{
  size(screenWidth, screenHeight);
  textSize(35);
  kinect = new SimpleOpenNI(this);
  kinect.setMirror(true);
  kinect.enableDepth();
  kinect.enableUser(SimpleOpenNI.SKEL_PROFILE_NONE);
  background(0);
  pix = new ArrayList<Integer>();
  pix.add(0);
  pix.add(0);
  colors = new ArrayList<Color>();
  r = 13;
  g = 255;
  b = 241;
  colors.add(new Color(r, g, b));
  r = 242;
  g = 0;
  b = 14;
  colors.add(new Color(r, g, b));

  background(0);
  pixelCount = 0;
  endTime = 0;
  startTime = 10000;

  player1Size=60;
  player2Size=60;

  sze=20;
  paintSize=300;

  started = false;
  playing = true;
  blueWin = true;
  tie = false;
  ended = false;
  inPlay=true;
  paintPlay=true;
  player1Frozen=false;
  player2Frozen=false;
}

void draw()
{



  if (startTime==10000)
  {
    fill(255);
    stroke(255);
    strokeWeight(5);
    line(410, 0, 0, 370);
    line(width-410, 0, width, 370);

    //player1 stats
    fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
    text("Player 1 ", 30, 50);
    text("Score: " + pix.get(0), 30, 90);
    text("Time: " + 30, 30, 130);
    //player 2 stats
    fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
    text("Player 2 ", width-230, 50);
    text("Score: " + pix.get(1), width-230, 90);
    text("Time: " + 30, width-230, 130);
  }

  textSize(800);
  textAlign(CENTER);
  noStroke();
  if ((10000-millis()) >4000==true)
  {
    paintDiamond();
    paintPeople();
    textSize(800);
    fill(0, 255, 0);
    text("5", width/2, height/2+280);

    fill(255, 0, 255);
    ellipse(250, height-150, 20, 20);
    textSize(20);
    text("makes other smaller", 363, height-145);
    rect(240, height-120, 20, 20);
    text("makes you bigger", 350, height-103);

    fill(255, 255, 0);
    ellipse(900, height-150, 20, 20);
    text("is a bomb", 965, height-142);
    rect(890, height-120, 20, 20);
    text("freezes the opponent", 1020, height-103);
  }
  if ((10000-millis()>3000)==true&&(10000-millis()<=4000)==true)
  {
    paintDiamond();
    paintPeople();
    textSize(800);
    fill(0, 255, 0);
    text("4", width/2, height/2+280);

    fill(255, 0, 255);
    ellipse(250, height-150, 20, 20);
    textSize(20);
    text("makes other smaller", 363, height-145);
    rect(240, height-120, 20, 20);
    text("makes you bigger", 350, height-103);

    fill(255, 255, 0);
    ellipse(900, height-150, 20, 20);
    text("is a bomb", 965, height-142);
    rect(890, height-120, 20, 20);
    text("freezes the opponent", 1020, height-103);
  }
  if ((10000-millis()>2000)==true&&(10000-millis()<=3000)==true)
  {
    paintDiamond();
    paintPeople();
    textSize(800);
    fill(0, 255, 0);
    text("3", width/2, height/2+280);
    fill(255, 0, 255);
    ellipse(250, height-150, 20, 20);
    textSize(20);
    text("makes other smaller", 363, height-145);
    rect(240, height-120, 20, 20);
    text("makes you bigger", 350, height-103);

    fill(255, 255, 0);
    ellipse(900, height-150, 20, 20);
    text("is a bomb", 965, height-142);
    rect(890, height-120, 20, 20);
    text("freezes the opponent", 1020, height-103);
  }
  if ((10000-millis()>1000)==true&&(10000-millis()<=2000)==true)
  {
    paintDiamond();
    paintPeople();
    textSize(800);
    fill(0, 255, 0);
    text("2", width/2, height/2+280);

    fill(255, 0, 255);
    ellipse(250, height-150, 20, 20);
    textSize(20);
    text("makes other smaller", 363, height-145);
    rect(240, height-120, 20, 20);
    text("makes you bigger", 350, height-103);

    fill(255, 255, 0);
    ellipse(900, height-150, 20, 20);
    text("is a bomb", 965, height-142);
    rect(890, height-120, 20, 20);
    text("freezes the opponent", 1020, height-103);
  }
  if ((10000-millis()>0)==true&&(10000-millis()<=1000)==true)
  {
    paintDiamond();
    paintPeople();
    textSize(800);
    fill(0, 255, 0);
    text("1", width/2, height/2+280);

    fill(255, 0, 255);
    ellipse(250, height-150, 20, 20);
    textSize(20);
    text("makes other smaller", 363, height-145);
    rect(240, height-120, 20, 20);
    text("makes you bigger", 350, height-103);

    fill(255, 255, 0);
    ellipse(900, height-150, 20, 20);
    text("is a bomb", 965, height-142);
    rect(890, height-120, 20, 20);
    text("freezes the opponent", 1020, height-103);
  }

  startTime = 10000-millis();
  if (startTime <= 0&&!started)
  {
    paintDiamond();
    paintPeople();
    textSize(400);
    fill(0, 255, 0);
    text("PAINT", width/2, height/2+100);
    started = true;
  }


  /////GAME STARTED!!!!
  if (playing&&started&&!ended)
  {
    kinect.update();

    IntVector userList = new IntVector();
    kinect.getUsers(userList);

    textSize(35);
    textAlign(LEFT);

    fill(0);
    stroke(0);
    beginShape();
    vertex(0, 0);
    vertex(405, 0);
    vertex(0, 365);
    endShape();
    beginShape();
    vertex(width-405, 0);
    vertex(width, 0);
    vertex(width, 365);
    endShape();

    pix.set(0, 0);
    pix.set(1, 0);

    fill(255);
    stroke(255);
    strokeWeight(5);
    line(410, 0, 0, 370);
    line(width-410, 0, width, 370);


    for (int i = 0; i<userList.size();i++)
    {
      int userId = userList.get(i);
      PVector position = new PVector();
      kinect.getCoM(userId, position);
      position.z = map(position.z, 700, 3000, 0, height);
      position.x = map(position.x, -1000, 1000, 0, width);
      if (i==0)
        player1Dist = dist(position.x, position.z, powerX, powerY);
      if (i==1)
        player2Dist = dist(position.x, position.z, powerX, powerY);
      if (i<2)
      {
        fill(colors.get(i).getRed(), colors.get(i).getGreen(), colors.get(i).getBlue());
        stroke(colors.get(i).getRed(), colors.get(i).getGreen(), colors.get(i).getBlue());
        if (i==0&&!player1Frozen)
        {
          ellipse(position.x, position.z, player1Size, player1Size);
          player1X=(int)position.x;
          player1Y=(int)position.z;
        }
        if (i==1&&!player2Frozen)
        {
          ellipse(position.x, position.z, player2Size, player2Size);
          player2X=(int)position.x;
          player2Y=(int)position.z;
        }
      }
    }

    loadPixels();
    pixelCount = pixels.length-41800;

    for (int i = 0; i<pixels.length;i+=3)
    {
      if (colors.get(0).getRed() == red(pixels[i]))
        pix.set(0, pix.get(0).intValue()+3);
      if (colors.get(1).getRed() == red(pixels[i]))
        pix.set(1, pix.get(1).intValue()+3);
    }

    gameTime = (int)((40000-millis())/1000);

    //player1 stats
    fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
    text("Player 1 ", 30, 50);
    text("Score: " + pix.get(0)/10, 30, 90);
    text("Time: " + gameTime, 30, 130);
    //player 2 stats
    fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
    text("Player 2 ", width-230, 50);
    text("Score: " + pix.get(1)/10, width-230, 90);
    text("Time: " + gameTime, width-230, 130);

    //display frozen

    if (player2Frozen)
    {
      textSize(25);
      fill(255, 255, 0);
      stroke(255, 255, 0);
      text("Frozen!", width-225, 155);
      fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      ellipse(player2X, player2Y, player2Size, player2Size);
    }
    if (player1Frozen)
    {
      textSize(25);
      fill(255, 255, 0);      
      stroke(255, 255, 0);
      text("Frozen!", 35, 155);
      fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      ellipse(player1X, player1Y, player1Size, player1Size);
    }



    if (inPlay&&gameTime==20)
    {
      noStroke();
      int rndm = (int)(random(0, 4));
      //PLACING POWERUPS IN FIELD OF PLAY************************************
      if (rndm==1)
      {
        fill(255, 0, 255);
        bigger = true;
      }
      if (rndm==0)
      {
        fill(255, 0, 255);
        smaller = true;
      }
      if (rndm==2)
      {
        fill(255, 255, 0);
        paint = true;
      }
      if (rndm==3)
      {
        fill(255, 255, 0);
        freeze=true;
      }


      powerX = (int)(random(0, 800)) + ((screenWidth) - 800)/2;
      powerY = (int)(random(0, 400)) + ((screenHeight) - 400)/2;
      if (powerX < (width/2)-400 && powerY < (height/2)-200)
        if (powerX > (width/2)+400 && powerY > (height/2)+200)
          inPlay = inPlay;     
      if (inPlay = true)
      {
        if (rndm==0||rndm==2)
          ellipse(powerX, powerY, sze, sze);
        if (rndm==1||rndm==3)
          rect(powerX, powerY, sze, sze);
      }
      inPlay = !inPlay;
      //*********************************************************************
    }

    if (player1Dist<=30&&bigger&&!player2Bigger)
    {
      player1Bigger=true;
      bigger=false;
      player1Size += 20;
    }
    if (player2Dist<=30&&bigger&&!player1Bigger)
    {
      player2Bigger=true;
      bigger=false;
      player2Size += 20;
    }
    if (player1Dist<=30&&smaller&&!player2Smaller)
    {
      player1Smaller=true;
      smaller=false;
      player2Size -= 20;
    }
    if (player2Dist<=30&&smaller&&!player1Smaller)
    {
      player2Smaller=true;
      smaller=false;
      player1Size -= 20;
    }
    if (player1Dist<=30&&paint&&!player2Paint)
    {
      player1Paint=true;
      paint=false;

      fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      stroke(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      paintX = (int)(random(0, 800)) + ((screenWidth) - 800)/2;
      paintY = (int)(random(0, 400)) + ((screenHeight) - 400)/2;
      if (paintX < (width/2)-400 && powerY < (height/2)-200)
        if (paintX > (width/2)+400 && powerY > (height/2)+200)
          paintPlay = paintPlay;     
      if (paintPlay = true)
        ellipse(paintX, paintY, paintSize, paintSize);
      paintPlay = !paintPlay;
    }
    if (player2Dist<=30&&paint&&!player1Paint)
    {
      player2Paint=true;
      paint=false;

      fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      stroke(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      paintX = (int)(random(0, 800)) + ((screenWidth) - 800)/2;
      paintY = (int)(random(0, 400)) + ((screenHeight) - 400)/2;
      if (paintX < (width/2)-400 && powerY < (height/2)-200)
        if (paintX > (width/2)+400 && powerY > (height/2)+200)
          paintPlay = paintPlay;     
      if (paintPlay = true)
        ellipse(paintX, paintY, paintSize, paintSize);
      paintPlay = !paintPlay;
    }
    if (player1Dist<=30&&freeze&&!player2Frozen)
    {
      player2Frozen=true;
      freeze=false;
      freezeTime=millis();
    }
    if (player2Dist<=30&&freeze&&!player1Frozen)
    {
      player1Frozen=true;
      freeze=false;
      freezeTime=millis();
    }


    if (freezeTime-millis()<-3000)
    {
      player1Frozen=false;
      player2Frozen=false;
    }



    if (!inPlay&&gameTime==10)
    {
      noStroke();
      int rndm = (int)(random(0, 4));
      //PLACING POWERUPS IN FIELD OF PLAY************************************
      if (rndm==1)
      {
        fill(255, 0, 255);
        bigger = true;
      }
      if (rndm==0)
      {
        fill(255, 0, 255);
        smaller = true;
      }
      if (rndm==2)
      {
        fill(255, 255, 0);
        paint = true;
      }
      if (rndm==3)
      {
        fill(255, 255, 0);
        freeze=true;
      }


      powerX = (int)(random(0, 800)) + ((screenWidth) - 800)/2;
      powerY = (int)(random(0, 400)) + ((screenHeight) - 400)/2;
      if (powerX < (width/2)-400 && powerY < (height/2)-200)
        if (powerX > (width/2)+400 && powerY > (height/2)+200)
          inPlay = inPlay;     
      if (inPlay = true)
      {
        if (rndm==0||rndm==2)
          ellipse(powerX, powerY, sze, sze);
        if (rndm==1||rndm==3)
          rect(powerX, powerY, sze, sze);
      }
      inPlay = true;
      //*********************************************************************
    }

    endTime=40000-millis();

    if (endTime<=0)
    {
      if (pix.get(0)>pix.get(1))
      {
        blueWin = true;
      }
      else if (pix.get(0)<pix.get(1))
      {
        blueWin = false;
      }
      else
      {
        tie = true;
      }
      playing = false;
      ended = true;
    }
  }

  if (ended)
  {
    if (blueWin&&!tie)
    {
      textSize(35);
      textAlign(LEFT);
      //print blue wins
      fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      beginShape();
      vertex(410, 0);
      vertex(0, 370);
      vertex(0, 0);
      endShape();
      fill(0);
      //player1 stats
      //fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      text("Player 1 ", 30, 50);
      text("Score: " + pix.get(0)/10, 30, 90);
      text("Time: " + gameTime, 30, 130);

      fill(255);
      stroke(255);
      strokeWeight(5);
      line(410, 0, 0, 370);
      line(width-410, 0, width, 370);

      println("blue wins");
    }
    if (!blueWin&&!tie)
    {
      textSize(35);
      textAlign(LEFT);
      //print red wins
      fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      beginShape();
      vertex(width-410, 0);
      vertex(width, 370);
      vertex(width, 0);
      endShape();
      fill(0);
      //fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      text("Player 2 ", width-230, 50);
      text("Score: " + pix.get(1)/10, width-230, 90);
      text("Time: " + gameTime, width-230, 130);

      fill(255);
      stroke(255);
      strokeWeight(5);
      line(410, 0, 0, 370);
      line(width-410, 0, width, 370);
      println("red wins");
    }
    if (tie)
    {
      textSize(35);
      textAlign(LEFT);
      //print tie
      fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      beginShape();
      vertex(410, 0);
      vertex(0, 370);
      vertex(0, 0);
      endShape();
      fill(0);
      //player1 stats
      //fill(colors.get(0).getRed(), colors.get(0).getGreen(), colors.get(0).getBlue());
      text("Player 1 ", 30, 50);
      text("Score: " + pix.get(0)/10, 30, 90);
      text("Time: " + gameTime, 30, 130);

      fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      beginShape();
      vertex(width-410, 0);
      vertex(width, 370);
      vertex(width, 0);
      endShape();
      fill(0);

      //player 2 stats
      //fill(colors.get(1).getRed(), colors.get(1).getGreen(), colors.get(1).getBlue());
      text("Player 2 ", width-230, 50);
      text("Score: " + pix.get(1)/10, width-230, 90);
      text("Time: " + gameTime, width-230, 130);

      fill(255);
      stroke(255);
      strokeWeight(5);
      line(410, 0, 0, 370);
      line(width-410, 0, width, 370);

      println("tie");
    }
  }
}

void paintDiamond()
{
  fill(0);
  noStroke();
  beginShape();
  vertex(415, 0);
  vertex(width-415, 0);
  vertex(width, 375);
  vertex(width, height);
  vertex(0, height);
  vertex(0, 375);
  vertex(415, 0);
  endShape();
}

void paintPeople()
{
  kinect.update();

  IntVector userList = new IntVector();
  kinect.getUsers(userList);
  for (int i = 0; i<userList.size();i++)
  {
    int userId = userList.get(i);
    PVector position = new PVector();
    kinect.getCoM(userId, position);
    position.z = map(position.z, 700, 3000, 0, height);
    position.x = map(position.x, -1000, 1000, 0, width);
    if (i<2)
    {
      fill(colors.get(i).getRed(), colors.get(i).getGreen(), colors.get(i).getBlue());
      stroke(colors.get(i).getRed(), colors.get(i).getGreen(), colors.get(i).getBlue());
      ellipse(position.x, position.z, player1Size, player1Size);
    }
  }
  noStroke();
}

