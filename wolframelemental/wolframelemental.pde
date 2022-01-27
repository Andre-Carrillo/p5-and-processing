int num=200; //<>// //<>// //<>//
int len;
int[] grid=new int[num];
int rule = 30;
int[] rulearr;
int getNextNumber(int[] arr, int inx) {
  int index=arr[inx]*2+arr[inx-1]*4+arr[inx+1];
  return rulearr[index];
}

void setup() {
  size(800, 600);
  len=width/num;
  String rules=binary(rule, 8).toString();
  rulearr=new int[8];
  println(rules);
  grid[floor(num/2)]=1;
  for (int i=0; i<8; i++) {
    rulearr[i]=int(rules.charAt(i))-48;
  }
  for (int i = 0; i < rulearr.length / 2; i++) {
        int temp = rulearr[i];
        rulearr[i] = rulearr[rulearr.length - 1 - i];
        rulearr[rulearr.length - 1 - i] = temp;
    }
} //<>//
//el 
void draw() {
  background(0);    
  int[] nextgrid=new int[num];  
  for (int i=0; i<floor(height/len); i++) {
    for (int j=0; j<grid.length; j++) {
      fill(abs(grid[j]-1)*255);
      noStroke();
      rect(j*len, i*len, len, len);
      if ((j<1) || (j>grid.length-2)) {
        int k=1;
      } else {
        int bef=grid[j-1];
        int now=grid[j];
        int aft=grid[j+1];
        int index=bef*4+now*2+aft;
        nextgrid[j]=rulearr[index];

      }
    }
    arrayCopy(nextgrid, grid);
  }
  noLoop();
}
