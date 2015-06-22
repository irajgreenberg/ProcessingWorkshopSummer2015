PImage rotateRight(PImage pic){
  
  PImage newpic = createImage(pic.height, pic.width, RGB);
  
  for (int x=0; x<pic.width; x++){
      for (int y=0; y<pic.height; y++){
           int oploc = x+y*pic.width;
           int loc = (pic.height-y-1)+x*pic.height;
           newpic.pixels[loc] = pic.pixels[oploc];
      }
  }
  return newpic;
}

/*
places:
(0,0) becomes (0, pic.height-1)
(pic.width-1, 0) becomes (0,0)
(pic.width-1, pic.height-1) becomes (pic.width-1, 0)
(0, pic.height-1) becomes (pic.width-1, pic.height-1)
*/

