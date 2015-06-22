void removeGreen(PImage pic){
 
   
  for(int i=0;i<pic.pixels.length;i++){
    float r=red(pic.pixels[i]);
    float g=green(pic.pixels[i]);
    float b=blue(pic.pixels[i]);
    
    if(g>=b+55 && g>=r+15){
      pic.pixels[i]=color(255,0,255);
    }
    
  }
  
 
}
