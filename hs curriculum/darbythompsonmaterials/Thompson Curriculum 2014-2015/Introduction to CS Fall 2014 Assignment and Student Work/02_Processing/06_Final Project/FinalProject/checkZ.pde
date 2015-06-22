int checkZ(int z) {
 if(z == 0) {
   z = int(random(-5,-1));
  
 } 
 
 if(z > 15) {
   if(z > 280 && z < 360) {
     z = int(random(400,550));
   }
 }
 
  return z;
}
