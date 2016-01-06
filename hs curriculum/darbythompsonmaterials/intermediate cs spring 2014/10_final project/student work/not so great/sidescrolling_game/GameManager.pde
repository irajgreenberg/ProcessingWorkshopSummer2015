class GameManager {

  Player player;
  ArrayList <Blocks> blocks;
  boolean GameOver=false;
  int score = 0;
  int highscore=0;



  GameManager() {
    player = new Player();
    blocks = new ArrayList();
    for (int j=0; j<60; j++) {  
      Blocks b = new Blocks(1000+300*j, 0);
      blocks.add(b);
    }
  }

  void display() {
      
      
      player.draw();
      for (Blocks b: blocks) {
        b.draw();
      if (GameOver==true){
        if (score>highscore){
          highscore=score;
        }
        fill(219,220,140);
        stroke(0);
        rect(350, 350, 320, 180);
        
        textSize(40);
        fill(0);
        text(score, 530, 411); 
        
        textSize(40);
        fill(0);
        text("Score:", 385,410); 
        
        textSize(40);
        fill(0);
        text(score, 600, 471); 
        
        textSize(40);
        fill(0);
        text("Highscore:", 385,470); 
        
        
      }
     
      if (GameOver==false){
      fill(255);
      stroke(0);
      rect(450, 20, 100, 50);
      
      textSize(40);
      fill(0);
      stroke(0);
      text(score, 460, 60); 
      }
      
      
      
    }
  }

  void update() {
      
        player.move();
      if (GameOver==false){
        for (Blocks b: blocks) {
          b.move();
        }
      }
    
    if (GameOver==true){
      player.speedy=15;
    }
    
    if (player.x>940){
        player.speedy=0;
        println("G1G2G2G31HG2H31GH4JG1H2G1");
        GameOver=true;
      }
    for (int j=blocks.size()-1; j>=0; j--) {  
      if (blocks.get(j).x<player.x+player.width && player.x-player.width<blocks.get(j).x+110) {
        println("1234567890987654321");
        if (blocks.get(j).y<player.y-player.height && player.y+player.height<blocks.get(j).y+blocks.get(j).r) {
          println("suighfliawufghaiwfncgnow7eycgi7asyoigch");
          GameOver=true;
        }
        if (blocks.get(j).yy<player.y-player.height && player.y+player.height<blocks.get(j).yy+900) {
          println("suighfliawufghaiwfncgnow7eycgi7asyoigch");
          GameOver=true;
        }
        if (player.x>980){
          GameOver=true;
        }
      }
      if (player.x==blocks.get(j).x+55) {
        score=score+1;
        break;
      }
      

    }
    
  }

  void action(char key) {

    if (GameOver==false) {  
      player.action(key);
    }
    if (GameOver==true) {  
      if (key== 'r'){
        GameOver=false;
        player.x=100;
        player.y=500;
      }    
    }
  }
}

