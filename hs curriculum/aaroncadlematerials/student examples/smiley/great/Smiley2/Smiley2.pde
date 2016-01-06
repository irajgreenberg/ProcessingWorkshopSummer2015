void setup()
{
  size(1366, 720);
  background(62, 3, 85);
}

void draw()
{  


  //body
  noStroke();
  fill(12, 111, 8);
  ellipse(width/2, height/1.5, 300, 300);
  smooth();

  //eyeWhites
  noStroke();
  fill(255);
  ellipse(width/2.2, height/1.7, 50, 50);
  ellipse(width/1.85, height/1.7, 50, 50);

  //eyes
  noStroke();
  fill(0);
  ellipse(width/2.2, height/1.7, 20, 50);
  ellipse(width/1.85, height/1.7, 20, 50);
  fill(188, 9, 0);
  ellipse(width/2.2, height/1.7, 10, 10);
  ellipse(width/1.85, height/1.7, 10, 10);

  //moon
  noStroke();
  fill(234, 212, 7);
  ellipse(1220, 120, 200, 200);
  fill(62, 3, 85);
  ellipse(1290, 90, 200, 200);

  //ground
  noStroke();
  fill(0);
  rect(0, 630, width, height/4);

  //mouthShape
  noStroke();
  fill(0);
  rect(620, 530, 120, 5);

  //teeth
  noStroke();
  fill(255);
  triangle(630, 535, 640, 535, 645, 560);
  triangle(730, 535, 720, 535, 715, 560);

  //toungue
  noStroke();
  fill(250, 15, 165);
  rect(670, 535, 20, 30);
  ellipse(680, 560, 30, 20);
  fill(12, 111, 8);
  ellipse(680, 565, 20, 15);

  //nostrils
  noStroke();
  fill(0);
  ellipse(670, 485, 5, 20);
  ellipse(690, 485, 5, 20);

  //eyebrows
  stroke(0);
  strokeWeight(5);
  line(610, 385, 670, 420);
  line(750, 385, 690, 420);
}

