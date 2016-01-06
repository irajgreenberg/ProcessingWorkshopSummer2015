class GameManager {
  boolean wallHit;
  int maxBullets;
  Player ship;
  ArrayList<Bullet> bullets;
  ArrayList<Alien> aliens;
  ArrayList<Bomb> bombs;

  GameManager() {
    wallHit = false;
    maxBullets = 5;
    ship = new Player();
    bullets = new ArrayList();
    aliens = new ArrayList();
    bombs = new ArrayList();
    for (int j=0; j<7; j++) {
      for (int k=0; k<5; k++) {
        aliens.add(new Alien((j+1)*100, (k+1)*70));
      }
    }
  }
  // responding to key presses

  void action(char key) {
    if (key == 'a') {
      ship.speed = -2;
    }
    else if (key == 's') {
      ship.speed = 0;
    }
    else if (key == 'd') {
      ship.speed = 2;
    }
    else if (key == 'w') {
      if (bullets.size() < maxBullets) {
        bullets.add(new Bullet(ship.x, ship.y));
      }
    }
  }

  // draws all objects + lives, score, and bullets available
  void display() {
    ship.draw();
    for (Bullet b : bullets) {
      b.draw();
    }
    for (Alien a : aliens) {
      a.draw();
    }
    for (Bomb z : bombs) {
      z.draw();
    }
    fill(255);
    textAlign(RIGHT, TOP);
    textSize(20);
    text("Lives: "+str(ship.lives), 975, 20);
    textAlign(LEFT, TOP);
    text("Score: "+str(ship.score), 25, 20);
    textAlign(CENTER, TOP);
    text("Bullets Available: " + str(maxBullets-bullets.size()), 500, 25);
  } 

  void update() {
    // randomly creates bombs
    if (random(1)*1000<4) {
      Alien randalien = aliens.get(int(random(aliens.size())));
      bombs.add(new Bomb(randalien.x, randalien.y));
    }


    // moves the ship, bullets, aliens, and bombs
    ship.move();

    for (Bullet b : bullets) {
      b.move();
    }

    for (Alien a : aliens) {
      a.move();
    }
    for (Bomb z : bombs) {
      z.move();
    }

    for (int i = bullets.size()-1; i>=0; i--) {
      if ((bullets.get(i)).y<0) {
        bullets.remove(i);
      }
    }

      for (Alien a: aliens) {
        if (a.x+30 > 1000 || a.x-30 < 0) {
          wallHit = true;
        }
      }
      if (wallHit == true) {
        for (Alien a: aliens) {
          a.speed = -a.speed;
          a.y = a.y + 70;
        }
        wallHit = false;
      }
    
    for (int i = bullets.size()-1; i>=0 ; i--) {
      for (int j = aliens.size()-1; j>=0; j--) {
        if (bullets.get(i).x + bullets.get(i).width/2 > aliens.get(j).x-aliens.get(j).width/2 && bullets.get(i).x - bullets.get(i).width/2 < aliens.get(j).x + aliens.get(j).width/2) {
          if (bullets.get(i).y + bullets.get(i).height/2 > aliens.get(j).y-aliens.get(j).height/2 && bullets.get(i).y - bullets.get(i).height/2 < aliens.get(j).y + aliens.get(j).height/2) {
            bullets.remove(i);
            aliens.remove(j);
            ship.score++;
            break;
          }
        }
      }
    }
    for (int i = bombs.size()-1; i>=0 ; i--) {
      if (bombs.get(i).x + bombs.get(i).width/2 > ship.x-ship.width/2 && bombs.get(i).x - bombs.get(i).width/2 < ship.x+ship.width/2) {
        if (bombs.get(i).y + bombs.get(i).height/2 > ship.y-ship.height/2 && bombs.get(i).y - bombs.get(i).height/2 < ship.y + ship.width/2) {
          bombs.remove(i);
          ship.lives--;
          break;
        }
      }
    }

    for (int i = aliens.size()-1; i>=0 ; i--) {
      if (aliens.get(i).y + aliens.get(i).height/2 >= ship.y-ship.height/2) {
        aliens.remove(i);
        ship.lives = 0;
        break;
      }
    }
    if (ship.lives == 0) {
      noLoop();
      fill(255, 0, 0);
      textSize(100);
      textAlign(CENTER);
      text("You LOST", width/2, height/2);
    }
    else if (aliens.size() == 0) {
      noLoop();
      fill(0, 255, 0);
      textSize(100);
      textAlign(CENTER);
      text("You WON", width/2, height/2);
    }
  }
}

