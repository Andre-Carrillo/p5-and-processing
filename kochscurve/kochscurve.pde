
ArrayList<KochLine> lines;

void setup(){
  size(600, 500);
  lines = new ArrayList<KochLine>();
  PVector start = new PVector(0, height/2);
  PVector end = new PVector(width, height/2);
  lines.add(new KochLine(start, end));
}

void draw(){
  background(255);
  for(KochLine l: lines){
    l.display();
  }
  smooth();
}

void generate(){
  ArrayList<KochLine> newlines = new ArrayList<KochLine>();
  for (KochLine l:lines){
    
    PVector a = l.kochA();
    PVector b = l.kochB();
    PVector c = l.kochC();
    PVector d = l.kochD();
    PVector e = l.kochE();
    
    newlines.add(new KochLine(a, b));
    newlines.add(new KochLine(b, c));
    newlines.add(new KochLine(c, d));
    newlines.add(new KochLine(d, e));
  }
  lines.clear();
  lines.addAll(newlines);
}
void mousePressed(){
  generate();
}
