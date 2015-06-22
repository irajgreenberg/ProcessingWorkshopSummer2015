void GameScreen(){
  background(90,194,250);
  strokeWeight(1);
  stroke(255);
  
  fill(255);
  ellipse(300,300,400,400);
  fill(0);
  ellipse(cxpos,cypos,40,40);
  fill(0,0,0,0);
  strokeWeight(15);
  stroke(5);
  arc(300,300,400,400, radians(aspos), radians(aepos));
  textSize(180);
  fill(255);
  stroke(255);
  textSize(20);
  textAlign(CENTER);
  text("CLICK TO GO!",300,550); 
  textSize(180);
  if (keyPressed){
    arcmove=true;
    
  }
  if (arcmove==true){
   
    aspos = aspos+aspeedy;
    aepos = aepos+aspeedx;
    if (keyPressed==true){
      if (keyPressedBefore==false){
        aspeedx = -aspeedx;
        aspeedy = -aspeedy;
      }
      keyPressedBefore = true;
    }
    else {
      keyPressedBefore = false;
    }
      
 
    ballmove = true;
    if (ballmove==true){
      if (mousePressed){
        ballgo = true;
      }
    }
    if (alive==true){
      fulltime = millis()/1000;
    }
    if (notstarted==true){
      starttime=millis()/1000;
    }
    if (ballgo==true){
      notstarted = false;
      if (notstarted==false){
        textAlign(CENTER,CENTER);
        fill(0);
        text(fulltime-starttime,300,300);
      }
     
      cypos = cypos+speedy;
      cxpos = cxpos+speedx;
      for(float x=0; x<600; x=x+1){
        for (float y=0; y<600; y=y+1){
          if (sqrt((abs(cxpos-x)*abs(cxpos-x))+(abs(cypos-y)*abs(cypos-y)))<=20 && get(int(x),int(y))==color(5)){
            if (sqrt(abs(cxpos-300)*abs(cxpos-300)+abs(cypos-300)*abs(cypos-300))>=180){
              if (cxpos>=300 && cypos>=300){
                speedy= random(-2.51,-3.0);
                bottomright = true;
                if (bottomright==true){
                  speedx= -(sqrt(9.0-(speedy*speedy)));
                }
              }
              else if (cxpos>=300 && cypos<300){
                speedy= random(2.51,3.0);
                topright = true;
                if (topright==true){
                  speedx= -(sqrt(9.0-(speedx*speedx)));
                }
              }
              else if (cxpos<300 && cypos<300){
                speedy= random(2.51,3.00);
                topleft = true;
                if (topleft==true){
                  speedx= (sqrt(9.0-(speedx*speedx)));
                }
              }
              else if (cxpos<300 && cypos>=300){
                speedy= random(-2.51,-3.00);
                bottomleft = true;
                if (bottomleft==true){
                  speedx= sqrt(9.0-(speedy*speedy));
                }
              }
             }
            }
          }
      }
    }
          if (cxpos>=620 || cxpos<=-20 || cypos>=620 || cypos<=-20){
            alive=false;
            ballgo=false;
            if (alive==false){
              textAlign(CENTER,CENTER);
              fill(0);
              text(fulltime-starttime,300,300);
              aspeedx = 0;
              aspeedy = 0;
              gameover = true;
            }
          }
        
           
      
     
    
     
  
  }
  
  
}
