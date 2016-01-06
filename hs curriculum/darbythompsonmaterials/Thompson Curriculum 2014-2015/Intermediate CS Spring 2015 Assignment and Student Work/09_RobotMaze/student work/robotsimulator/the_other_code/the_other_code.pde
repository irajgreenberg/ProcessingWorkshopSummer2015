if (r.hasFoundGoal()==false) {
    if ((r.canGoRight()==true && r.canGoStraight()==true) || (r.canGoLeft()==true && r.canGoRight()==true) || (r.canGoLeft()==true && r.canGoStraight()==true)) {
      if (r.canGoRight()==true) {
        Boolean a = true;
        if (lastTouched==true) {
          a=false;
          println(a);
          lastTouched=false;
        }
        Movements.add(a);
      }
      if (r.canGoRight()==false) {
        Boolean a = false;
        println(a);
        if (lastTouched==true) {
          a = true;
          lastTouched=false;
        }
        Movements.add(a);
      }
    }

    if (r.canGoRight()==true) {
      r.turnRight();
      r.move();
    }

    else if (r.canGoStraight()==true) {
      r.move();
    }
    else if (r.canGoLeft()==true) {
      r.turnLeft();
      r.move();
    }

    else {
      r.turnRight();
      r.turnRight();
      Movements.remove(Movements.size()-1);
      lastTouched=true;
    }
    if (r.isAtGoal()==true) {
      r.turnRight();
      r.turnRight();
    }
    println(Movements);
  }
  else {
    if ((r.canGoRight()==true && r.canGoStraight()==true) || (r.canGoLeft()==true && r.canGoRight()==true) || (r.canGoLeft()==true && r.canGoStraight()==true)) {
      if (Movements.get(Movements.size()-1)==true) {
        r.turnLeft();
        Movements.remove(Movements.size()-1);
      }
      else if (Movements.get(Movements.size()-1)==false) {
        Movements.remove(Movements.size()-1);
      }
    }
    if (r.canGoStraight()==true) {
      r.move();
    }
    else {
      r.turnLeft();
      r.move();
    }
    println(Movements);
  }
