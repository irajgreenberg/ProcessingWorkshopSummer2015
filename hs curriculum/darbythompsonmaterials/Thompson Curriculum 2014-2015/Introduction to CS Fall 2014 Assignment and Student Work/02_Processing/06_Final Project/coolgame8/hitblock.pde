int hitblock(float x, float y, float bx, float by, float bw, float bh){
  if(x+20>=bx && x-20<=bx+bw && y+20>=by && y-20<=by+bh){
    return 1;
  } 
  else{
    return 0;
  }

}
