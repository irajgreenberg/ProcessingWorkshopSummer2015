//circlepong
float speedy = 3.0;
float speedx = 0.0;
float cypos = 300.0;
float cxpos = 300.0;
float aspeedy = 2.2;
float aspeedx = 2.2;
float aspos = 80.0;
float aepos = 100.0;
boolean arcmove = false;
boolean ballmove = false;
boolean ballgo = false;
boolean starttimer = false;
boolean bottomright = false;
boolean topright = false;
boolean bottomleft = false;
boolean topleft = false;
boolean alive = true;
boolean notstarted = true;
boolean gameover = false;
boolean tryagain = false;
int starttime;
int fulltime;
int highscore = 0;
boolean begin = false;
boolean keyPressedBefore = false;
boolean instructions = false;
void setup(){
  size(600,600);
  smooth();
  
}

void draw(){
 if (begin==false && instructions==false){
   HomeScreen();
   tryagain=false;
 }
 if (instructions==true){
   Instructions();
 }
 
 if (begin==true){
   GameScreen();
 }
 if (gameover==true){
   EndScreen();
 }
 if (tryagain==true){
   gameover=false;
   alive=true;
   arcmove=false;
   ballmove=false;
   ballgo=false;
   begin=false;
   notstarted=true;
   cxpos=300;
   cypos=300;
   aspos=80;
   aepos=100;
   aspeedy = 2.2;
   aspeedx = 2.2;
   speedy=2.5;
   speedx=0.0;
   HomeScreen();
 }



  
  
  
}
