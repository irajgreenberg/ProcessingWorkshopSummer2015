//Image Processing

void setup() {

  PImage bird = loadImage("http://ih0.redbubble.net/image.10406445.7419/flat,550x550,075,f.jpg");
  
       //for Part 1 functions, plug in function name for "//FUNCTION" in line b
       //for Part 2 functions, comment out "FUNCTION..." line, add function around word "bird" in lines a and c
  size(bird.width, bird.height); //line a
  //FUNCTION(bird); //line b
  image(bird, 0, 0); //line c
  
}

void draw() {

}
