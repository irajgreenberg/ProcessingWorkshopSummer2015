void clearBlue(PImage pic){

  for (int i=0; i<pic.pixels.length; i++){
  
    pic.pixels[i] = color(red(pic.pixels[i]), green(pic.pixels[i]), 0);
  
  }

}
