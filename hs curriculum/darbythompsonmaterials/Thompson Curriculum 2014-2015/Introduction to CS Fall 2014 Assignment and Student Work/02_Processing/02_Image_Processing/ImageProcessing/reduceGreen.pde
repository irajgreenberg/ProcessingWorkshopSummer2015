void reduceGreen(PImage pic, int p){

  for (int i=0; i<pic.pixels.length; i++){
  
    pic.pixels[i] = color(red(pic.pixels[i]), green(pic.pixels[i])*(p/100.0), blue(pic.pixels[i]));
  
  }

}
