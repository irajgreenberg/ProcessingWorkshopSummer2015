void makeGray(PImage pic){

  for (int i=0; i<pic.pixels.length; i++){
  
    float x = ((red(pic.pixels[i])+green(pic.pixels[i])+blue(pic.pixels[i]))/3);
    
    pic.pixels[i] = color(x, x, x);
  
  }

}
