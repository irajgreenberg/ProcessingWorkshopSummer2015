   class Floor {
  int y;
  int fheight;
  Floor(int x1, int y1) {
    y = y1;
    fheight = 10;
  }
  void display() {
    fill(255,0,0);
    rect(0, y+25, width, fheight);
  }
}

