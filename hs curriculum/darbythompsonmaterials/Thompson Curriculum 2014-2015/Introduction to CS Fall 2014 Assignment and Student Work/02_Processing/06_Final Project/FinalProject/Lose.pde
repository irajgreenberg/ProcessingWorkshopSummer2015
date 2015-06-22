boolean Lose(float t) {
  background(220);
  PImage record = loadImage("DodgeRecord.jpg");


  textSize(20);
  if ((t/2 - 2) > 2) {
    record = shrinkPic(record);

    image(record, 0, 70);
    text("Record: ", 70, 220);

    text("Click save if this time is more than the record!", 100, 400); 
    textSize(30);
    fill(200, 40, 40);
    rect(120, 500, 120, 40);
    fill(0, 0, 0);
    text("Save", 150, 530);
    fill(200, 40, 40);
    rect(360, 500, 120, 40);
    fill(0, 0, 0);
    text("Restart", 370, 530);
    text("You lost after " + nf(t/2 - 2, 2, 2) + " seconds.", 100, 300);

    return true;
  } 
  else {
    textSize(30);
    record = shrinkPic(record);
    text("You lost after " + nf(t/2 - 2, 2, 2) + " seconds.", 70, 120);
    image(record, 80, 150);
textSize(20);
    text("Record: ", 150, 300);
    fill(200, 40, 40);
    rect(360, 500, 120, 40);
    fill(0, 0, 0);
    textSize(30);
    text("Restart", 370, 530);
    return false;
  }
}

