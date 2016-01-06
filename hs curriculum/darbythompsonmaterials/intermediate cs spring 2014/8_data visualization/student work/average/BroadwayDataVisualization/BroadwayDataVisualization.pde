/* Mary St. John -- Broadway Show Data Visualization
 */

ArrayList<Show> shows;
float attend = 0;

void setup() {
  size(1200, 900);



  String[] lines = loadStrings("BroadwayShowData.txt");

  shows = new ArrayList<Show>();
  boolean touch;
  for (int i=0; i<lines.length-1; i=i+17) {
    if (int(lines[i+14]) >94) {
      shows.add(new Show(lines[i], float(lines[i+6].replace("$", "").replace(",", "")), lines[i+6], lines[i+8], int(lines[i+14]), float(lines[i+16].replace("%", ""))));
      touch = true;
      while (touch == true) {
        touch = false;
        for (int j = 0; j<shows.size()-1; j++) {
          if (abs(shows.get(shows.size()-1).x-shows.get(j).x) <= shows.get(shows.size()-1).rad+shows.get(j).rad) {
            if (abs(shows.get(shows.size()-1).y-shows.get(j).y) <= shows.get(shows.size()-1).rad+shows.get(j).rad) {
              println("hi");
              shows.get(shows.size()-1).x = int(random(shows.get(shows.size()-1).rad, width-shows.get(shows.size()-1).rad));
              shows.get(shows.size()-1).y = int(random(shows.get(shows.size()-1).rad, height-shows.get(shows.size()-1).rad));
              touch = true;
            }
          }
        }
      }
    }
  }

  for (int i=0; i<shows.size(); i++) {
    attend = attend + shows.get(i).attendance;
  }
  attend = attend/shows.size();
  println(attend);


  for (int i=0; i<shows.size(); i++) {
    //println(shows.get(i).attendance);
  }
}


void draw() {
  for (int i=0; i<shows.size(); i++) {
    shows.get(i).draw();
  }
}

//float(lines[i+8].replace("$", "").replace(",", ""))

