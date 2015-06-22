//2nd period
//Intermediate Computer Science
//2/27/15

import java.util.Collections;

String tempName;
int tempRanking;
float tempScore;
boolean mouseOn;
String myKey;
String totalString;
boolean pressedBefore;
boolean keyPressedBefore;
boolean numberBeingDisplayed;

ArrayList <CountryBall> ballArray;


void setup() {
  pressedBefore=false;
  tempName="0";
  mouseOn=false;
  myKey="";
  totalString="";
  keyPressedBefore=false;
  numberBeingDisplayed=false;

  ballArray=new ArrayList();
  String[]countryStrings=loadStrings("myData.txt");
  for (int i=0; i<countryStrings.length-1; i++) {
    String[] split=countryStrings[i].split(",");
    for (int y=0; y<countryStrings.length-1; y++) {

      if (countryStrings[y].equals("  ")) {
        countryStrings[y]=null;
        break;
      }
    }
    CountryBall ball = new CountryBall(split[0], split[1], split[2]);
    ballArray.add(ball);
  }
  size(1200, 900);
  //if u want to randomize order of countries
  //Collections.shuffle(ballArray);
  for (int i=0; i<ballArray.size (); i++) {
    ballArray.get(i).x=width/156*(i+1)*1.1;
    ballArray.get(i).display();
    ballArray.get(i).move();
  }
}


void draw() {
  background(255);
  textSize(75);
  noStroke();
  if (mouseOn) {

    stroke(0, 0, 255);
    strokeWeight(3);
  }
  fill(192, 192, 192);
  rect(100, 200, 300, 200);
  fill(0);
  if (mousePressed) {

    if (mouseX>=100 && mouseX<=400 && mouseY>=200 && mouseY<=400) {
      if (mouseOn&&pressedBefore==false) {
        mouseOn=false;
      } else if (mouseOn==false&&pressedBefore==false) {
        mouseOn=true;
      }
      pressedBefore=true;
    } else {

      pressedBefore=false;
    }
  } else {
    pressedBefore=false;
  }
  if (keyPressed&&mouseOn==true) {
    if (keyPressedBefore==false) {
      myKey=String.valueOf(key);
      if (myKey.equals("")) {
        if (totalString.equals("")) {
        } else {

          totalString=totalString.substring(0, totalString.length()-1);
        }

        //totalString=totalString.split(totalString,totalString.length()-1);
      } else if (totalString.length()<3&&(int(myKey)!=0 || myKey.equals("0"))) {

        totalString=totalString+myKey;
        println(totalString);
      }
    }

    keyPressedBefore=true;
  }

  if (!keyPressed) {

    keyPressedBefore=false;
  }
  if (!(myKey.equals(""))) {
    textAlign(CENTER);
    text(totalString, 250, 325);
    textAlign(LEFT);
  }
  fill(0);
  stroke(0);
  text("Top 156 Happiest Countries", 100, 80);
  rect(100, 100, 1025, 5);
  for (int i=0; i<ballArray.size (); i++) {
    ballArray.get(i).display();
    ballArray.get(i).move();
    ballArray.get(i).mouseDisplay();
  }

  for (int i=0; i<ballArray.size (); i++) {

    if (ballArray.get(i).ranking==int(totalString)) {
      text(ballArray.get(i).name, 500, 300);
      numberBeingDisplayed=true;
    }
  }
  if (isMyTextOnTheScreen()==true) {

    numberBeingDisplayed=false;
  }
  textSize(25);
  //some text when u hover over circles
  text("Country: " + tempName, width/2-50, height/2);
  text("Ranking: " + tempRanking, width/2-50, height/2+30);
  text("Score: " + tempScore, width/2-50, height/2+60);

  //here i draw my instruction thing
  if (numberBeingDisplayed==false) {
    String s = "The radius of the circles below cooresponds to their score on the happiness scale. They are arranged in order of ranking and the higher they bounce, the higher their score. Hover your mouse over any of them to have their stats and name appear on the screen. You can also click on the gray square above and enter a ranking number (from 1 to 156) to get the name of the country that has that ranking.";
    textSize(15);
    fill(50);
    text(s, 775, 200, 400, 300);
    textSize(25);
    fill(50);
    textSize(50);
    text("Instructions", 780, 175);
    textSize(25);
    fill(0);
    noFill();
    stroke(0);
    rect(765, 120, 425, 300);
    fill(0);
  }
}

boolean isMyTextOnTheScreen() {

  for (int i=0; i<ballArray.size (); i++) {

    if (ballArray.get(i).ranking==int(totalString)) {
      return false;
    }
  }
  return true;
}

