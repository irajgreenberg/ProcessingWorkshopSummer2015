/*
SEMICOLONS_ARE_THE_DEVIL - William Choi
This program attempts a representation of a cheery winter scene as the programmer attempts to remember Java syntax.
*/
int counter = 0;
int snowheight = 280;
float nx1 = 500;
float nx2 = 500;
void renderStick(){
  fill(255);
  ellipse(400,400,50,50);//Head
  fill(255,0,0);
  beginShape();//Hat
  vertex(375,390);
  bezierVertex(400,300,440,390,450,410);
  vertex(425,390);
  endShape();
  fill(255);
  rect(370,387,60,10,7);  //Furry Rim of Hat
  ellipse(450,410,15,15); //Hat Tassel 
  rect(397,425,6,50);     //Body
  line(397,425,380,450);  //Arm
  line(403,425,420,450);  //Arm
  line(397,475,390,520);  //Leg
  line(403,475,410,520);  //Leg
  fill(230);
  rect(520,350,10,170);   //Festivus Pole
  fill(255);
  beginShape();
  vertex(0,800);
  nx1 = random(800-snowheight, nx1);
  nx2 = random(800-snowheight, nx2);
  vertex(0,800-snowheight);
  vertex(random(0,400),nx1); 
  vertex(random(400,800),nx2); 
  vertex(800,nx2);
  vertex(800,800);
  endShape();
}

void setup(){
  size(800,800);
  background(255);
  frameRate(120);
  renderStick();
  
}




void draw(){
  counter ++;
  float r = random(20);
  fill(255);
  if (counter%3 == 0){
    ellipse(random(800),random(800-snowheight),r,r); //Random Snowflakes
  }
  if(counter == 20){
    background(255);
    counter = 0;
    renderStick();
    if(snowheight < 390){
      snowheight = snowheight+2; //Increases the height of snow with each loop
    }
    else{
      fill(255,0,0);
      textSize(50);
      textAlign(CENTER);
      text("Happy Holidays!", 400, 300);
    }
  }
  
}
