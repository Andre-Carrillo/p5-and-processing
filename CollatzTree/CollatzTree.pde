import processing.pdf.*;
void setup() {
  size(700, 600);
  beginRecord(PDF, "CollatzConjectureTree.pdf");
  background(0);
  float len=5;
  float angle=0.15;

  for (int i=1; i<10000; i++) {
    resetMatrix();
    translate(width/2, height);
    int n=i;
    IntList sequence = new IntList();
    do {
      sequence.push(n);
      n=collatz(n);

    } while (n!=1);
    sequence.push(1);
    sequence.push(n);
    sequence.reverse();
    for (int j=0; j<sequence.size(); j++){
      int value = sequence.get(j);
      if (value%2==0) {
        rotate(angle);
      } else {
        rotate(-angle);
      }
      stroke(255, 100);
      strokeWeight(1);
      line(0, 0, 0, -len);
      translate(0, -len);
    }
  }
  endRecord();
}
void draw() {
}
int collatz(int n) {
  if (n%2==0) {
    return n/2;
  } else {
    return (3*n+1)/2;
  }
}
