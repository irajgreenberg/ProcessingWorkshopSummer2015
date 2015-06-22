PImage flipHorizontal(PImage pic){
  
  PImage flippic = createImage(pic.width, pic.height, RGB);
  
  for (int x=0; x<pic.width; x++){
      for (int y=0; y<pic.height; y++){
           int loc = x+y*pic.width;
           int oploc = x+(pic.height-1-y)*(pic.width);
           flippic.pixels[loc] = pic.pixels[oploc];
      }
  }
  return flippic;
}
