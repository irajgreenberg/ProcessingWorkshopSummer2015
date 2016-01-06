float sqr(float x) { 
  return x * x;
}
float dist2(PVector v, PVector w) { 
  return sqr(v.x - w.x) + sqr(v.y - w.y);
}
float distToSegmentSquared(PVector p, PVector v, PVector w) {
  float l2 = dist2(v, w);
  if (l2 == 0) return dist2(p, v);
  float t = ((p.x - v.x) * (w.x - v.x) + (p.y - v.y) * (w.y - v.y)) / l2;
  if (t < 0) return dist2(p, v);
  if (t > 1) return dist2(p, w);
  return dist2(p, new PVector(v.x + t * (w.x - v.x), 
  v.y + t * (w.y - v.y) ));
}
float distToSegment(PVector p, PVector v, PVector w) { 
  return sqrt(distToSegmentSquared(p, v, w));
}

public PVector randomPositionBeyondEdge() {
  float angle = random(0, PI*2);
  return new PVector(  SCREEN_DIAGONAL*cos(angle)+width/2, SCREEN_DIAGONAL*sin(angle)+height/2   );
}

public void copyPVector(PVector source, PVector target) {
  target.x=source.x;
  target.y=source.y;
  target.z=source.z;
}

//returns it in the form [ # , # , # ]
public String toString(IntVector v) {
  if (v.size() == 0) return "[]";
  String out = "[";
  for (int i = 0 ; i < v.size() ; i++) {
    out+=String.format(" %d ,", v.get(i));
  }
  out = out.substring(0, out.length()-1) + "]";
  return out;
}

public boolean contains(IntVector v, int target) {
  for (int i = 0 ; i < v.size() ; i++) {
    if (v.get(i)==target) return true;
  }
  return false;
}

void strokeText(String message, float x, float y, color fill, color outline)
{
  fill(outline);
  text(message, x-1, y);
  text(message, x, y-1);
  text(message, x+1, y);
  text(message, x, y+1);
  fill(fill);
  text(message, x, y);
}

void strokeText(String message, float x, float y, color fill){
  strokeText(message,x,y,fill,#000000);
}

void line(PVector p1, PVector p2){
  line(p1.x,p1.y,p2.x,p2.y);
}
