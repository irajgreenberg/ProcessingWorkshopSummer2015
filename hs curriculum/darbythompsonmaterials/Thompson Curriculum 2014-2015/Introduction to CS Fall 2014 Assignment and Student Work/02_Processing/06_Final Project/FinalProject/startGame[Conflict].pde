void startGame(boolean g) {
  //High box, Low box
  fill(130,230,130);
  rect(400, 170, 100, 80, 40);
  rect(400, 330, 100, 80, 40);
  fill(0,0,0);
  textSize(28);
  text("HI",433, 225);
  text("LOW",417,385);
  
  
  if(switch = true){
  float jfloat = random(12);
  int j = int(jfloat);
  String num = "" + j;
  textSize(84);
  text(num, 250, 320);
  }
}
