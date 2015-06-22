void setup(){
  hanoiTowers("A", "C", "B", 3);
}

void hanoiTowers(String from, String to, String extra, int numTowers){
  if(numTowers>0){
    hanoiTowers(from, extra, to, numTowers-1);
    println("move a tower from "+from+" to "+to);
    hanoiTowers(extra, to, from, numTowers-1);
  }
}
