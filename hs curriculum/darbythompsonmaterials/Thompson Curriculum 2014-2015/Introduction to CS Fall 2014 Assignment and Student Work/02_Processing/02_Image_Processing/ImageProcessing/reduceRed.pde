void reduceRed(PImage pic, int p){

  for (int i=0; i<pic.pixels.length; i++){
  
    pic.pixels[i] = color(red(pic.pixels[i])*(p/100.0), green(pic.pixels[i]), blue(pic.pixels[i]));
  
  }

}
