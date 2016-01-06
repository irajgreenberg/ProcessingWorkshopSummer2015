MenuOption Menu_startGame, 
/*       */Menu_credits, 
/*       */Menu_highScore, 
/*       */Menu_return, 
/*       */Menu_quit, 
/*       */Menu_howTo, 
/*       */Menu_howToNext, 
/*       */Menu_howToLast, 
/*       */Menu_returnToMenu;

color menuTextColor = #DFDF00, 
/*  */menuScriptColor = #FFFFFF;

public void populateMenu() {
  missiles.clear();
  missiles.add(Menu_startGame = new MenuOption(new PVector(200, 150), "Start Game"));
  missiles.add(Menu_credits = new MenuOption(new PVector(200, 400), "Credits"));
  missiles.add(Menu_howTo = new MenuOption(new PVector(200, 300), "Instructions"));
  missiles.add(Menu_quit = new MenuOption(new PVector(width-50, height/2), "Quit", RIGHT, CENTER));
}

public class MenuOption extends Missile {
  String name;
  int hAlign, vAlign;
  public MenuOption(PVector l, String s) {
    this(l, s, LEFT, CENTER);
  }
  public MenuOption(PVector l, String s, int hAlign, int vAlign) {
    super(l, 50, false);
    name = s;
    this.hAlign = hAlign;
    this.vAlign = vAlign;
    suppressMovement();
  }
  public void act() {
    if (!isAlive()) {
      followMenuOption(this);
    }

    addHealth(10.0/frameRate);
  }
  public void display() {
    super.display();
    textAlign(hAlign, vAlign);
    if (hAlign == LEFT)
      strokeText(name, loc().x+maxHealth(), loc().y, menuTextColor, #000000);
    else if (hAlign == RIGHT)
      strokeText(name, loc().x-maxHealth(), loc().y, menuTextColor, #000000);
    else
      strokeText(name, loc().x, loc().y, menuTextColor, #000000);
  }
  public void subtractHealth(float amount) {
    super.subtractHealth(amount/2);
  }
}

public void followMenuOption(MenuOption m) {
  if (m==null) return;
  if (m == Menu_startGame) {
    startGame(playerId, 5000);
  }
  else if (m == Menu_credits) {
    isOnCredits = true;
    populateCredits();
  } 
  else if (m == Menu_highScore) {
  }
  else if (m == Menu_howTo) {
    isOnHowTo = true;
    howToPage = 1;
    populateHowTo();
  } 
  else if (m == Menu_howToNext) {
    howToPage++;
    populateHowTo();
  } 
  else if (m == Menu_howToLast) {
    howToPage--;
    populateHowTo();
  }
  else if (m == Menu_return) {
    if (isOnCredits) {
      isOnCredits = false;
      populateMenu();
      isOnMenu = true;
    } 
    else if (isOnHowTo) {
      isOnHowTo = false;
      populateMenu();
      isOnMenu = true;
    }
  } 
  else if (m == Menu_quit) {
    resetSketch();
    overheadText = "Start pose detection.\nMake a muscleman pose\n(with your arms up!)";
  } 
  else if (m == Menu_returnToMenu) {
    isOnMenu = true;
    isOnCredits = false;
    isOnHowTo = false;
    populateMenu();
    gameEndTime = gameStartTime = -1;
  }
}

