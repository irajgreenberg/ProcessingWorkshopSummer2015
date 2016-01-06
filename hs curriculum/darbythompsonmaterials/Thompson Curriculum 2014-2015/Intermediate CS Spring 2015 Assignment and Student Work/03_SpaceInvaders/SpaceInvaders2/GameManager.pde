class GameManager {

  Player player;

  ArrayList<Alien> aliens;//all the arrayLists 
  ArrayList<Bullet> bullets;
  ArrayList<Bomb> bombs;
  ArrayList<Powerup> powerups;
  ArrayList<Detriment> detriments;
  ArrayList<Ammo> ammos;
  ArrayList<Missile> missiles;

  int gamemode;//various ints that keep track of info
  int bulletCount;
  int pauseCount;
  int tries;
  int wins;
  int level;

  PFont font;//external things for aesthetic purposes
  PImage alien;//did I spell aesthetic correctly?
  PImage bomb;
  PImage run;//this is the creepy easter egg pic
  PImage bullet;
  PImage ship;
  PImage space;
  PImage life;
  PImage detriment;
  PImage ammo;
  PImage missile;
  PImage help;


  GameManager() {

    player=new Player();
    bullets=new ArrayList();
    aliens=new ArrayList();
    bombs=new ArrayList();
    powerups=new ArrayList();
    detriments=new ArrayList();//this stuff sets initial values and initializes the arrayLists
    ammos=new ArrayList();
    missiles=new ArrayList();
    bulletCount=0;
    pauseCount=0;
    gamemode=0;
    level=1;
    tries=1;
    wins=0;

    font=loadFont("EurostileBold-48.vlw");
    run=loadImage("who.png");
    alien=loadImage("alien.png");
    bomb=loadImage("bomb.png");
    bullet=loadImage("bullet.png");//all the pictures and the font
    ship=loadImage("spaceship.png");
    space=loadImage("nebula.png");
    life=loadImage("life.png");
    detriment=loadImage("bad.png");
    ammo=loadImage("ammo.png");
    missile=loadImage("rocket.png");
    help=loadImage("guide.png");

    for (int x=width/5; x<4* (width/5); x=x+50) {
      for (int y=height/11; y<5* (height/13); y=y+50) {//creates the block of aliens the first time

        aliens.add(new Alien(x, y, level));
      }
    }
  }



  void display() {//this manages what shows up on screen
    image(space, 0, 0);//my custon background

    textFont(font);
    textAlign(CENTER);

    player.display();//shows the ship

    for (int i=0; i<bullets.size (); i++) {//THESE ALL SHOW all the things that exist in arrayLists
      bullets.get(i).display();
    }

    for (int i=0; i<aliens.size (); i++) {
      aliens.get(i).display();
    }

    for (int i=bombs.size ()-1; i>=0; i=i-1) {
      bombs.get(i).display();
    }

    for (int i=0; i<powerups.size (); i++) {
      powerups.get(i).display();
    }

    for (int i=0; i<detriments.size (); i++) {
      detriments.get(i).display();
    }

    for (int i=0; i<ammos.size (); i++) {
      ammos.get(i).display();
    }

    for (int i=0; i<missiles.size (); i++) {
      missiles.get(i).display();
    }

    for (int i=0; i<player.ammoCount; i++) {
      image(missile, width-150+(15*i), 60);
    }

    fill(0, 155, 0);

    /*
    GAMEMODE KEY:
     -1=instructions
     0=title
     1=playing
     2=dead
     3=won
     4=the easter egg thing
     5=pause screen
     */

    if (gamemode==0) {

      titleMenu();//shows the title menu
    }

    if (gamemode==-1) {
      instruction();//instruction screen
    }

    if (gamemode==2) {
      textSize(50);
      rectMode(CENTER);
      fill(0);
      rect(width/2, height/2-15, 475, 75);
      fill(0, 155, 0);
      text("You lose! Play again?", width/2, height/2);
      if (tries>2&& wins==0) {
        textSize(20);
        text("give up", width-90, height/2+200);//some discouraging messages if the player keeps losing
      }
    }
    if (gamemode==3) {
      textSize(50);
      text("You win! Press Space to continue.", width/2, height/2);//these are some fun custon messages and stuff I added depending on how easily the player plays
      if (tries==1) {
        textSize(50);
        text("First try. Nice.", width/2, height/2-50);
      }
      if (tries>=2&&wins==1) {
        textSize(30);
        text("You are persistent. Tenacious, even. And it paid off, didn't it?", width/2, height/2-50);
      }
      if (tries>=4&&wins==1) {
        textSize(50);
        text("Holy Cow. Never give up.", width/2, height/2-100);
      }
      if (wins==2) {
        textSize(50);
        text("Congrats. Again.", width/2, height/2-50);
      }
      if (wins>=5) {
        textSize(25);
        text("Woah there tiger, why don't you think about quitting while you're ahead?", width/2, height/2-50);
      }
    }

    if (gamemode>=0) {//basically as long as we are not on the instruction screen
      textAlign(LEFT);
      textSize(40);
      text("Lives " + player.lives, width-150, 40);
      text("Score " + player.score, 30, 40);
      text("Level " + level, width/2-60, 40);
    }

    if (gamemode==4) {
      image(run, 0, 0);//THIS IS THE CREEPY EASTER EGG but dont worry I disabled it
    }

    if (gamemode==5) {
      pauseMenu();//pause menu
    }
  }

  void titleMenu() {//this handles what is displayed on startup

    textAlign(CENTER);
    textSize(50);
    fill(0, 155, 0);
    text("Click here to start", width/2, height/2);
    text("Click here for intstructions", width/2, height/2+150);
    rectMode(CENTER);
    noFill();
    stroke(0, 155, 0);
    strokeWeight(10);
    rect(width/2, height/2-15, 450, 100);
    rect(width/2, height/2+135, 650, 100);
  }

  void instruction() {
    //this is what is displayed in the instruction screen
    textAlign(CENTER);
    background(0);
    fill(255);
    noStroke();
    textSize(50);
    text("Destroy the Aliens before they reach you!", width/2, 100);
    textSize(30);
    textAlign(LEFT);//this thing below is really long sorry but for some reason I kept it all in one long string
    text("Use the left and right arrow keys or a and d keys to move your spaceship. Press the down arrow or the s key to come to a stop. Press the up arrow, w key, or space bar to fire a bullet. Avoid bombs and slow pills falling from the sky! Try to collect health packs for extra lives, and if you pick up ammo, you can press the x key or the / key to fire missiles to take out multiple enemies at once! Press the p key at any time to pause the game. Be careful! As the levels go on, more bombs begin to fall, and the aliens move faster. Can you save us all from the alien invasion?", width/2, height/3+100, width-50, 500);
    image(help, 0, height/2);
    textSize(18);
    textAlign(CENTER);//all of this below explains each thing you might see in game
    text("This is an alien! DESTROY THESE", 175, height/2+150, 100, 100);
    text("Don't get hit by this bomb.", 300, height/2+150, 100, 100);
    text("Picking this up will temporarily slow you down.", 430, height/2+150, 100, 100);
    text("Collect this for an extra life!", 565, height/2+150, 100, 100);
    text("Pick this up to obtain the ability to shoot missiles!", 690, height/2+150, 100, 100);
    text("Fire these at a block of aliens to take out a bunch at once. That'll teach 'em!", 825, height/2+200, 100, 200);
    textSize(50);
    text("RETURN", width/2, height-100);
    noFill();
    stroke(255);
    strokeWeight(10);
    rect(width/2, height-115, 450, 100);
  }

  void pauseMenu() {//basically just shows the word PAUSED
    textSize(60);
    fill(255);
    textAlign(CENTER);
    noStroke();
    text("PAUSED", width/2, height/2);
  }

  void update() {

    if (gamemode==0) {
      if (mousePressed) {
        if (mouseX>width/2-400&&mouseX<width/2+400) {
          if (mouseY>height/2-50&&mouseY<height/2+50) {
            gamemode=1;//if clicked, the player has chosen to play the game
          }
          if (mouseY>height/2+100&&mouseY<height/2+200) {
            gamemode=-1;//this chooses the instructions screen
          }
        }
      }
    }

    if (gamemode==-1) {
      if (mousePressed&&mouseX>width/2-200&&mouseX<width/2+200&&mouseY>height-200&&mouseY<height) {
        gamemode=0;//returns to title screen from instructions
      }
    }

    if (gamemode==5&&pauseCount==0) {
      if (keyPressed) {
        if (key=='p'||key=='P') {//unpauses the game
          gamemode=1;
          pauseCount=1;
        }
      }
    }

    if (pauseCount>=1) {
      pauseCount=pauseCount+1;//makes it so that pressing the pause key doesn't toggle every single frame
    }

    if (pauseCount==10) {
      pauseCount=0;
    }

    if (gamemode==1||gamemode==3) {//this ALL happens during gameplay and between levels

      move();

      playerUpdate();

      bulletUpdate();

      alienUpdate();

      bombUpdate();

      powerupUpdate();

      detrimentUpdate();

      ammoUpdate();

      missileUpdate();

      for (int b=bullets.size ()-1; b>=0; b=b-1) {//bullet-alien collisions
        for (int a=0; a<aliens.size (); a++) {
          if (abs(bullets.get(b).x-aliens.get(a).x)<=((bullets.get(b).wide)/2+(aliens.get(a).wide)/2)&&abs(bullets.get(b).y-aliens.get(a).y)<=((bullets.get(b).tall)/2+(aliens.get(a).tall)/2)) {
            bullets.remove(b);
            aliens.remove(a);
            player.gainPoints(500);
            break;
          }
        }
      }


      if (aliens.size()!=0) {//randomly decides each frame whether to drop a bomb and then assigns the bomb to a random alien, as long as there are aliens in existence
        if (int(random(0, 413/level))==0) {
          int randomAlien=int(random(0, aliens.size()));
          bombs.add(new Bomb(aliens.get(randomAlien).x, aliens.get(randomAlien).y));
        }
      }

      if (player.lives<=0) {//death detection
        gamemode=2;
        player.gainPoints(-300);
      }

      if (gamemode==1&&aliens.size()<=0) {//win detection
        gamemode=3;
        wins=wins+1;
        bombs.clear();
        powerups.clear();
      }

      for (int m=missiles.size ()-1; m>=0; m=m-1) {//this removes a bunch of aliens within a radius of the one alien the missile hit
        for (int a=0; a<aliens.size (); a++) {
          if (abs(missiles.get(m).x-aliens.get(a).x)<=((missiles.get(m).wide)/2+(aliens.get(a).wide)/2)&&abs(missiles.get(m).y-aliens.get(a).y)<=((missiles.get(m).tall)/2+(aliens.get(a).tall)/2)) {
            for (int i=aliens.size ()-1; i>=0; i=i-1) {
              if (abs(missiles.get(m).x-aliens.get(i).x)<=100&&abs(missiles.get(m).y-aliens.get(i).y)<=100) {
                aliens.remove(i);
                player.gainPoints(400);
              }
            }
            missiles.remove(m);
            break;
          }
        }
      }

      if (keyPressed&&pauseCount==0) {//pauses the game
        if (key=='p'||key=='P') {
          gamemode=5;
          println("pause");
          pauseCount=1;
        }
      }
    }
    /*  this is all debug cheats I had
    if (key=='y') {
      aliens.clear();
    }
    if (key=='b') {
      bombs.add(new Bomb(500, 500));
    }
    if (key=='l') {
      powerups.add(new Powerup(500, 500));
    }
    if (key=='m') {
      player.addAmmo(20);
    }
    */



    if (gamemode==3) {//
      if (keyPressed) {
        if (key==' ') {
          game.reset(true);//continues to next level
        }
      }
    }

    if (gamemode==2) {
      if (mousePressed) {
        if (mouseX>250&&mouseX<750&&mouseY>460&&mouseY<540) {///resets to level 1
          game.reset(false);
        }
      }
    }



    if (player.runCount>=9) {
     // gamemode=4;//this is the easter egg thing uncomment this if you want your dreams haunted by a scary picture
    }
  }

  void move() {//basic code that moves everything, no real LOGIC involved

    player.move();

    for (int i=bullets.size ()-1; i>=0; i=i-1) {
      bullets.get(i).move();
    }

    for (int i=0; i<aliens.size (); i++) {
      aliens.get(i).move();
    }

    for (int i=powerups.size ()-1; i>=0; i=i-1) {
      powerups.get(i).move();
    }

    for (int i=bombs.size ()-1; i>=0; i=i-1) {
      bombs.get(i).move();
    }

    for (int i=detriments.size ()-1; i>=0; i=i-1) {
      detriments.get(i).move();
    }

    for (int i=ammos.size ()-1; i>=0; i=i-1) {
      ammos.get(i).move();
    }

    for (int i=missiles.size ()-1; i>=0; i=i-1) {
      missiles.get(i).move();
    }
  }

  void playerUpdate() {//really only controls the speed change

    if (player.speedCount>=1) {
      player.speedCount=player.speedCount+1;
    }

    if (player.speedCount>480) {

      player.regainSpeed();
    }
  }

  void bulletUpdate() {//all the bullet logic

    for (int i=bullets.size ()-1; i>=0; i=i-1) {
      if (bullets.get(i).y<=0-(bullets.get(i).tall)) {//bullet goes off screen
        bullets.remove(i);
        player.gainPoints(-10);
      }
    }

    if (bulletCount>=1) {
      bulletCount=bulletCount+1;//bullet delay
    }
    if (bulletCount==30) {
      bulletCount=0;
    }

    if (keyPressed&&(keyCode==UP||key==' '||key=='w'||key=='W')&&bulletCount==0&&game.bullets.size()<=4) {//bullet adding
      game.bullets.add(new Bullet(game.player.x));
      bulletCount=1;
    }
  }

  void bombUpdate() {

    for (int i=bombs.size ()-1; i>=0; i=i-1) {
      if (bombs.get(i).y>=height+bombs.get(i).tall) {//bomb goes off screen
        bombs.remove(i);
      }
    }

    for (int i=bombs.size ()-1; i>=0; i=i-1) {
      if (abs(bombs.get(i).x-player.x)<=((bombs.get(i).wide)/2+player.wide/2)&&abs(bombs.get(i).y-player.y)<=((bombs.get(i).tall)/2+player.tall/2)) {//bomb/player collisions
        bombs.remove(i);
        player.loseLife(1);
        player.gainPoints(-200);
      }
    }
  }

  void alienUpdate() {


    for (int i=0; i<aliens.size (); i++) {
      if (aliens.get(i).y+aliens.get(i).tall>=height) {//if aliens reach bottom screen
        gamemode=2;
        player.gainPoints(-600);
      }
      if (aliens.get(i).x<(aliens.get(i).wide)/2||aliens.get(i).x>width-(aliens.get(i).wide)/2) {//if aliens hit the wall
        for (int check=0; check<aliens.size (); check++) {
          aliens.get(check).changeSpeed();
        }
        player.gainPoints(-50);
        break;
      }
    }
  }

  void powerupUpdate() {

    for (int i=powerups.size ()-1; i>=0; i=i-1) { 
      if (powerups.get(i).y>=height+powerups.get(i).tall) {//powerup goes off screen
        powerups.remove(i);
      }
    }

    for (int i=powerups.size ()-1; i>=0; i=i-1) {
      if (abs(powerups.get(i).x-player.x)<=((powerups.get(i).wide)/2+player.wide/2)&&abs(powerups.get(i).y-player.y)<=((powerups.get(i).tall)/2+player.tall/2)) {//player collects
        powerups.remove(i);
        player.loseLife(-1);
        player.gainPoints(100);
      }
    }

    if (level>1&&aliens.size()>0) {
      if (int(random(0, 1500))==1) {
        int randomX=int(random(0, width));
        int randomY=int(random(height/5, height/2));//powerup drop controls
        powerups.add(new Powerup(randomX, randomY));
      }
    }
  }

  void detrimentUpdate() {

    for (int i=detriments.size ()-1; i>=0; i=i-1) { 
      if (detriments.get(i).y>=height+detriments.get(i).tall) {//detriment goes offscreen
        detriments.remove(i);
      }
    }

    for (int i=detriments.size ()-1; i>=0; i=i-1) {
      if (abs(detriments.get(i).x-player.x)<=((detriments.get(i).wide)/2+player.wide/2)&&abs(detriments.get(i).y-player.y)<=((detriments.get(i).tall)/2+player.tall/2)) {//detriment hits the player
        detriments.remove(i);
        player.loseSpeed();
        player.gainPoints(-40);
      }
    }

    if (level>1&&aliens.size()>0) {//drops a detriment
      if (int(random(0, 3000/(level-1)))==1) {
        int randomX=int(random(0, width));
        int randomY=int(random(height/5, height/2));
        detriments.add(new Detriment(randomX, randomY));
      }
    }
  }

  void ammoUpdate() {

    for (int i=ammos.size ()-1; i>=0; i=i-1) {//ammos go offscreen
      if (ammos.get(i).y>=height+ammos.get(i).tall) {
        ammos.remove(i);
      }
    }

    for (int i=ammos.size ()-1; i>=0; i=i-1) {
      if (abs(ammos.get(i).x-player.x)<=((ammos.get(i).wide)/2+player.wide/2)&&abs(ammos.get(i).y-player.y)<=((ammos.get(i).tall)/2+player.tall/2)) {//ammo hits player
        ammos.remove(i);
        player.addAmmo(1);
        player.gainPoints(10);
      }
    }
    if (level>2&&aliens.size()>0) {
      if (int(random(0, 3000))==1) {
        int randomX=int(random(0, width));
        int randomY=int(random(height/5, height/2));//drops ammo
        ammos.add(new Ammo(randomX, randomY));
      }
    }
  }

  void missileUpdate() {

    for (int i=missiles.size ()-1; i>=0; i=i-1) {
      if (missiles.get(i).y<=0-(missiles.get(i).tall)) {//missile goes offscreen
        missiles.remove(i);
        player.gainPoints(-100);
      }
    }

    if (keyPressed&&(key=='/'||key=='x'||key=='X')&&game.missiles.size()<=0&&player.ammoCount>=1) {//player shoots missile
      game.missiles.add(new Missile(game.player.x));
      player.addAmmo(-1);
    }
  }

  void reset(boolean win) {//game reset code

    player.reset(win);
    aliens.clear();
    bullets.clear();
    bombs.clear();
    powerups.clear();
    detriments.clear();
    ammos.clear();
    missiles.clear();
    bulletCount=0;
    gamemode=1;

    tries=tries+1;
    if (win) {//if they win vs if they lose, next level or not
      level=level+1;
    } else {
      level=1; 
      wins=0;
    }

    for (int x=width/5; x<4* (width/5); x=x+50) {
      for (int y=height/11; y<5* (height/13); y=y+50) {//re-creates the alien block

        aliens.add(new Alien(x, y, level));
      }
    }
  }
}

