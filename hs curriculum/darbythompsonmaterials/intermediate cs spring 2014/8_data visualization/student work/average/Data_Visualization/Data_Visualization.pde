/*---------------------------
 Nicolas Jimenez
 Data Visualization program
 April 2014
 ----------------------------*/

ArrayList<Word> words=new ArrayList();

void setup() {
  size(700, 700);
  String[] lines=loadStrings("Bleak_House.txt");



  //creates the arraylist of all words
  for (int i=0; i<lines.length; i++) {
    String[] temp = splitTokens(lines[i], " ,.;\"-?!'():");

    for (int j=0; j<temp.length;j++) {

      temp[j]=trim(temp[j].toLowerCase());


      boolean check=check_words(words, temp[j]);

      //checks if the word is already in the arraylist to add only unique words
      if (check==false) {

        Word ind_word=new Word(temp[j]);
        words.add(ind_word);
      }
      //adds 1 to frequency every time the word is repeated
      else if (check==true) {
        for (int k=0; k<words.size();k++) {
          if (words.get(k).term.equals(temp[j])) {
            words.get(k).frequency=words.get(k).frequency+1;
          }
        }
      }
    }
  }


  //remove any connector words - and, or, for, on, in, that, this, they, the, he, she, her, him, his, is, it, etc.
  //remove any words with frequency of less than 22
  for (int x=words.size()-1; x>=0;x--) {

    if (words.get(x).term.equals("and")||words.get(x).term.equals("or")||words.get(x).term.equals("for")||words.get(x).term.equals("on")||words.get(x).term.equals("in")||words.get(x).term.equals("that")||words.get(x).term.equals("this")||words.get(x).term.equals("they")||words.get(x).term.equals("i")||words.get(x).term.equals("a")||words.get(x).term.equals("my")||words.get(x).term.equals("as")||words.get(x).term.equals("out")||words.get(x).term.equals("so")||words.get(x).term.equals("there")||words.get(x).term.equals("has")   ) {
      words.remove(words.get(x));
    }
    if (words.get(x).term.equals("the")||words.get(x).term.equals("he")||words.get(x).term.equals("she")||words.get(x).term.equals("her")||words.get(x).term.equals("him")||words.get(x).term.equals("his")||words.get(x).term.equals("is")||words.get(x).term.equals("it")||words.get(x).term.equals("to")||words.get(x).term.equals("of")||words.get(x).term.equals("you")||words.get(x).term.equals("be")||words.get(x).term.equals("from")||words.get(x).term.equals("very")||words.get(x).term.equals("am")||words.get(x).term.equals("said")   ) {  
      words.remove(words.get(x));
    }
    if (words.get(x).term.equals("with")||words.get(x).term.equals("but")||words.get(x).term.equals("me")||words.get(x).term.equals("at")||words.get(x).term.equals("was")||words.get(x).term.equals("is")||words.get(x).term.equals("are")||words.get(x).term.equals("were")||words.get(x).term.equals("if")||words.get(x).term.equals("have")||words.get(x).term.equals("had")||words.get(x).term.equals("by")||words.get(x).term.equals("been")||words.get(x).term.equals("what")||words.get(x).term.equals("not")  ) {
      words.remove(words.get(x));
    }
    if (words.get(x).term.equals("which")||words.get(x).term.equals("into")||words.get(x).term.equals("would")||words.get(x).term.equals("all")||words.get(x).term.equals("an")||words.get(x).term.equals("no")||words.get(x).term.equals("into")||words.get(x).term.equals("an")||words.get(x).term.equals("them")||words.get(x).term.equals("we")||words.get(x).term.equals("when")||words.get(x).term.equals("mr")  ) {
      words.remove(words.get(x));
    }

    else if (words.get(x).frequency<=130) {
      words.remove(words.get(x));
    }
    else if (words.get(x).term.equals("s")||words.get(x).term.equals("t")||words.get(x).term.equals("ll")) {
      words.remove(words.get(x));
    }
  }

  println("Size="+words.size());

  int max=get_max_frequency(words);
  println("max_frequency="+max);

  int min=get_min_frequency(words);
  println("min_frequency="+min);

  for (int x=0;x<words.size();x++) {
    if (words.get(x).frequency==max) {
      println("max_word="+words.get(x).term);
    }
  }

  //counts the number of words that have the minimum frequency and returns that number
  int count_min=0;
  for (int y=0;y<words.size();y++) {
    if (words.get(y).frequency==min) {
      count_min=count_min+1;
    }
  }
  println("count_min="+count_min);
}





void draw() {
  PFont font= loadFont("Chalkduster-48.vlw");

  background(0);

  fill(255,255,0);
  textSize(5);
  textFont(font);
  text("Bleak House word count", .0071*width, .05*height);

  fill(255);

  //draws all the words on the screen once
  for (int z=0;z<words.size();z++) {
    words.get(z).display();
    noLoop();
  }
}

//check if the string equals any other in the arraylist, and return true if it does.
boolean check_words(ArrayList<Word> mylist, String mystring) {
  for (int i=0; i<mylist.size(); i++) {
    if (mylist.get(i).term.equals(mystring)) {
      //mylist.remove(mylist.get(i));
      return true;
    }
  }
  return false;
}


//function that returns the maximum value for the frequencies of all words
int get_max_frequency(ArrayList<Word> mylist) {
  int maximum=0;
  for (int i=0;i<mylist.size();i++) {
    maximum=max(mylist.get(i).frequency, maximum);
  }
  return maximum;
}

//function that returns the minimum value for the frequencies of all words
int get_min_frequency(ArrayList<Word> mylist) {
  int minimum=100000000;
  for (int i=0;i<mylist.size();i++) {
    minimum=min(mylist.get(i).frequency, minimum);
  }
  return minimum;
}


