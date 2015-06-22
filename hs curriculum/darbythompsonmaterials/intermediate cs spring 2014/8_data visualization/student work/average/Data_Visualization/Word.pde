class Word {

  String term;
  int frequency;
  int textsize;
  /* I started to think about not letting the words overlap by
   creating rectangles for each word depending on their length 
   and drawing them so they wouldn't overlap, but I didn't have time
   to get further in the process
   
   - you need to create rectangles that are proportional to the length 
   of the string (using the string.length() function) and to the font size,(which is a function of the frequency)
   
   - then you need to, when displaying all the strings, make sure no part
   of the rectangle of the string you are drawing will intersect with any
   other rectangle belonging to any other word, (by looping through the words'
   rectangles)... a lot of thinking and theorizing and not too much done in code.. i know..
   
   
   int word_width;
   int word_height;
   */

  Word(String start_term) {
    term=start_term;
    frequency=1;
    //word_width=0;
    //word_height=0;
  }




  void display() {
    fill(255);
    PFont font;
    font = loadFont("Chalkduster-48.vlw");


    textFont(font, (int)frequency/15);
    text(term, random(.02*width, width-.07*width), random(.071*height, height-.05*height));
  }
}

