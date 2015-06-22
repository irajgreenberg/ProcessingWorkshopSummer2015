//////////////////////////////////
//  Data Visualization Project  //
//  Nikhil Chaudhuri            //
//  April 2014                  //
//////////////////////////////////

ArrayList<word> words;
boolean alreadyThere;
dolphin[] d;
whale w;

void setup() {
  size(1000, 1000);
  String[] text = loadStrings("Moby Dick - The Chase.txt");

  words = new ArrayList();
  String delim = ",.:!?;—-\"\' ";
  alreadyThere = false;
  d = new dolphin[4];
  for (int i=0; i<d.length; i++) {
    d[i] = new dolphin(1, random(-100, width+100), random(height));
  }

  w = new whale(random(100, width-100), random(100, height-100));

  for (int i=0; i<text.length; i++) {
    String[] paragraph = splitTokens(text[i], delim);
    trim(paragraph);
    for (int j=0; j<paragraph.length; j++) {
      paragraph[j]=paragraph[j].toLowerCase();
      for (int k=0; k<words.size(); k++) {
        if (words.get(k).identity.equals(paragraph[j])) {
          words.get(k).frequency = words.get(k).frequency+1;
          alreadyThere = true;
        }
      }
      if (alreadyThere == false && paragraph[j].length()>3) {
        word w = new word(paragraph[j], 1, random(width), random(height));
        words.add(w);
      }
      alreadyThere = false;
    }
  }
}

void draw() {
  background(255);
  loadPixels();
  updatePixels();
  for (int i=0; i<width; i++) {
    for (int j=0; j<height; j++) {
      color c = color(0, 20+0.2*(height-j*1.1), 25+0.2*(height-j*1.1));
      set(i, j, c);
    }
  }

  for (int i=0; i<d.length; i++) {
    d[i].update();
    d[i].display();
  }

  w.update();
  w.display();

  stroke(0);
  for (int i=0; i<words.size(); i++) {
    fill(0, 6*words.get(i).frequency+random(10)-2*random(20), 8*words.get(i).frequency+random(10)-random(20));
    //fill(0, 8*words.get(i).frequency, 10*words.get(i).frequency);
    textSize(1.2*words.get(i).frequency+10);
    if (words.get(i).frequency>=3) {
      text(words.get(i).identity, (int)words.get(i).x, (int)words.get(i).y);
    }
    if (words.get(i).x>width) {
      words.get(i).x=0;
    }
    if (words.get(i).y>height) {
      words.get(i).y=0;
    }
    words.get(i).x = words.get(i).x+0.8;
    words.get(i).y = words.get(i).y+3*(float)Math.sin(words.get(i).x/15);
  }
}

