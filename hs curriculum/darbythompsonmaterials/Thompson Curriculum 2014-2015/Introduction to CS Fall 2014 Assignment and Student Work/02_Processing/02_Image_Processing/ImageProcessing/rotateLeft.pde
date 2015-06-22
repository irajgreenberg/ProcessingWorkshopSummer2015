PImage rotateLeft(PImage pic){
  
  PImage newpic = createImage(pic.height, pic.width, RGB);
  
  for (int x=0; x<pic.width; x++){
      for (int y=0; y<pic.height; y++){
           int oploc = x+y*pic.width;
           int loc = y+(pic.width-1-x)*pic.height;
           newpic.pixels[loc] = pic.pixels[oploc];
      }
  }
  return newpic;
}

