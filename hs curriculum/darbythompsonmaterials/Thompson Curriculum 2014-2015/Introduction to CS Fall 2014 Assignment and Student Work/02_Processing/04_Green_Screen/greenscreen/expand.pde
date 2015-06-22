PImage expand(PImage pic){
  
  PImage newPic=createImage(pic.width*2,pic.height*2,RGB);
  
  for(int x=0;x<newPic.width;x++){
    for(int y=0;y<newPic.height;y++){
      newPic.pixels[x+y*newPic.width]=pic.pixels[x/2+y/2*pic.width];
    }
  }
  
  return newPic;
  
}
