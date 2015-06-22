//Data//
//24 pieces of data
/*
*/ 
int frames = 0;
float framedelay = 24.0;
int disp;
int rectmade = 0;
int mode = 0;
boolean repeat = false;
Data[] main;
void setup() {
  
 size(800,800);
 fill(0);
 background(0);
  fill(255);
  String[] lines = loadStrings("RwandanAidsDeaths.txt");
 // print(lines.length);
  main = new Data[lines.length];
  for(int i = lines.length-1; i >=0; i--) {
   String[] pieces = split(lines[lines.length-1-i], "\t"); 
   //trim(pieces);
   
  // println(pieces[5]);
   //for(int j = 0; j < lines.length; j++) {
     
 int a= int(pieces[2]); // years
// println(a);
 int b= int((pieces[5])); //deaths
// println(b);
 int c= (i); // order
  main[i] = new Data(b,a,c);
 //println("hi");
 main[i].r = b/100;

}
//  }
  
  


}//end setup

void draw() {
  
  noStroke();
 background(0);
 
 fill(255);
  textSize(40);
   text("Aids deaths in Rwanda", width/2 - 200, height);
   
   if(mode == 1){
  disp = int(frames/framedelay);
  
  
  if(disp < 24) {
   main[disp].display();
   }
  
 // println(main[disp].year);


else{
  ;
 // intermediate section
  textSize(24);
    fill(100);
    
  
for(int i = 0; i < 24; i++) {
main[i].display();
fill(0);
rect(0,0,width,180);
}  
  fill(255);
   text("'r' to replay", width*0.45,height*0.5);
  if(keyPressed && key == 'r') {
    
  
 frames = 0;
mode = 0; 



}
}//end intermediate section part1
 //end intermediate 


   frames++;}//end mode 1
  else{  //start of game mode 0
 

  
  
    fill(255);
    textSize(24);
    fill(100);
    rect(width*0.7, height/3, width*0.3, height/3);
    fill(255);
   text("Click to start", width*0.75,height*0.5);
   text("Click 'u' to increase speed", width*0.15, height*0.45);
  text("Click 'j' to decrease speed", width*0.15, height*0.55);;
  text("Delay: "+framedelay, 100,100);
  if(keyPressed && key == 'u' && framedelay > 1) {
   framedelay--; 
   
  }
  if(keyPressed && key == 'j') {
   framedelay++; 
  }
  
  
  
  if(mousePressed && mouseY > height/3 && mouseY < height*2/3 && mouseX > width*0.7) {
   mode = 1; 
    
  }
  }//end else
  //println(frames);
}






