void makeGreen(PImage pic){

  for (int i=0; i<pic.pixels.length; i++){
  
    pic.pixels[i] = color(0, green(pic.pixels[i]), 0);
  
  }

}
