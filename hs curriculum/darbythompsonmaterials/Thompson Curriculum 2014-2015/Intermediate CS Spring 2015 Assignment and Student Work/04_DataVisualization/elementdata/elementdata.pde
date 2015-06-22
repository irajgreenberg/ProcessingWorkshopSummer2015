//data visualization project of elements in earth
//2/23/15
int first=0;
ArrayList<Element> elements;
int mode=0;
int flag=0;
void setup() {
  smooth();
  size(900, 900);
  //part2count finds line at which second stage of data parsing begins
  int part2count=0;
  elements = new ArrayList<Element>();
  //Parsing data into Element object
  String[] data = loadStrings("elements.txt");
  //initial parsing handles name of element, prevalence in earth
  for (int i=0; i<data.length; i=i+2)
  {
    if (data[i].equals(" ")) {
      part2count=i+1;
      break;
    } else {
      double prevalence=0;
      String[] parts = splitTokens(data[i+1], "N/A×%-");
      if (parts.length>0) {
        prevalence=Double.valueOf(parts[0]);
        if (parts.length>1) {
          prevalence=prevalence*Math.pow(10, -1*Double.valueOf(parts[2]));
        }
      } else {
        prevalence=0;
      }
      elements.add(new Element(data[i], 0, prevalence, 0, random(20, width-20), random(20, height-20)));
    }
  }
  //second stage of parsing assigns each element an atomic mass and atomic number
  for (int i=part2count; i<data.length; i++) {
    String[] parts = splitTokens(data[i], "\t ");
    for (int x=0; x<elements.size (); x++) {
      if (parts[1].equals(elements.get(x).name1)) {
        elements.get(x).size = Float.valueOf(parts[0]);
        elements.get(x).atomic = Integer.valueOf(parts[3]);
        break;
      }
    }
  }
  //removing all elements for which there was not a complete data set
  for (int i=elements.size()-1; i>=0; i--)
  {
    if (elements.get(i).size==0){
     elements.remove(i);
    } 
    
  }
  //assigning a radius to each element based on its relative pressence in earth
  for (int i=elements.size()-1; i>=0; i--)
  {
    int count2=0;
    for (int x=elements.size()-1; x>=0; x--)
    {
      if (elements.get(i).presence>elements.get(x).presence){
         count2+=1;
      } 
    }
    elements.get(i).radius=10+count2/10;
  }
  
}

void draw() {
  background(255);
  //starting screen
  if (mode==0) {
    fill(0);
    textSize(30);
    text("This data set represents all the elements 1 through 111. Each circle represents an element. The more blue the circle is, the lower the atomic number, the more red, the higher the atomic number. The faster an element is moving across the screen, the lower its atomic mass. Finally, the radius of each circle represents the element's presence in earth. To display the name and data set for each element, simply click on one as it moves across the screen. Click to begin visualization.", 200, 120, 500, 700);
  }
  //default screen in which elements are moving
  if (mode==1) {
    for (int i=elements.size ()-1; i>=0; i--)
    {
      elements.get(i).move();
      elements.get(i).display();
      if (elements.get(i).epos.x<=elements.get(i).radius || elements.get(i).epos.x>=width-elements.get(i).radius || elements.get(i).epos.y>=height-elements.get(i).radius || elements.get(i).epos.y<=elements.get(i).radius) {
        elements.get(i).epos.x=random(20, width-20);
        elements.get(i).epos.y=random(20, height-20);
        elements.get(i).theta=random(0, 2*PI);
      }
    }
  }
 //clicked mode where elements are displayed but not moved 
  else if (mode==2) {
    for (int i=elements.size ()-1; i>=0; i--)
    {
      elements.get(i).display();
    }
    if (mousePressed==false){
      mode=1;
    }
  }
  //hit detection, displaying element information
  if (mousePressed==true) {
    mode=2;
    flag=1;
    for (int i=elements.size ()-1; i>=0; i--)
    {
      if (mouseX>=elements.get(i).epos.x-elements.get(i).radius && mouseX<=elements.get(i).epos.x+elements.get(i).radius && mouseY>=elements.get(i).epos.y-elements.get(i).radius && mouseY<=elements.get(i).epos.y+elements.get(i).radius) {
        fill(0);
        textSize(15);
        text("Name:  "+elements.get(i).name1, mouseX, mouseY+10, 1000, 1000);
        text("Atomic Number:  "+String.valueOf(elements.get(i).atomic), mouseX, mouseY+30, 1000, 1000);
        text("Average Atomic Mass:  "+String.valueOf(elements.get(i).size), mouseX, mouseY+50, 1000, 1000);
        text("Prevalence in earth:  "+String.valueOf(elements.get(i).presence)+"%", mouseX, mouseY+70, 1000, 1000);
        flag=1;
        break;
      }
    }
  }
}

