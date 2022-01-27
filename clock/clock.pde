void setup(){
size(400, 400);
}
void draw(){
  background(150);
  translate(width/2, height/2);
  rotate(radians(270));
  fill(50);
  noStroke();
  ellipse(0, 0, 350, 350);
  stroke(255);
  float unit=second()*PI/30;
  float unitm=minute()*PI/30;
  float unith=hour()*PI/12;
  line(0, 0, 170*cos(unit), 170*sin(unit));
  line(0, 0, 150*cos(unitm), 150*sin(unitm));
  line(0, 0, 100*cos(unith), 100*sin(unith));  
}
