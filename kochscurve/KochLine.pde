class KochLine {
  PVector start;
  PVector end;
  KochLine(PVector a, PVector b) {
    start=a;
    end=b;
  }

  PVector kochA() {
    return start.copy();
  }

  PVector kochB() {
    PVector v = PVector.sub(end, start);
    v.div(3);
    v.add(start);
    return v;
  }

  PVector kochC() {
    PVector h=PVector.sub(end,start);
    PVector a=start.copy();
    h.div(3);
    a.add(h);
    h.rotate(-radians(60));
    a.add(h);
    return a;
  }

  PVector kochD() {
    PVector n=PVector.sub(end,start);
    //al dividir, tienes que poner decimales si no se toma como entero
    n.mult(2/3.0);
    n.add(start);
    return n;
  }
  
  PVector kochE(){
    return end.copy();
  }
  void display() {
    stroke(0);
    line(start.x, start.y, end.x, end.y);
  }
}
