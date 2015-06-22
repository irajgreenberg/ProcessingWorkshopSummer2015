void populateCredits() {
  missiles.clear();
  missiles.add(Menu_return = new MenuOption(new PVector(width-50, 30), "Return", RIGHT, CENTER));
}
void displayCredits() {
  fill(menuTextColor);
  textFont(menuScriptFont);
  textAlign(CENTER, TOP);
  strokeText("Idea, design, and coding\nby Jack Brown", width/2, 100, menuScriptColor, #000000);
  strokeText("Special thanks to Mr. Cadle,\nfor teaching me everything I know about Java.", width/2, 225, menuScriptColor, #000000);
  strokeText("Mask is a photograph of the Iron Man action figure.\nGo buy one!", width/2, 350, menuScriptColor, #000000);
}

int howToPage = 1;
void populateHowTo() {
  missiles.clear();

  switch(howToPage) {
    case 0:
      missiles.add( Menu_howToNext = new MenuOption(new PVector(width-50, 60), "Next", RIGHT, CENTER));
      break;
    case 2:  //identifying missiles
      targets.clear();
      createTargets(playerId);
      missiles.add( new Missile(new PVector(100, 250), DEFAULT_MISSILE_HEALTH, false) );
      missiles.add( new SuperMissile(new PVector(300, 250), 5*DEFAULT_MISSILE_HEALTH, false) );
      missiles.add( new SmartMissile(new PVector(500, 250), DEFAULT_MISSILE_HEALTH, false) );
      missiles.add( Menu_howToNext = new MenuOption(new PVector(width-50, 60), "Next", RIGHT, CENTER));
      for (Missile m : missiles)
        m.suppressMovement();
      break;
    case 1:  //explaining defense
      //    Missile temp;
      Target tempTarget;
  
      targets.add( tempTarget = new ImmoveableCoreTarget( new PVector(200, 475) ) );
      //    missiles.add( temp = new Missile( new PVector(200, 250), DEFAULT_MISSILE_HEALTH, false) );
      //    temp.setTarget( tempTarget );
  
      targets.add( tempTarget = new ImmoveableCoreTarget( new PVector(width-200, 475) ) );
      //    missiles.add( temp = new Missile( new PVector(400, 250), DEFAULT_MISSILE_HEALTH, false) );
      //    temp.setTarget( tempTarget );
  
      missiles.add( Menu_howToNext = new MenuOption(new PVector(width-50, 60), "Next", RIGHT, CENTER)); 
      break;
    case 3:
      missiles.add( Menu_howToNext = new MenuOption(new PVector(width-50, 60), "Next", RIGHT, CENTER)); 
      break;
    case 4:  //power ups
      missiles.add(Menu_return = new MenuOption(new PVector(width-50, 60), "Menu", RIGHT, CENTER));
      Missile m;
      for (int i = 0 ; i < POW_COLORS.length-1 ; i++) {
        m = new Missile(new PVector(width/2 + 200*((i%3)-1), 250+100*(i/3)), DEFAULT_MISSILE_HEALTH, false);
        m.setPowerUp(i+1);
        m.suppressMovement();
        missiles.add(m);
      }
      break;
  }
}
void displayHowTo() {
  textFont(menuScriptFont);
  textAlign(CENTER, TOP);
  switch(howToPage) {
  case 0:
    textFont(overheadFont);
    strokeText("Welcome, Iron Man.", width/2, 150, #FF0000);
    textFont(menuScriptFont);
    strokeText("Use the beam between your hands\nto select the \"Next\" option and proceed.", width/2, 250, menuScriptColor);
    break;
  case 2:
    strokeText("These are missiles.\nThey usually come in three varieties:", width/2, 100, menuScriptColor);
    strokeText("Regular", 100, 275, menuScriptColor);
    strokeText("Super", 300, 275, menuScriptColor);
    strokeText("Smart", 500, 275, menuScriptColor);
    strokeText("They try to hurt you.", width/2, 350, menuScriptColor);
    break;
  case 1:
    PVector lHand = new PVector(200-50, 350), rHand = new PVector(200+50, 350), 
    /*    */    lElbow= new PVector(200-40, 425), rElbow= new PVector(200+40, 425);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(lHand.x, lHand.y, lElbow.x, lElbow.y);
    line(rHand.x, rHand.y, rElbow.x, rElbow.y);
    strokeWeight(2*readyBeamWithCoordinates(lHand, rHand));
    line(lHand.x, lHand.y, rHand.x, rHand.y);
    lHand = new PVector(width-200-100, 350);
    rHand = new PVector(width-200+100, 350);
    lElbow= new PVector(width-200-70, 425);
    rElbow= new PVector(width-200+70, 425);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(lHand.x, lHand.y, lElbow.x, lElbow.y);
    line(rHand.x, rHand.y, rElbow.x, rElbow.y);
    strokeWeight(readyBeamWithCoordinates(lHand, rHand));
    line(lHand.x, lHand.y, rHand.x, rHand.y);

    strokeText("The beam you just used gets\nthicker or thinner as you move your hands.\nUse it to hurt missiles that cross it.\nA thicker beam hurts missiles more.", width/2, 100, menuScriptColor);
    break;
  case 3:
    strokeText("Missiles aim for the\nglowing targets on your body.\nDefend against them\nusing your beam as a sheild.", width/2, 100, menuScriptColor);
    break;
  case 4:
    strokeText("Missiles sometimes carry a power-up.\nBreak them to get it!", width/2, 100, menuScriptColor);
    for (int i = 0 ; i < POW_COLORS.length-1 ; i++) {
      strokeText(powType(i+1), width/2 + 200*((i%3)-1), 270+100*(i/3), menuTextColor);
    }
    break;
  }
}

