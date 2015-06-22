//MS Paint Program
ArrayList<Drawable> shapes;
int gm = 1; //Circles are 1
float r = random(255);
float g = random(255);
float b = random(255);
boolean haveyousaved = false;
int selectr = 0;
int selectb = 230;
int selectg = 230;
int offwhite = 205;
float wheelg;
float wheelr;
float wheelb;
int frames = 0;
int toolY = 60;
String mode = "Circle";
boolean colorchange = false;
ArrayList<Drawable> deleted;
//PImage wheel;
void setup() {

  background(offwhite);
  size(600, 600);
  shapes = new ArrayList<Drawable>();
  deleted = new ArrayList<Drawable>();

  //toolbar
 
  
  
}


void draw() {
   background(offwhite);
   
   for (Drawable s : shapes) {
    s.display();
  }
   colors(colorchange);
 // wheel = shrinkPic(wheel);
 fill(r,g,b);
  
 
  toolbar(); //all the tool stuff except the color wheel

  
  //strokeWeight(1);

  
 //Mode display
 
  if(frames > 240) {
   frames=0;
  haveyousaved = false; 
    
  }
}//end draw









void mousePressed() {

  if (mouseY > toolY && (!colorchange)) { //assuming the person isn't clicking on the toolbar
   fill(r,g,b);
    if (gm ==1) {

      Circle c = new Circle(mouseX, mouseY,r,g,b);
      shapes.add(c);
    } // End circle command

    if (gm ==2) {
      Square s = new Square(mouseX, mouseY,r,g,b);
      shapes.add(s);
    } //End square command

    if (gm == 3) {
      stroke(10);
      Line l = new Line(mouseX, mouseY,r,g,b);
      shapes.add(l);
    }//End line command
  }//end of object creation
  //toolbar management
  else{
  //Circle mode
  
  if(mouseY >= 20 && mouseY <= 40 && !colorchange) {
     //redo rect(254,20,44,20,4);//redo
    if(mouseX >= 254 && mouseX < 298 && deleted.size()>0){
     
 shapes.add(deleted.get(deleted.size()-1)); 
 deleted.remove(deleted.size()-1);
    }
    
  if(mouseX >= 20 && mouseX <=68) {
    gm = 1;
    
  }
  if(mouseX >=84 && mouseX <=139) {
    gm = 2;
    
  }
  if(mouseX >=154 && mouseX <=191){
   gm = 3; 
  }
  
  
  if(mouseX >= 400 && mouseX <= 442) {
     if(shapes.size() > 0) {
       deleted.add(shapes.get(shapes.size()-1));
   shapes.remove(shapes.size()-1); 
     }
  }
  
  if(mouseX >= 447 && mouseY <= 491){
    if(shapes.size()>0){
     for(int i = shapes.size()-1; i>=0; i--){
      shapes.remove(i);
      
     } 
    }
    
  }
  
}//End of circle/square/line management
 if(mouseX >= 203 && mouseX <= 247 && mouseY > 15 && mouseY < 40) { //save
   
   int ran = int(random(100000000));
   save("My picture " + ran + ".jpg");
   haveyousaved = true;
 }
 if(colorchange){
  
loadPixels();

 r = red(pixels[mouseX + mouseY*width]);
 g = green(pixels[mouseX + mouseY*width]);
 b = blue(pixels[mouseX + mouseY*width]);
 updatePixels();
  colorchange = false;
}
 //rect(width/2,10,80,40); //Change color
  if(mouseX >= width/2 && mouseX <= width/2+80 && mouseY >= 10 && mouseY <=40){
   colorchange=true; 
    
  }
//color wheel



}//end of toolbar management
}//end of mousePressed

void keyPressed() {
  if (key == '1') {
    gm = 1;
  } 

  if (key == '2') {
    gm = 2;
  }

  if (key == '3') {
    gm = 3;
  }

if(key == 'r' && deleted.size()>0){
 shapes.add(deleted.get(deleted.size()-1)); 
 deleted.remove(deleted.size()-1);
}
}
void mouseDragged() {
  
 if(mouseY <60 || (colorchange)){
 }
 else{
     //shapes.remove(shapes.size()-1);
     if(shapes.size() > 0) {
       
       
  shapes.get(shapes.size()-1).modify(); //Drags the shape
     }
 }
  
  
}










//ShrinkPic
PImage shrinkPic(PImage pic) {
 PImage newpic = createImage(pic.width/2, pic.height/2, RGB);
 for(int x = 0; x < newpic.width; x++) {
    for(int y = 0; y < newpic.height; y++) {
       newpic.pixels[x+y*newpic.width] = pic.pixels[(x+y*pic.width)*2]; 
      
    }
   
   
 }
   
   
 return newpic;
  
}



void toolbar() {
  fill(0);
  noStroke();
  rect(0, 0, width, 60);//end of background of toolbar

  //Toolbar buttons
  fill(offwhite);
  
  //button rectangles
  if(gm == 1){
   fill(selectr,selectg,selectb); 
  }
  rect(20,20,48,20,4);//circle
  fill(offwhite);
  if(gm == 2){
    fill(selectr,selectg,selectb);
  }
  rect(84,20,55,20,4);//square
  fill(offwhite);
  if(gm == 3){
    fill(selectr,selectg,selectb);
  }
  rect(154,20,37,20,4);//line
  fill(offwhite);
  rect(400,20,42,20,4);//undo
  rect(447,20,44,20,4);//clear
  rect(254,20,44,20,4);//redo
  if(haveyousaved){
   fill(0,255,0);
  frames ++; 
  }
  rect(203,15,44,25,4);//save
 
  //button text
  fill(0);
  textSize(15);
  
  text("Circle",23,36);
  text("Square",87,36);
  text("Line",157,36); 
  text("Undo",403,37);
  text("Clear",450,37);
  text("Save",208,34);
  text("Redo",257,37);
  fill(offwhite);
 rect(width-90,10,83,40);
 textSize(10);
 fill(10);
 text("Mode",width-77,20);
 if(gm == 1) {
   mode = "Circle";
 }
 if(gm == 2) {
  mode = "Square"; 
 }
 if(gm == 3) {
  mode = "Line"; 
 }
 textSize(24);
 fill(0);
 text(mode,width-87,48);
  
 //Toolbar Color display
 fill(r,g,b);
 rect(width/2,10,80,40);
 fill(255-r,255-g,255-b);
 textSize(14);
 text("Color",width/2+5,50);
 text("Click to",width/2+5,24);
 text("change",width/2+5,35);
 
 
 
}




void colors(boolean c){
//color change
 if(c){
 PImage wheel=loadImage("colors.jpg");
  image(wheel,width/2-(wheel.width/2), height/2-(wheel.height/2));
  
  fill(0);
  textSize(18);
  text("Click anywhere on-screen to use that color",100,500);
 }  
}





