/*
Name: paintingVisualization (Pretty Print Variation)
 By: William Choi
 Date: 4/16/2014
 Function: Takes in an image (in this case, the Mona Lisa, but another could be used instead) and breaks the image down into pixel color values. It then sorts the colors by frequency and displays them in order.
 Note: Due to the fact that the program processes pixel data from an image, the sorting process takes a long time. As such, an animated GIF of a confused cat is included in the data folder to provide 
 */
ArrayList<Color> colors;
PImage mona;
int drawtog;
void setup() {
  size(800, 700);
  colors = new ArrayList();
  mona = loadImage("Mona_Lisa_Smallest.jpg");
  drawtog = 0;
  rectMode(CENTER);
  imageMode(CENTER);
  noStroke();
  int xc = 0;
  int yc = 0;
  for (int t = 0;  t < mona.height * mona.width; t++) {
    Color c = new Color(mona.pixels[t]);
    colors.add(c);
    println("Cataloguing: " + colors.size());
  }
  noLoop();
  cleanSort();
}
void cleanSort() {
  int i1 = colors.size()-1;
  while (i1 >= 0) {
    int i2 = i1-1;
    while (i2 >= 0) {
      if (abs(red(colors.get(i1).col) - red(colors.get(i2).col)) <= 0 && abs(green(colors.get(i1).col) - green(colors.get(i2).col)) <= 0 && abs(blue(colors.get(i1).col) - blue(colors.get(i2).col)) <= 0) {
        colors.get(i1).update();
        colors.remove(i2);
        println("Consolidating: " + colors.size());
        i1--;
        i2--;
      }
      i2--;
    }
    i1--;
  }
  println("Step 3");
  for (int n1 = 0; n1 < colors.size(); n1++) {
    for (int n2 = 0; n2 < colors.size(); n2++) {
      if (colors.get(n1).number < colors.get(n2).number) {
        Color temp = colors.get(n2);
        colors.set(n2, colors.get(n1));
        colors.set(n1, temp);
      }
    }
    println("Sorting: " + n1 + "/" + colors.size());
  }
}


void draw() {
  background(255);
  println("Drawing");
  if (drawtog == 0) {
    int xcount = 0;
    int ymod = 0;
    int modist = 0;
    for (int s = colors.size()-1; s >=0; s--) {
      if (colors.get(s).number >= modist) {
        modist = colors.get(s).number;
      }
      xcount++;
      if (xcount > width*.93) {
        xcount = 1;
        ymod += modist + 2;
        modist = 0;
      }
      for (int mod = 0; mod < colors.get(s).number; mod++) {
        //println(red(colors.get(s).col) + " " +  green(colors.get(s).col) + " " + blue(colors.get(s).col));
        fill(colors.get(s).col);
        mod++;
        rect(width - (width*.465)+xcount, mod + ymod, 1, 1);
      }
    }
    drawtog = 1;
  }
}

