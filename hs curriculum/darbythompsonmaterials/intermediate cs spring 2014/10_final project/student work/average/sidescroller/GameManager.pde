class GameManager{
  Player p;
  ArrayList<Block>blocks;
  int z=0;
  int s=-4;
  int level=1;
  
  GameManager(){
    p = new Player(300,-300,10, 0, 3);
    blocks = new ArrayList<Block>();
    for (int i=0; i<4; i++){
      Block b = new Block ((i+1)*250, 600, 150, -4, 0);
      blocks.add(b);
    }
    
  }
  
  void display(){
    p.draw();
    for (Block b: blocks){
      if (b.l==0){
        fill(0,0,255);
        b.draw();
      }
      if (b.l==1){
        fill(0,255,0);
        b.draw();
      }
    }
    fill(255);
    textSize(30);
    text(p.score, 150, 50);
    text("Score: ", 50, 50);
    text("Lives: ", 550, 50);
    text(p.lives, 650, 50);
    text("Level: ", 350, 50);
    text(level, 440,50);
  }
  
  void update(){
    
    //Moving
    
    p.move();
    for (Block b: blocks){
      b.move();
    }
    
    //Collision Detection
    
    for (int i=blocks.size()-1; i>=0; i--){
      Block b = blocks.get(i);
     
      if ((p.y+15)>=(b.y-5) && p.y+15<=b.y+5 && p.x>=b.x && (p.x+15)<=(b.x+b.w)){
        p.speed=0;
        b.l=1;
        p.a=0;
        p.score=p.score+10;
        p.y=b.y-15;
      }
      if (-3<b.y-p.y+20 && b.y+20-p.y<3 && p.x>=b.x && (p.x+15)<=(b.x+b.w)){
        p.speed=10;
        p.a=0;
      }
    }
    
    //Adding Blocks
    
    if (blocks.size()==3){
      fill(0,0,255);
      Block a = blocks.get(0);
      Block b = new Block (800, int(random(500,700)), 150, s, 0);
      blocks.add(b);
      z++;
    }

    
    //Removing Blocks
    
    for (int i=blocks.size()-1;i>=0; i--){
      Block b = blocks.get(i);
      if ((b.x+b.w)<=0){
        blocks.remove(i);
      }
    }
    
    //Speeding Up
    
    if (z==15){
      s--;
      level++;
      for (Block b: blocks){
        b.speed=s;
      }
      z=0;
    }
    
    //Lives
    
    if (p.y>800){
      p.lives--;
      p.x=300;
      p.y=-300;
      p.a=0;
    }
    
    //Game Over
    
    if (p.lives==0){
      fill(255,0,0);
      textSize(75);
      text("You Lose", width/4, height/2);
      noLoop();
    }
      
  }
  
  void action(char key){
    if (keyCode==UP){
      p.jump();
    }
  }
  
  
  
  
  
  
  
}
