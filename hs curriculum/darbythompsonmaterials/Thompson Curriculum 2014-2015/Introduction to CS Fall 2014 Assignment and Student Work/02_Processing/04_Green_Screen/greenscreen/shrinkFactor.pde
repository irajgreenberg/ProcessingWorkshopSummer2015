PImage shrinkFactor(PImage pic, int f){
  
  PImage newPic=createImage(pic.width/f,pic.height/f,RGB);
  
  for(int x=0;x<newPic.width;x++){
    for(int y=0;y<newPic.height;y++){
      newPic.pixels[x+y*newPic.width]=pic.pixels[f*x+f*y*pic.width];
    }
  }
  
  return newPic;
  
}
