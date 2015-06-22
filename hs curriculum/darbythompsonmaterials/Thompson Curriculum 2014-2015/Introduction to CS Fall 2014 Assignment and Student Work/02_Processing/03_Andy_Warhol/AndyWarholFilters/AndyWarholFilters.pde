//Warhol Filters
void setup() {

  PImage star = loadImage("pics.jpg");
  PImage star2= loadImage("pics.jpg");
  PImage star3= loadImage("pics.jpg");
  PImage star4= loadImage("pics.jpg");
  for (int i=0; i<star.pixels.length; i++) {
    float r= red(star.pixels[i]);

    float g= green(star.pixels[i]);

    float b= blue(star.pixels[i]);
    if (0<g && g<60 && 41<b && b<190 && 0<r && r<139) {
      star.pixels[i]= color(0, 200, 200);
      star2.pixels[i]= color(300, 0, 0);
      star3.pixels[i]= color(0, 300, 0);
      star4.pixels[i]= color(300, 400, 0);
    } else if ( 120<g && g<255 && 186<b && b<235 && 113<r && r<255) { 
      star.pixels[i]= color(600, 0, 100);
      star2.pixels[i]= color(0, 300, 0);
      star3.pixels[i]= color(0, 300, 500);
      star4.pixels[i]= color(0, 0, 200);
    } else if (32<g && g<120 && 0<b && b<58 && 157<r && r<243) {
      star.pixels[i]= color(0, 255, 0);
      star2.pixels[i]= color(0, 0, 325);
      star3.pixels[i]= color(200, 0, 400);
      star4.pixels[i]= color(400, 0, 0);
    }
  }


size( star.width*2, star.height*2);
loadPixels();
for (int x=0; x<star.width; x++) {
  for (int y=0; y<star.height; y++) {
    pixels[x+y*star.width*2]= star.pixels[x+y*star.width];
    pixels[x+(y+star.height)*star.width*2] =star2.pixels[x+y*star.width];
    pixels[(x+star.width)+y* star.width*2]= star3.pixels[x+y*star.width];
    pixels[(x+star.width)+(y+star.height)*star.width*2]= star4.pixels[x+y*star.width];
  }
} 

updatePixels(); 

}






// image(star,0,0);
//   image(star2,star2.width,star2.height);
// image(star3,star3.width,0);
//   image(star4,0,star4.height);






void draw() {
}

