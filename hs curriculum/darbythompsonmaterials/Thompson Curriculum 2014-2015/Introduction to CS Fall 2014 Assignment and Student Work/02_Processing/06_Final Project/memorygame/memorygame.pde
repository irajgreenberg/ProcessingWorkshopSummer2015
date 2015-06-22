//Tuesday, December 2, 2014 - Monday, January 5, 2015
//final project - memory game

int counter = 0;

boolean a = false;
boolean b = false;
boolean c = false;
boolean d = false;
boolean e = false;
boolean f = false;
boolean g = false;
boolean h = false;
boolean i = false;

boolean reset = true;
boolean win = false;

//order: c,f,g,a,i,d,h,b,e
int cc = 0;
int ff = 0;
int gg = 0;
int aa = 0;
int ii = 0;
int dd = 0;
int hh = 0;
int bb = 0;
int ee = 0;

void setup() {

  
  size(800, 550);
  

}


void draw() {
  
  //starting setup:
  if (reset == true && win == false) {
    
    fill(235);
    noStroke();
    rect(0, 0, 800, 550);

    textSize(20);
    fill(0);
    text("click the boxes in color order", 250, 66); 
    textSize(15);
    text("start here", 152, 380);
  
    fill(135);
    rect(170, 107.5, 30, 30);
    rect(170, 245, 30, 30);
    rect(170, 382.5, 30, 30);
    rect(370, 107.5, 30, 30);
    rect(370, 245, 30, 30);
    rect(370, 382.5, 30, 30);
    rect(570, 107.5, 30, 30);
    rect(570, 245, 30, 30);
    rect(570, 382.5, 30, 30);
    
    a = false;
    b = false;
    c = false;
    d = false;
    e = false;
    f = false;
    g = false;
    h = false;
    i = false;
  }

  //selecting boxes:
  if (mousePressed && win == false) {
    if (mouseX>170 && mouseX<200 && mouseY>107.5 && mouseY<137.5) {
      fill(255, 241, 0);  //4 yellow
      rect(170, 107.5, 30, 30);
      a = true;
      reset = false;
      aa = 0;
    } else if (mouseX>170 && mouseX<200 && mouseY>245 && mouseY<275) {
      fill(102, 44, 144);  //8 purple
      rect(170, 245, 30, 30);
      b = true;
      reset = false;
      bb = 0;
    } else if (mouseX>170 && mouseX<200 && mouseY>382.5 && mouseY<412.5) {
      fill(236, 28, 35); //1 red
      rect(170, 382.5, 30, 30);
      c = true;
      reset = false;
      cc = 0;
    } else if (mouseX>370 && mouseX<400 && mouseY>107.5 && mouseY<137.5) {
      fill(0, 112, 125);  //6 bl green
      rect(370, 107.5, 30, 30);
      d = true;
      reset = false;
      dd = 0;
    } else if (mouseX>370 && mouseX<400 && mouseY>245 && mouseY<275) {
      fill(168, 39, 95);  //9 red purple
      rect(370, 245, 30, 30);
      e = true;
      reset = false;
      ee = 0;
    } else if (mouseX>370 && mouseX<400 && mouseY>382.5 && mouseY<412.5) {
      fill(242, 100, 43);  //2 orange
      rect(370, 382.5, 30, 30);
      f = true;
      reset = false;
      ff = 0;
    } else if (mouseX>570 && mouseX<600 && mouseY>107.5 && mouseY<137.5) {
      fill(251, 170, 24);  //3 yellow orange
      rect(570, 107.5, 30, 30);
      g = true;
      reset = false;
      gg = 0;
    } else if (mouseX>570 && mouseX<600 && mouseY>245 && mouseY<275) {
      fill(46, 48, 145);  //7 blue
      rect(570, 245, 30, 30);
      h = true;
      reset = false;
      hh = 0;
    } else if (mouseX>570 && mouseX<600 && mouseY>382.5 && mouseY<412.5) {
      fill(0, 165, 80);  //5 green
      rect(570, 382.5, 30, 30); 
      i = true;
      reset = false;
      ii = 0;
    }
  }

  //order boxes must be selected in:
  //c,f,g,a,i,d,h,b,e
  
  if (c == true && cc < counter) { //1
    if (f == true && ff < cc) { //2
      if (g == true && gg < ff) { //3
        if (a == true && aa < gg) { //4
          if (i == true && ii < aa) { //5
            if (d == true && dd < ii) { //6
              if (h == true && hh < dd) { //7
                if (b == true && bb < hh) { //8
                  if (e == true && ee < bb) { //9
                    win = true;
                  } 
                } 
                else if (b == true || e == true){
                  reset = true;
                }
              } 
              else if (h == true || b == true || e == true){
                reset = true;
              }
            }
            else if (d == true || h == true || b == true || e == true){
            reset = true;
            }
          }
          else if (i == true || d == true || h == true 
          || b == true || e == true){
          reset = true;
          }
        }
        else if (a == true || i == true || d == true 
        || h == true || b == true || e == true){
        reset = true;
        }
      } 
      else if (g == true || a == true || i == true || 
      d == true || h == true || b == true || e == true){
      reset = true;
      }
    }
    else if (f == true || g == true || a == true || i == true 
    || d == true || h == true || b == true || e == true){
    reset = true;
    }
  }
  else if (f == true || g == true || a == true || i == true 
    || d == true || h == true || b == true || e == true){
    reset = true;
  }
  
  //winning:
  if (win == true){
    if (ee == 12){
      fill(235);
      noStroke();
      rect(0, 0, 800, 550);
    }
    if (ee > 12){
      textSize(20);
      fill(random(0,255), random(0,240), random(0,255));
      text("yay", random(0, 800), random(0, 550));
    }
    if (ee > 80){
      fill(235);
      rect(320, 195, 160, 60);
      textSize(40);
      fill(0);
      text("reset", 355, 237);
      if (mousePressed && mouseX>320 && mouseX<480 && 
      mouseY>195 && mouseY<275){
          win=false;
          reset=true;
      }
    }
   
  }
  
  counter = counter+1;
  //order: c,f,g,a,i,d,h,b,e
  cc = cc+1;
  ff = ff+1;
  gg = gg+1;
  aa = aa+1;
  ii = ii+1;
  dd = dd+1;
  hh = hh+1;
  bb = bb+1;
  ee = ee+1;
}

