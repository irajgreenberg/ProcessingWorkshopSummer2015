/*                                           .D8DOD88..     
                                           .,DZZZZZZZDD.    
                                          ..NZZZZZZZZZZO    
                                          ..8Z8ZZZZZZZZZO.  
              .   ...OD8DDD8                  .O8ZZZZZZZDZ. 
          . .,DDD88ZZZZZZZ8N     ..D888D8.     ..8ZZZZZZZ8. 
      . .D88ZZZZZZZZZZZZZOD. . .DNZZZZZZZZ88.   ..DZZZZZZ8. 
     ,8ODZZZZZZZZZZZZZZZOD.   .D8OZZZZZZZZZOD.   ..8ZZZZZ8D 
   ..DZZZZZZZZZZZZZZZZZZ8.. .88OZZZZZZZZZZZZ8D.   .DZZZZZZ8.
  .88ZZZZZZZZZZZZZZZZZZD,. .,DZZZZZZZZZZZZZZZ8.   ..DZZZZZ8.
 .DNZZZZZZZZZZZ$D8ZZZZD8  ..8ZZZZZZ$88ZZZZZZZDD   ..DZZZZZD.
.DDZZZZZZZD88D8.DZZZZZO. ..DZZZZZOO...8DZZZZZZ8    .DZZZZZD.
$8ZZZZZZ88,.  ,OZZZZZD,  .D8ZZZZDD     DZZZZZZ8     DZZZZZD.
8ZZZZZ8D..   .88ZZZZDD. ..DZZZZ$8.     8ZZZZZZD.    DZZZZZ8.
DZZZZZD8.    O8ZZZZZ8.  .8ZZZZZ8.      8ZZZZZZ8.  ..8ZZZZZD.
8ZZZZZZZDD .,8ZZZZZ8.   .DZZZZ88.      8ZZZZZZD     DZZZZ88.
8ZZZZZZZZD.,8ZZZZZD8.  .8DZZZZD8     ..DZZZZZ8,   ..8ZZZZD, 
.DZZZZZZZ8.88ZZZZZ8..  .DZZZZZ8..    .N8ZZZZZD.   .D8ZZZZD. 
..8ZZZZZZD.DZZZZZDD.   .8ZZZZZ8.     .8ZZZZZZD.   .8OZZZZD. 
  ..DDD8D.8ZZZZZZ8      DZZZZZ8.    .7DZZZZZ87.  .DDZZZZ8.. 
   .......DZZZZZDD     .8ZZZZZ8.    .8ZZZZZZD.   .DZZZZZD.  
         8ZZZZZZD.     .DZZZZZ8.    .8ZZZZZ88   ..8ZZZZD:.  
        .DZZZZZ$D      .8ZZZZZ8.   .8ZZZZZZ8.    DZZZZZ8..  
        88ZZZZZ8.      .8ZZZZZ88.  .8ZZZZZ8,.   DZZZZZD.    
        8ZZZZZO8.      .D8ZZZZZ8. ,8ZZZZZ8.   .DDZZZZ8N     
        DZZZZZZ8        .8ZZZZZ8. DOZZZZ88....8OZZZZZ8.     
       .DZZZZZDN        .8ZZZZZZN.8ZZZZOD. ..DZZZZZZ8.      
       .DZZZZZD.        ..D$ZZZZ88ZZZZ8N. .DOZZZZZZDZ       
        8ZZZZZ8O          .8ZZZZZZZZZ8D..D8ZZZZZZZD..       
       .DZZZZZD8          ..DZZZZZZZZ888ZZZZZZZZZ8..        
        ZZZZZZZD.       ...8OZZZZZZZZZZZZZZZZZZ8Z.          
        .8ZZZZZZD.     ..88ZZZZZZZZZZZZZZZZZZD8.            
        .8ZZZZZZZ8D88D88DZZZZZZZ88DZZZZZZZDDD..             
         .OZZZZZZZZZZZZZZZZZZZ8D.  .D8888..           ashington Nationals Data Visualization
          .88ZZZZZZZZZZZZZZZZ88..                           
           .DDZZZZZZZZZZZZ88D.                              
             .ZND88DDD8DD8..                                
                ........                                    
 This program displays a graph of Nats scores throughout the 2013 season. It can be sorted by all games, NL games, and NL East games.
 Games are placed on the graph in chronological order unless QuickDraw is toggled off.
 
 By Sam Ringel
*/
ArrayList<Game> Games;
int increaser;
char theKey;
int a;
void setup() {
  Games = new ArrayList<Game>();
  increaser=0;
  a=0;
  theKey='1';
  String[] lines = loadStrings("2013.txt");
  for (int i=0;i<lines.length;i++) {
    Game thisGame;
    String[] splitLines = split(lines[i], ",");
    int aa = int(splitLines[7]);
    int bb = int(splitLines[8]);
    String cc = splitLines[5];
    thisGame = new Game(aa, bb, cc);
    Games.add(thisGame);
  }
  int highScore1=0;
  int highScore2=0;
  for (int i=0;i<Games.size();i++) {
    if (Games.get(i).scoreFor>highScore1) {
      highScore1=Games.get(i).scoreFor;
    }
    if (Games.get(i).scoreAgainst>highScore2) {
      highScore2=Games.get(i).scoreAgainst;
    }
  }
  size(highScore1*50+160, highScore2*50+110);
}

void draw() {
  background(0);
  textSize(12);
  for (int i=0;i<10;i++) {
    text(str(i), 12+50*i, 80);
  }
  for (int j=0;j<4;j++) {
    text(str(j+10), 510+50*(j), 80);
  }
  text("14", 708, 80);
  for (int i=0;i<15;i++) {
    text(str(i), width-125, height-(10+50*i));
  }
  text("15", width-125, height-757);
  text("Press 1 for every game", width-420, 10);
  text("Press 2 for games in the NL", width-340, 28);
  text("Press 3 for games in the NL East", width-260, 46);
  text("Press 4 to toggle QuickDraw",width-180,64);
  textSize(30);
  text("RUNS    BY", 50, 40);
  text("R", width-49, 200);
  text("U", width-50, 230);
  text("N", width-51, 260);
  text("S", width-49, 290);
  text("B", width-50, 360);
  text("Y", width-51, 390);
  fill(0, 0, 255);
  text("O", width-51, 460);
  text("P", width-49, 490);
  text("P", width-49, 520);
  text("O", width-51, 550);
  text("N", width-50, 580);
  text("E", width-49, 610);
  text("N", width-50, 640);
  text("T", width-49, 670);
  fill(255, 0, 0);
  text("NATIONALS", 250, 40);
  fill(255);
  stroke(255);
  line(0, 90, width-140, 90);
  line(width-140, 90, width-140, height);
  if (theKey=='1') {
    for (int i=0;i<Games.size();i++) {
      if (i<increaser) {
        Games.get(i).plot();
      }
    }
  }
  if (theKey=='3') {
    for (int i=0;i<Games.size();i++) {
      if (i<increaser) {
        if (Games.get(i).NLEast==true) {
          Games.get(i).plot();
        }
      }
    }
  }
  if (theKey=='2') {
    for (int i=0;i<Games.size();i++) {
      if (i<increaser) {
        if (Games.get(i).NatLe==true) {
          Games.get(i).plot();
        }
      }
    }
  }
  increaser=increaser+1;
}

void keyPressed() {
  if (key=='4') {
    if (a==0) {
      a=163;
    }
    else if (a==163) {
      a=0;
    }
    increaser=a;
  }
  if (key=='1'||key=='2'||key=='3') {
    theKey=key;
    increaser=a;
  }
}

