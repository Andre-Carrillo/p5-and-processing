
int res=15;
int rows, cols;
int narray[][];
float z, resu;

void setup(){
  size(600, 600);
  rows=int(width/res);
  cols=int(height/res);
  resu=.2;
  
  narray= new int[rows+1][cols+1];
  z=0;
  for(int i=0; i<rows+1; i++){
    for(int j=0; j<cols+1; j++){
       narray[i][j]=floor(noise(i*resu, j*resu, z)*2);
    }  
  }
  
}
void draw(){
  background(10);
  float radius=2;
  for(int i=0; i<rows+1; i++){
    for(int j=0; j<cols+1; j++){
       fill(narray[i][j]*255);
       noStroke();
       ellipse(i*res, j*res, radius*2, radius*2); 
    }  
  }
  for(int i=0; i<rows; i++){
    for(int j=0; j<cols; j++){
      PVector a = new PVector(res*(i+.5), res*j);
      PVector b = new PVector(res*(i+1), res*(j+.5));
      PVector c = new PVector(res*(i+.5), res*(j+1));
      PVector d = new PVector(res*i, res*(j+.5));
      fill(255);
      stroke(255);
       switch(8*narray[i][j]+4*narray[i+1][j]+2*narray[i+1][j+1]+1*narray[i][j+1]){
         case 1:
         case 14:
           line(d.x, d.y, c.x, c.y); 
           break;
         case 2:
         case 13:
           line(b.x, b.y, c.x, c.y);
           break;
         case 3:
         case 12:
           line(d.x, d.y, b.x, b.y);
           break;
         case 4:
         case 11:
           line(a.x, a.y, b.x, b.y);
           break;
         case 5:
           line(a.x, a.y, d.x, d.y);
           line(b.x, b.y, c.x, c.y);
           break;
         case 6:
         case 9:
           line(a.x, a.y, c.x, c.y);
           break;
         case 7:
         case 8:
           line(d.x, d.y, a.x, a.y);
           break;
         case 10:
           line(a.x, a.y, b.x, b.y);
           line(d.x, d.y, c.x, c.y);         
           break;
       }
    }  
  }

  z+=0.01;
  for(int i=0; i<rows+1; i++){
    for(int j=0; j<cols+1; j++){
       narray[i][j]=floor(noise(i*resu, j*resu, z)*2);
    }  
  }

}
