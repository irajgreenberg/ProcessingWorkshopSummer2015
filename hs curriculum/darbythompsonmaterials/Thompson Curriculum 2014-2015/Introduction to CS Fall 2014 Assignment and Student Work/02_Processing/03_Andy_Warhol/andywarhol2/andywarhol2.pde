//Andy Warhol

void setup(){
  PImage newpic = loadImage("AI_5.jpg");
  PImage newpic2 = loadImage("AI_5.jpg");
  PImage newpic3 = loadImage("AI_5.jpg");
  PImage newpic4 = loadImage("AI_5.jpg");
  
  for (int i=0; i<newpic.pixels.length; i++){
    float r = red(newpic.pixels[i]);
    float g = green(newpic.pixels[i]);
    float b = blue(newpic.pixels[i]);
    
    if (r<200 && r>120 && g>10 && g<70 && b>10 && b<45){
      newpic.pixels[i] = color(0,255,0);
      newpic2.pixels[i] = color(255,0,0);
      newpic3.pixels[i] = color(255,255,255);
      newpic4.pixels[i] = color(0,0,255);
    }
    else if (r<235 && r>95 && g<180 && g>37 && b<140 && b>10){
      newpic.pixels[i] = color(0,0,255);
      newpic2.pixels[i] = color(0,255,0);
      newpic3.pixels[i] = color(255,0,0);
      newpic4.pixels[i] = color(255,255,255); 
    }
    else if (r<90 && g<60 && b<120){
      newpic.pixels[i] = color (255,255,255);
      newpic2.pixels[i] = color(0,0,255);
      newpic3.pixels[i] = color(0,255,0);
      newpic4.pixels[i] = color(255,0,0);
    }
    else if (r>230 && g>80 && g<100 && b>40 && b<50){
      newpic.pixels[i] = color (255,0,0);
      newpic2.pixels[i] = color (255,255,255);
      newpic3.pixels[i] = color(0,0,255);
      newpic4.pixels[i] = color(0,255,0);
    }
      
  }
  
  
  size(newpic.width*2,newpic.height*2);
  
  loadPixels();
  
  for (int x=0; x<newpic.width; x++){
    for (int y=0; y<newpic.height; y++){
      pixels[x+y*newpic.width*2] = newpic.pixels[x+y*newpic.width];
      pixels[x+newpic.width+y*newpic.width*2] = newpic2.pixels[x+y*newpic.width];
      pixels[x+(y+newpic.height)*newpic.width*2] = newpic3.pixels[x+y*newpic.width];
      pixels[x+newpic.width+(y+newpic.height)*newpic.width*2] = newpic4.pixels[x+y*newpic.width];
    }
  }
  
  updatePixels();
  
  //image(newpic,0,0);
  //image(newpic2,newpic.width,0);
  //image(newpic3,0,newpic.height);
  //image(newpic4,newpic.width,newpic.height);
  
}

void draw(){
  
  
}
