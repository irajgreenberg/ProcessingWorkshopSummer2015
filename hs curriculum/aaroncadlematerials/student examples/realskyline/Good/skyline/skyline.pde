
void setup()
{
  size(1366, 705);
  background(#E58A43);
  
  color topColor = color(#8B2BED);
  color bottomColor = color(#12069D);
  float gradeFactor;

  loadPixels();
  for (int i = 0;i<pixels.length; i++)
  {
    float r= red(pixels[i]);
    float g= green(pixels[i]);
    float b= blue(pixels[i]);

    float r2 = red(bottomColor);
    float g2 = green(bottomColor);
    float b2 = blue(bottomColor);

    r = r * (pixels.length - i) / pixels.length + ((r2 * i) / pixels.length);
    g = g * (pixels.length - i) / pixels.length + ((g2 * i) / pixels.length);
    b = b * (pixels.length - i) / pixels.length + ((b2 * i) / pixels.length);
    pixels[i] = color(r, g, b);
  }
  updatePixels();

  noStroke();
  fill(255, 192, 112);
  ellipse(1020, 470, 200, 200);

  fill(243, 112, 67);
  

  fill(#B7491E);
  noStroke();
  rect(0, 470, width, 300);

  fill(255, 147, 63);
  
  //dunes
  fill(#933838);
  beginShape();
  curveVertex(1020, 550);
  curveVertex(1020, 550);
  curveVertex(1220, 520);
  curveVertex(1365, 545);
  curveVertex(width, height);
  vertex(width, height);
  vertex(1020, height);
  endShape(CLOSE);



  fill(#833838);
  noStroke();
  beginShape();
  curveVertex(0, 470);
  curveVertex(0, 470);
  curveVertex(300, 520);
  curveVertex(800, 500);
  curveVertex(1360, 705);
  curveVertex(0, 705);
  curveVertex(0, 705);
  endShape(CLOSE);

  //Pyramid 3 side 1
  fill(170, 72, 35);
  triangle(250, 470, 400, 275, 390, 470);
  //Pyramid 3 side 2
  fill(201, 101, 41);
  triangle(390, 470, 400, 275, 570, 470);

  //Pyramid 2 side 1
  fill(82, 41, 19);
  triangle(2, 470, 245, 195, 210, 470);
  //Pyramid 2 side 2
  fill(142, 55, 28);
  triangle(210, 470, 245, 195, 495, 470);

  //Pyramid 1 side 1

  fill(43, 4, 9);
  triangle(2, 470, 156, 295, 130, 470);
  //Pyramid 1 side 2
  fill(98, 40, 16);
  triangle(130, 470, 156, 295, 310, 470);


  fill(38, 0, 2);
  triangle(45, 470, 115, 380, 90, 470);
  fill(78, 32, 16);
  triangle(90, 470, 115, 380, 190, 470);

  fill(61, 20, 6);
  triangle(200, 470, 270, 380, 245, 470);
  fill(107, 40, 13);
  triangle(245, 470, 270, 380, 345, 470);

  fill(70, 27, 8);
  triangle(355, 470, 425, 380, 400, 470);
  fill(107, 44, 14);
  triangle(400, 470, 425, 380, 500, 470);
}




void draw()
{
  println(mouseX + " " + mouseY);
}

