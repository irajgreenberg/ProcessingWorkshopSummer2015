//andy warhol


void setup(){
  PImage trio = loadImage ("contrast1.jpg");
  PImage trio2 = loadImage ("contrast1.jpg");
  PImage trio3 = loadImage ("contrast1.jpg");
  PImage trio4 = loadImage ("contrast1.jpg");
  //trio
  for (int i=0; i<trio.pixels.length; i++){
    float r = red(trio.pixels[i]);
    float g = green(trio.pixels[i]);
    float b = blue(trio.pixels[i]);
    if (0<=r && r<=106 && 0<=g && g<=106 && 0<=b && b<=106){
      trio.pixels[i]=color(#FEFF31);
    }
    if (193<=r && r<=255 && 193<=g && g<=255 && 193<=b && b<=255){
      trio.pixels[i]=color(r, g/2, b/2);
    }
    if (107<=r && r<=192 && 107<=g && g<=192 && 107<=b && b<=192){
      trio.pixels[i]=color(0, 50, 100);
    }
  }
  //trio2
   for (int i=0; i<trio2.pixels.length; i++){
    float r = red(trio2.pixels[i]);
    float g = green(trio2.pixels[i]);
    float b = blue(trio2.pixels[i]);
    if (0<=r && r<=106 && 0<=g && g<=106 && 0<=b && b<=106){
      trio2.pixels[i]=color(#FF31EB);
    }
    if (193<=r && r<=255 && 193<=g && g<=255 && 193<=b && b<=255){
      trio2.pixels[i]=color(#F75568);
    }
    if (107<=r && r<=192 && 107<=g && g<=192 && 107<=b && b<=192){
      trio2.pixels[i]=color(#FF3138);
    }
  }
  //trio3
   for (int i=0; i<trio3.pixels.length; i++){
    float r = red(trio3.pixels[i]);
    float g = green(trio3.pixels[i]);
    float b = blue(trio3.pixels[i]);
    if (0<=r && r<=106 && 0<=g && g<=106 && 0<=b && b<=106){
      trio3.pixels[i]=color(#1B1FF0);
    }
    if (193<=r && r<=255 && 193<=g && g<=255 && 193<=b && b<=255){
      trio3.pixels[i]=color(#57F755);
    }
    if (107<=r && r<=192 && 107<=g && g<=192 && 107<=b && b<=192){
      trio3.pixels[i]=color(#55F7CD);
    }
  }
  //trio4
   for (int i=0; i<trio4.pixels.length; i++){
    float r = red(trio4.pixels[i]);
    float g = green(trio4.pixels[i]);
    float b = blue(trio4.pixels[i]);
    if (0<=r && r<=106 && 0<=g && g<=106 && 0<=b && b<=106){
      trio4.pixels[i]=color(200, 200, 200);
    }
    if (193<=r && r<=255 && 193<=g && g<=255 && 193<=b && b<=255){
      trio4.pixels[i]=color(100, 100, 100);
    }
    if (107<=r && r<=192 && 107<=g && g<=192 && 107<=b && b<=192){
      trio4.pixels[i]=color(50, 50, 50);
    }
  }
  size(trio.width*2, trio.height*2);
  loadPixels();
  
  for (int x=0; x<trio.width; x++){
    for (int y=0; y<trio.height; y++){
      pixels[x+y*trio.width*2] = trio.pixels[x+y*trio.width];
      pixels[x+trio.width+y*trio.width*2] = trio2.pixels[x+y*trio2.width];
      pixels[x+(y+trio.height)*trio.width*2] = trio3.pixels[x+y*trio3.width];
      pixels[x+trio.width+(y+trio.height)*trio.width*2] = trio4.pixels[x+y*trio4.width];
    }
  }
    
  
  updatePixels(); 
  //image(trio, 0, 0);
  //image(trio2, trio.width, 0);
  //image(trio3, 0, trio.height);
  //image(trio4, trio.width, trio.height);
}

void draw(){
}
//0<r<16 0<g<16 0<b<16
