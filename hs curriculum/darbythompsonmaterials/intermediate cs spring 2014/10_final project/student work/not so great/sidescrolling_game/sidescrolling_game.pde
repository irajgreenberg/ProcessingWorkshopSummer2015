GameManager game;


  
  void setup() {
    size(1000, 1000);
    game = new GameManager();
    
  }
  
  
  void draw() {
    background(131,205,226);
    game.update();
    game.display();
  }
  
  
  void keyPressed() {
    game.action(key);
  }

