class Alien {
//alien properties
  float x;
  float y;
  float speed;
  float wide;
  float tall;

  Alien(float startX, float startY, int speedLevel) {//you need "speedLevel" because speed changes depending on the level

    x=startX;
    y=startY;
    speed=-(1+(speedLevel/4));//at levels multiples of 4, the speed goes up by 1 pixel/second. 
    wide=40;
    tall=40;
  }
//alien abilities
  void move() {

    x=x+speed;
  }

  void display() {

    image(game.alien, x-(wide/2), y-(tall/2));
  }

  void changeSpeed() {               //not only does it change direction but it moves down by one unit of its height

    speed=-speed;
    y=y+tall;
  }
}

