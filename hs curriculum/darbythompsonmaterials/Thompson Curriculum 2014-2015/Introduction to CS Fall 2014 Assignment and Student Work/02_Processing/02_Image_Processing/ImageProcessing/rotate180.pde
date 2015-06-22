PImage rotate180(PImage pic){
  
  PImage newpic = createImage(pic.width, pic.height, RGB);
  
  for (int x=0; x<pic.width; x++){
      for (int y=0; y<pic.height; y++){
           int loc = x+y*pic.width;
           int oploc = (pic.width-1)+(pic.height-1)*(pic.width);
           newpic.pixels[loc] = pic.pixels[oploc-loc];
      }
  }
  return newpic;
}
