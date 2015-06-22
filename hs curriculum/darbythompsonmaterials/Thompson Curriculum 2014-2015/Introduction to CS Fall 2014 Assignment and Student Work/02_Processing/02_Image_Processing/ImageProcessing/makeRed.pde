void makeRed(PImage pic){

  for (int i=0; i<pic.pixels.length; i++){
  
    pic.pixels[i] = color(red(pic.pixels[i]), 0, 0);
  
  }

}
