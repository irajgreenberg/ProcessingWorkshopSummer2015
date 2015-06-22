//word frequency of doctor who speech
//begun 2/12/15
ArrayList <String> pieces;
String[] temporary;
ArrayList <Word> words;
String text;
Word actual;
Word present;
int thing;
PImage back;
int tardisx;
int tardisy;
PImage tardis;
int speed=7;

void setup() {
  tardis= loadImage("tardis.png");
  back= loadImage("vortex.jpg");
  size(1280, 720);

  words= new ArrayList<Word>();
  String[] lines = loadStrings("speech.txt");
  pieces = new ArrayList<String>();
  for (int i=0; i<lines.length; i++) {
    temporary=splitTokens(lines[i], ".!?,—… \"“:”*-");
    for (int x=0; x<temporary.length; x++) {
      pieces.add(temporary[x]);
    }
  }

  for (int i=0; i<pieces.size (); i++) {    
    text=pieces.get(i);
    text=text.toLowerCase();
    if (words.size()==0) {
      words.add(new Word(text));
    }
    for (int x=0; x<words.size (); x++) {
      actual=words.get(x);
      if (text.equals(actual.content)) {
        actual.frequency=actual.frequency+1;
        thing=1;
        break;
      }
    }
    if (thing==0) {
      words.add(new Word(text));
    }
    if (thing==1) {
      thing=0;
    }
  }
}



void draw() {
  image(back, 0, 0);
  image(tardis, tardisx, tardisy);
  textSize(30);
  text("Doctor Who Word Frequency", 50, 50);
  for (int x=0; x<words.size (); x++) {
    present=words.get(x);
    present.move();
    present.display();
  }
  tardisx=tardisx+speed;
  if (tardisx>1280) {
    tardisx=0;
    tardisy=int(random(600));
  }
}

