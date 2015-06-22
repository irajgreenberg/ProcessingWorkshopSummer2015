//Green screen assignment.

void setup() {
  PImage pic = loadImage("bg.jpg");
  PImage me = loadImage("photo.JPG");
  size(pic.width / 2, pic.height / 2);
  removegreen(me);
  image(shrink(pic), 0, 0);
  me = shrink(me);

  //size(shrink(pic).width, shrink(pic).height);
  //image(shrink(pic), 0, 0);

  //size(expand(pic).width, expand(pic).height);
  //image(expand(pic), 0, 0);

  loadPixels();
  for (int x = 0; x < me.width; x++) { 
    for (int y = 0; y < me.height; y++) {
      if (x + y * me.width >= me.width * me.height * 2) {
        break;
      }
      if (me.pixels[x + y * me.width] != color(0, 0, 0, 0)) {
        pixels[x + 420 + (y + 30) * width] = me.pixels[x + y * me.width];
      }
    }
  }
  updatePixels();
}

void draw() {
} 

