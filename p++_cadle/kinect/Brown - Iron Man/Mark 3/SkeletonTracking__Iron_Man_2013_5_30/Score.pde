int points = 0, level = -1;

public int points() {
  if(_debug) points = max(points, 5000);
  return points;
}

public void addPoints(int amount) {
  if(gameOver) return;
  points+=amount;
}

public void addPoints(Missile m) {
  if(gameOver) return;
  addPoints(m.maxHealth());
}

public int level() {
//  if (gameOver) return 0;
  int levelFromPoints = points()/1000+1;
  if(level >= 10)
    levelFromPoints = points()/10000 +9;
  if(_debug)level = max(level,5);
  return level = max(level, levelFromPoints, (millis()-gameStartTime)/60000+1);
}

