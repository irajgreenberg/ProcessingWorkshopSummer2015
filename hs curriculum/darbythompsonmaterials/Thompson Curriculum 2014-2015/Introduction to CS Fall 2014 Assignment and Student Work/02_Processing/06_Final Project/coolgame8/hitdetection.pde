int hitdetection(float x, float y, float tx, float ty, float st){
  if (abs(tx-x)<20+st/2 && abs(ty-y)<20+st/2){
    return 1;
  }
  else{
    return 0;
  }
}
