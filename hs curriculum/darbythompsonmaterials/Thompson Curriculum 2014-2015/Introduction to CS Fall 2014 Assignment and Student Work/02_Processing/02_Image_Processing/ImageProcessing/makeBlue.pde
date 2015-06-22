void makeBlue(PImage pic){

  for (int i=0; i<pic.pixels.length; i++){
  
    pic.pixels[i] = color(0, 0, blue(pic.pixels[i]));
  
  }

}
