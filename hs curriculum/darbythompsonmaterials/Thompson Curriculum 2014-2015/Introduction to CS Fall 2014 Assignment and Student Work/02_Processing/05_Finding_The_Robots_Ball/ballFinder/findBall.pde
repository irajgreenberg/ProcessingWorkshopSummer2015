void findBall(PImage pic){
  
  int counter=0;
  int yTotal=0;
  int xTotal=0;
  
  for(int x=0;x<pic.width;x++){
    for(int y=0;y<pic.height;y++){
      
      float r=red(pic.pixels[x+y*pic.width]);
      float g=green(pic.pixels[x+y*pic.width]);
      float b=blue(pic.pixels[x+y*pic.width]);
      
      if(110<r && r<200 && 30<g && g<110 && 20<b && b<90){
      
      }    
      
      else if(r<210 && r>115 && g<115 && g>40 && b<93 && b>=0){
        //pic.pixels[x+y*pic.width]=color(255,0,255);    this code can be used to determine what pixels the if statement is targeting
        counter=counter+1;
        xTotal=xTotal+x;
        yTotal=yTotal+y;
      }
      
      else if(r<255 && r>195 && g<180 && g>105 && b<93 && b>25){
        //pic.pixels[x+y*pic.width]=color(255,0,255);    this code can be used to determine what pixels the if statement is targeting
        counter=counter+1;
        xTotal=xTotal+x;
        yTotal=yTotal+y;
      }
      
      
    }
  }
  
  int yEnd=yTotal/counter;
  int xEnd=xTotal/counter;
  
  
  //this draws the crosshair:
  pic.pixels[xEnd+yEnd*pic.width]=color(0);
  pic.pixels[(xEnd+1)+(yEnd)*pic.width]=color(0);
  pic.pixels[(xEnd)+(yEnd+1)*pic.width]=color(0);
  pic.pixels[(xEnd-1)+(yEnd)*pic.width]=color(0);
  pic.pixels[(xEnd)+(yEnd-1)*pic.width]=color(0);
  pic.pixels[(xEnd+2)+(yEnd)*pic.width]=color(0);
  pic.pixels[(xEnd)+(yEnd+2)*pic.width]=color(0);
  pic.pixels[(xEnd-2)+(yEnd)*pic.width]=color(0);
  pic.pixels[(xEnd)+(yEnd-2)*pic.width]=color(0);
  
  
}
