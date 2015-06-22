class Word {
  String content;
  int frequency;
  int c;
  float x;
  float y;


  Word(String actualword) {
    content=actualword;
    frequency=1;
    c=255;
    x=random(1280);
    y=random(720);
  }

  void display() {
    fill(c, c, c);
    textSize(frequency+10);
    text(content, x, y);
  }
  void move() {
    x=frequency+x;
    if (x>1280) {
      x=0;
      y=random(720-2*(10+frequency)+10+frequency);
    }
  }
}

