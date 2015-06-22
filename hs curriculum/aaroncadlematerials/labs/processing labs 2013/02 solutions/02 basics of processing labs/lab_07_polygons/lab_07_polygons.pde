
/*
 * Name: Jane Student
 * ID# : 123456
 * Lab : Skyline
 *
 * @authors Aaron Cadle and Perry Jackson. 
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
    size(800,800);
    background(0,0,200);
    

    poly(width/2,height/2, 20, 400, 570, PI/8, color(200),15,color(0,0,200),ROUND,BEVEL);
    poly(width/2,height/2, 18, 500, 350, PI/6, color(180),14,color(200,0,0),ROUND,BEVEL);
    poly(width/2,height/2, 16, 50, 600, PI/5, color(160),13,color(0,0,200),ROUND,BEVEL);
    poly(width/2,height/2, 6, 300, 270, PI/4, color(140),12,color(200,0,0),ROUND,BEVEL);
    poly(width/2,height/2, 8, 180, 400, PI/4, color(120),11,color(0,0,200),ROUND,BEVEL);
    poly(width/2,height/2, 10, 160, 270, PI/2,color(100),10,color(200,0,0),ROUND,BEVEL);
    poly(width/2,height/2, 10, 160, 270, PI/2,color(200),9,color(0,0,200),ROUND,BEVEL);
    //poly(width/2,height/2, 3, 300,250, PI/5,color(200),8,color(200,0,0),ROUND,BEVEL);
    poly(width/2,height/2, 4, 150, 175, PI/4,color(200),7,color(0,0,200),ROUND,BEVEL);
    poly(width/2,height/2, 5, 150,350,PI/2,color(200),6,color(200,0,0),ROUND,BEVEL);
    poly(width/2,height/2, 6, 140, 150, PI/2,color(200),5,color(0,0,200),ROUND,BEVEL);
    poly(width/2,height/2, 30, 50, 120, PI/3,color(200),4,color(200,0,0),ROUND,BEVEL);
    poly(width/2,height/2, 7, 60, 75, PI/6,color(200),3,color(0,0,200),ROUND,MITER);
    poly(width/2,height/2, 17, 50, 75, PI/8,color(200),2,color(200,0,0),ROUND,MITER);
           
    
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
