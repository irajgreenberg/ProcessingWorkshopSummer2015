////////////////////////////////
//  Paint Program             //
//  Made by Nikhil Chaudhuri  //
////////////////////////////////

Paint_Program ArtPatron;

void setup() {
  size(800, 760);
  ArtPatron = new Paint_Program();
}

// Draws and updates everything.
void draw() {
  loadPixels();
  updatePixels();
  background(255);
  ArtPatron.display();
}

// Maps all key presses, mouse presses, and mouse drags to functions in the ArtPatron (Game Manager).
void keyPressed() {
  ArtPatron.handleKeyPress(key);
}

void mousePressed() {
  ArtPatron.handleMousePress();
}

void mouseDragged() {
  ArtPatron.handleMouseDrag();
}

