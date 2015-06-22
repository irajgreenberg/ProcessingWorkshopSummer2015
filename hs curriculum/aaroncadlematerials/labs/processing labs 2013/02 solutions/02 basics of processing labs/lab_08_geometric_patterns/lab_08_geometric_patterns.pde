/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Geometric Pattern
 *
 * @authors Aaron Cadle and James Sowell. 
 * Licensed under Creative Commons (CC BY-SA 3.0)
 * You are free to modify, share, and redistribute this code
 * but you may not charge for it. Please leave the authorship
 * and license information intact.
 *
 * polygon() and sprocket() orginially coded in 
 * Processing: Creative Coding and Computational Ard by Ira Greenberg
 * pg 359-364
 * reproduction for educational purposes only
 *
 */
 

 void setup()
{
    smooth();
    size(800,600);
    background(127);
    
    sprocket(width/3,height/4,20,20,440, PI/4, color(255,255,75,75), 20, color(255,0,255,200), SQUARE, BEVEL);
    sprocket(width/3,height/4,120,75,-230, PI/4, color(200,200,0,200), 1, color(20), SQUARE, MITER);
    sprocket(width/3,height/4,20,35,20, PI/4, color(0,255,255,0), 25, color(255,255,255,75), PROJECT, MITER);
    sprocket(width/3,height/4,8,120,190, PI/4, color(20,0,0,75), 14, color(200), PROJECT, MITER);
    sprocket(width/3,height/4,8,20,70, PI/8, color(245,0,0,75), 20, color(10), PROJECT, MITER);
    sprocket(width/3,height/4,105,125,15, PI/4, color(12,82,17,75), 2, color(120,120,120,75), SQUARE, BEVEL);
    sprocket(width/3,height/4,80,125,100, PI/4, color(127,20,2,75), 4, color(12,19,82,75), PROJECT, MITER);
}

void poly(float x, float y, int pts, float rad1, float rad2, float initRot, color sColor, float sWeight, color fColor, int sCap, int sJoin)
{
  
    fill(fColor);        //add color
    stroke(sColor);        // white outline
    strokeWeight(sWeight);    // 10 pixel-wide stroke
    strokeJoin(sJoin);   //options are ROUND, BEVEL, MITER                    
    strokeCap(sCap);  //options are SQUARE, PROJECT, and ROUND
    
    if(rad1 != rad2)
      pts = pts*2;
      
    pushMatrix();
    translate(x,y);
    rotate(initRot);
    beginShape();    //start "connecting dots"

    float theta = 0;
    for(int i =0; i< pts; i++)
    {
      if(i%2 == 0)
      {
        float pX = cos(theta) * rad1; //trig to find X part of point
        float pY = sin(theta) * rad1; //trig to find Y part of point
        vertex(pX,pY);   //add point
      }
      else
      {
        float pX = cos(theta) * rad2; //trig to find X part of point
        float pY = sin(theta) * rad2; //trig to find Y part of point
        vertex(pX,pY);   //add point
      }
      theta  += 2*PI / pts;
    }
        
    endShape(CLOSE);    //connect points.
    popMatrix();
  
}

void sprocket(float x, float y, int spokes, float rad1, float rad2, float initRot, color sColor, float sWeight, color fColor, int sCap, int sJoin)
{
  
    fill(fColor);        //add color
    stroke(sColor);        // white outline
    strokeWeight(sWeight);    // 10 pixel-wide stroke
    strokeJoin(sJoin);   //options are ROUND, BEVEL, MITER                    
    strokeCap(sCap);  //options are SQUARE, PROJECT, and ROUND
    
    float angle = 2 * PI / spokes / 2.0;
    float angle2 = 2 * PI / spokes / 4.0;
      
    pushMatrix();
    translate(x,y);
    rotate(initRot);
    beginShape();    //start "connecting dots"
    float theta = 0;
    for(int i =0; i< spokes; i++)
    {
     
        float pX = cos(theta) * rad1; //trig to find X part of point
        float pY = sin(theta) * rad1; //trig to find Y part of point
        vertex(pX,pY);   //add point
        theta += angle;
        
        pX = cos(theta) * rad1; //trig to find X part of point
        pY = sin(theta) * rad1; //trig to find Y part of point
        vertex(pX,pY);   //add point
        theta += angle2;
                
        pX = cos(theta) * rad2; //trig to find X part of point
        pY = sin(theta) * rad2; //trig to find Y part of point
        vertex(pX,pY);   //add point
        theta += angle2;
     
    }
        
    endShape(CLOSE);    //connect points.
    popMatrix();
  
}
