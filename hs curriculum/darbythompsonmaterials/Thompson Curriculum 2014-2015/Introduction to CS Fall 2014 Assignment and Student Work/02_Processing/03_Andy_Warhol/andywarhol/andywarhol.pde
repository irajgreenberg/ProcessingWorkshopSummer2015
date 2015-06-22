// Andy Warhol Program

void setup(){
  
  
  PImage p=loadImage("andrewHussie.jpg");
  PImage p2=loadImage("andrewHussie.jpg");
  PImage p3=loadImage("andrewHussie.jpg");
  PImage p4=loadImage("andrewHussie.jpg");
  
  
  
  for(int i=0;i<p.pixels.length;i++){
    
    float r=red(p.pixels[i]);
    float g=green(p.pixels[i]);
    float b=blue(p.pixels[i]);
    
    if(210<r && r<256 && 60<g && g<130 && 30<b && b<90){
      
      p.pixels[i]=color(255,0,0);
      p2.pixels[i]=color(0,255,0);
      p3.pixels[i]=color(0,0,255);
      p4.pixels[i]=color(255,160,160);
      
    }
    
    else if(110<r && r<256 && 130<g && g<230 && 60<b && b<245){
      
      p.pixels[i]=color(135,135,135);
      p2.pixels[i]=color(255,g,255);
      p3.pixels[i]=color(0,200,200);
      p4.pixels[i]=color(r,0,b/2);
      
    }
    else if(0<r && r<90 && 50<g && g<110 && 50<b && b<140){
      
      p.pixels[i]=color(10,10,160);
      p2.pixels[i]=color(200,200,160);
      p3.pixels[i]=color(200,0,255);
      p4.pixels[i]=color(30,146,57);
      
    }
    else{
      
      p.pixels[i]=color(70,g,45);
      p2.pixels[i]=color(r*0.3+b*0.6+g*.11);
      p3.pixels[i]=color(18,131,130);
      p4.pixels[i]=color(95,76,40);
      
    }
    
  }
  
  
  size(2*p.width,2*p.height);
  
  loadPixels();
  
  for(int x=0;x<p.width;x++){
    for(int y=0;y<p.height;y++){
      pixels[x+y*width]=p.pixels[x+y*p.width];
      pixels[(x+p.width)+y*width]=p2.pixels[x+y*p.width];
      pixels[x+(y+p.height)*width]=p3.pixels[x+y*p.width];
      pixels[(x+p.width)+(y+p.height)*width]=p4.pixels[x+y*p.width];
    }
  }
  
  updatePixels();
  
 
  
  
  
  
}

void draw(){
  
}
  

