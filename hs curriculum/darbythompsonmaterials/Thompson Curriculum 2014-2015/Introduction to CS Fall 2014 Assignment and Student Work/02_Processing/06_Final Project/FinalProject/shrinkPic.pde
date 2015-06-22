PImage shrinkPic(PImage pic) {
 PImage newpic = createImage(pic.width/2, pic.height/2, RGB);
 for(int x = 0; x < newpic.width; x++) {
    for(int y = 0; y < newpic.height; y++) {
        
      if(x+y*newpic.width > 32000 && x+y*newpic.width < 50000 && x > 150){
        newpic.pixels[x+y*newpic.width] = pic.pixels[(x+y*pic.width)*2];
      }
      else{
        newpic.pixels[x+y*newpic.width] = color(220); 
      }
    }
   
   
 }
   
   
 return newpic;
  
}
