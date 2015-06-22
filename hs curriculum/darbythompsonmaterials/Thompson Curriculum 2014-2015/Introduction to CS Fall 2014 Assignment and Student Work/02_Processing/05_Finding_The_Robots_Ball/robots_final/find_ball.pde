void find_ball (PImage inputImage) {

 int xcounter=0; 
 int ycounter=0;
 int counter=0;

  for (int x=0; x<inputImage.width; x++) {
    for (int y=0; y<inputImage.height; y++) {
      float r = red(inputImage.pixels[x + y*inputImage.width]);
      float g = green(inputImage.pixels[x + y*inputImage.width]);
      float b = blue(inputImage.pixels[x + y*inputImage.width]);

      if (55<g && g<95 && 150<r && r<210 && 0<b && b<35) { 
        xcounter=xcounter + x;
        ycounter=ycounter + y;
        counter=counter + 1;
      }  
      

    }
    
     
  }
  
  for (int i=0; i<inputImage.pixels.length; i++){
    for (int n=0; n<20; n++){
      if (i==(xcounter/counter) + (ycounter/counter)*width){
       inputImage.pixels[i]=color(0, 0, 0); 
       inputImage.pixels[i + n*inputImage.width]=color(0, 0, 0);
       inputImage.pixels[i - n*inputImage.width]=color(0, 0, 0);
       inputImage.pixels[i + n]=color(0, 0, 0);
       inputImage.pixels[i - n]=color(0, 0, 0);
      }
 
    
    }
  }
  
     
}

