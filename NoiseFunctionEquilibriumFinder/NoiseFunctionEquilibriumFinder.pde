int lowcounter=0;
int upcounter=0;
float t=0;
float check;
float point=0.465625;
void setup() {
}
void draw() {
  check=noise(t);
  if (check<=point){
    lowcounter+=1;
  }else if(point<check && check<1){
    upcounter+=1;
  }
  
  println("Low: "+lowcounter*100/(lowcounter+upcounter)+"% Up: "+upcounter*100/(lowcounter+upcounter)+"%");
  t+=0.1;
}
