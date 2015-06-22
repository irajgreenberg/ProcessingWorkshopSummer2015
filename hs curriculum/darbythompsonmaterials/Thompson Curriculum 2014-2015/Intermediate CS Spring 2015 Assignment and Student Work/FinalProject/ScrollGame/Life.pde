private class Life {
  private int x;
  private int y;
  private int size;
  private int fill;
  private int faceFill;
  private Life(int lifeCount) {
    size=width/24;
    x=width-(lifeCount+1)*size;
    y=size;
    fill=#835F30;
    faceFill=#F7CB91;
  }

  private void display() {
    ellipseMode(CORNER);
    fill(fill);
    noStroke();
    ellipse(x, y, size, size);
    stroke(faceFill);
    line(x+size/5, y+size/3, x+size*2/5, y+size/3);
    line(x+size*3/5, y+size/3, x+size*4/5, y+size/3);
    line(x+size/3, y+size*2/3, x+size*2/3, y+size*2/3);
  }
}

