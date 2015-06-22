class NeeknazAbariSeaCreature extends BasicFish{
  

  //properties
  int x;
  int y;
  int speed;
  int inflate;
  int counter;
  
  //constructor
  NeeknazAbariSeaCreature(){
    x = -30;
    y = int(random(50, height-50));  
    speed = 3;
    inflate = int(random(50, width-70));
    counter = 0;
  }

  //abilities
  void display(){
      ellipseMode(CENTER);
      fill(200, 150, 120);
      noStroke();
      triangle(x, y, x-30, y+10, x-30, y-10);
      ellipse(x, y, 40, 20);
      fill(100);
      ellipse(x+6, y-3, 5, 5);
  }

  void swim(){
      x = x+speed;
      if (x>inflate){
        ellipseMode(CENTER);
        fill(200, 150, 120);
        noStroke();
        triangle(x, y, x-30, y+10, x-30, y-10);
        ellipse(x, y+(counter/20), (counter/5), (counter/5));
        fill(100);
        ellipse(x+6, y-3, 5, 5);
        speed = 1;
      }
      if (x>width+30){
        x = -30;
        y = int(random(50, height-50));
        inflate = int(random(50, width-70));
        speed = 3;
        counter = 0;
      } 
      if (counter<=250){
        counter++;
      }
      else{
        counter = counter;
      }
  }



}
