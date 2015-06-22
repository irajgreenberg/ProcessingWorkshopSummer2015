// Green Screen Assignment

void setup(){
  
  PImage pipe=loadImage("pipe.jpg");
  PImage me=loadImage("photo.JPG");
  
  PImage shrunken=shrinkFactor(me,4);
  PImage bigger=expandFactor(pipe,2);
  
  size(bigger.width,bigger.height+35);
  background(93,148,251);
  image(bigger,0,35);

  loadPixels();
  
  removeGreen(shrunken);
  for(int x=0;x<shrunken.width;x++){
    for(int y=0;y<shrunken.height;y++){
      int location=x+y*shrunken.width;
      float r=red(shrunken.pixels[location]);
      float g=green(shrunken.pixels[location]);
      float b=blue(shrunken.pixels[location]);
      if((r==255 && g==0 && b==255)==false){
        pixels[x+(y+28)*width]=shrunken.pixels[location];
      }
    }
  }
  
 updatePixels();

}

void draw(){
  
  
}
