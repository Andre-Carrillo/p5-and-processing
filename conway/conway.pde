int [][] init = new int[50][50];
void setup() {
  size(600, 600);
}

void draw() {
  background(255);
  int sw = width/(init.length);
  for (int i=0; i<init.length; i++) {
    for (int j=0; j<init[i].length; j++) {
      stroke(0);
      fill(init[i][j]*255);
      rect(sw*(j), sw*(i), sw, sw);
    }
  }
  fill(150);
  noStroke();
  rect(0, 0, width, sw);
  rect(width-sw, 0, sw, height);
  rect(0, height-sw, width, sw);
  rect(0, 0, sw, height);
}

void mousePressed() {
  if (mouseButton==LEFT) {
    init = step(init);
  } else if (mouseButton==RIGHT) {
    if (init[floor(mouseY/(width/init.length))][floor(mouseX/(width/init.length))]==0) {
      init[floor(mouseY/(width/init.length))][floor(mouseX/(width/init.length))]=1;
    } else {
      init[floor(mouseY/(width/init.length))][floor(mouseX/(width/init.length))]=0;
    }
  }
}

int[][] step(int [][] array) {
  int [][] nextarray = new int[init.length][init.length];
  for (int i=1; i<array.length-1; i++) {
    for (int j=1; j<array[i].length-1; j++) {
      int neighbours = array[i-1][j-1] + array[i-1][j] + array[i-1][j+1] + array[i][j-1] + array[i][j+1] + array[i+1][j-1] + array[i+1][j] + array[i+1][j+1];
      if (array[i][j]==1) {
        if (neighbours<2 | neighbours>3) {
          nextarray[i][j]=0;
        } else {
          nextarray[i][j]=1;
        }
      } else {
        if (neighbours==3) {
          nextarray[i][j]=1;
        }
      }
    }
    for (int k=0; k<nextarray[i].length; k++) {
      print(nextarray[i][k]+" ");
    }
    print("\n");
  }  
  print("\n");
  return nextarray;
}
