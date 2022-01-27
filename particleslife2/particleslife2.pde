//lo que quiero es que al inicio se forme una matriz nxn siendo n el número de partículas, lo que irá en la matriz es cómo interactúan
//voy a hacer un array que va a contener a las clases y con un blucle voy a iterar a traves de cada una de las clases y ahí otro loop renderizará las partículas
//


//el problema parece ser que los que tienen n negativo no tienen movimiento propio
final float A=10;//L
final float e=5;
final float k=15;//j
final float r=5;
final float m=abs(A)*k/((2*r+e)*(2*r+e));
final float fr=.5;
final float mv=999;
int numberofclasses=5;
float n_a=-5;
float n_b=5;

float[][] nmatrix= new float[numberofclasses][numberofclasses];


ArrayList<particleClass> system;

int getRandomSign(){
  float r=random(0, 1);
  println(r+"|"+round(r));
  if (round(r)==0){
    return -1;
  }else return 1;
}

void setup() {
  for (int i=0; i<nmatrix.length; i++) {
    for (int j=0; j<nmatrix[i].length; j++) {
      nmatrix[i][j]=random(n_a, n_b)*getRandomSign();
      print(nmatrix[i][j]+"|");
    }
    print("\n");
  }
  size(600, 600);
  system = new ArrayList<particleClass>();
  for (int i=0; i<numberofclasses; i++) {
    system.add(new particleClass(floor(30.0),
      color(random(0, 255), random(0, 255), random(0, 255)),
      i
      ));
  }
  
}

void draw() {
  background(0);
  for (int i=0; i<system.size(); i++) {
    system.get(i).renderGroup();
    system.get(i).moveGroup();
  }
  for (int i=0; i<system.size(); i++) {
    for (int j=0; j<system.get(i).particles.size(); j++) {
      //each particle

      for (int k=0; k<system.size(); k++) {
        for (int l=0; l<system.get(k).particles.size(); l++) {

          system.get(i).particles.get(j).apfparticle(system.get(k).particles.get(l), system.get(k), system.get(i));
        }
      }
    }
  }
}
