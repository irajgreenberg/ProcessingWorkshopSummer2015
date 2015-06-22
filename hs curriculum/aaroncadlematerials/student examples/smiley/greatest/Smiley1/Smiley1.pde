
void setup()
{
 size(800,700);
 background(255); 
}

void draw()
{
  println(mouseX+" "+mouseY);
 
 //stomache
 
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(100,690);
  rotate(PI/4);
  ellipse(0,0,50,300);
  popMatrix();
 
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  ellipse(350,780,500,500);
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(560,705);
  rotate(PI/9);
 arc(0,0,100,100,0,PI);
  popMatrix();
 

  //ears
 
  
   stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(550,275);
  rotate(PI/2);
  arc(0,0,250,100,PI,2*PI);
  popMatrix();
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,0);
  pushMatrix();
  translate(430,250);
  rotate(PI/2);
  arc(0,0,250,100,PI,2*PI);
  popMatrix();
  
  
  
    stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(360,295);
  rotate(PI/8);
  arc(0,0,155,375,PI,2*PI);
  popMatrix();
  
    stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(480,320);
  rotate(PI/8);
  arc(0,0,175,375,PI,2*PI);
  popMatrix();
  
  //head
  
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(200,355);
  rotate(PI/8);
  ellipse(0,0,105,350);
  popMatrix(); 
  
   stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(578,510);
  rotate(PI/8);
  ellipse(0,0,105,350);
  popMatrix();
  

  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(260,190);
  rotate(PI/8);
  rect(0,0,425,350);
  popMatrix();
  
  noStroke();
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(258,192);
  rotate(PI/8);
  rect(0,0,429,349);
  popMatrix();
  
   stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(454,275);
  rotate(PI/8);
  arc(0,0,430,50,PI,2*PI);
  popMatrix();
  
   stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(325,590);
  rotate(PI/8);
  arc(0,0,430,50,0,PI);
  popMatrix();
 
 
  //cheeks
  
  stroke(10);
  strokeWeight(2);
  fill(255,255,149);
  ellipse(513,460,50,50);
  fill(255,255,149);
  ellipse(200,340,50,50);
  
stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,255,149);
  pushMatrix();
  translate(400,450);
  rotate(PI/.95);
  arc(0,0,225,200,PI,2*PI);
  popMatrix();
  
   stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,255,149);
  pushMatrix();
  translate(280,400);
  rotate(PI/5);
  arc(0,0,215,210,0,PI);
  popMatrix();

 
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(325,350);
  rotate(PI/8);
  ellipse(0,0,200,300);
  popMatrix(); 
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255);
  pushMatrix();
  translate(325,350);
  rotate(PI/8);
  arc(0,0,200,300,0,PI);
  popMatrix();
  
   
   
   noStroke();
  smooth();
  fill(255, 150, 25);
  pushMatrix();
  translate(596, 302);
  rotate(PI/2);
  rect(0, 0, 30, 17);
  popMatrix();

   
   
 
  
  stroke(10);
  strokeWeight(2);
  pushMatrix();
  translate(232,312);
  rotate(PI/8);
  rect(0,0,200,2);
  popMatrix();
  
  
  
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(255,150,25);
  pushMatrix();
  translate(425,377);
  rotate(PI/8);
  ellipse(0,0,200,300);
  popMatrix(); 
 
 stroke(10);
  strokeWeight(2);
  smooth();
  fill(255);
  pushMatrix();
  translate(425,377);
  rotate(PI/8);
  arc(0,0,200,300,0,PI);
  popMatrix();
  
  stroke(10);
  strokeWeight(2);
  pushMatrix();
  translate(333,337);
  rotate(PI/8);
  rect(0,0,200,2);
  popMatrix();
  
   stroke(10);
  strokeWeight(2);
  smooth();
  fill(10);
  pushMatrix();
  translate(425,377);
  rotate(PI/8);
  arc(0,0,20,30,0,PI);
  popMatrix();
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(10);
  pushMatrix();
  translate(300,342);
  rotate(PI/8);
  arc(0,0,20,30,0,PI);
  popMatrix();
  
  stroke(10);
  strokeWeight(2);
  smooth();
  fill(247,152,152);
  pushMatrix();
  translate(305,485);
  rotate(PI/8);
  ellipse(0,0,75,50);
  popMatrix();
  
  
  
 
 
 
  
 


 
  
 
}
