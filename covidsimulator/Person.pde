class Person {
  PVector pos;
  boolean isPos;
  float r = 10;
  float noisecounter=random(10000);
  float counter=0;
  int timeof;//time the illness takes
  boolean isInm;
  int timeofinm;
  int timeofinmunity=400;

  Person(boolean isPositive) {
    pos = new PVector(random(width), random(height));
    isPos = isPositive;
    isInm=false;
    timeof=300;
    if (isPos) {
      counter=timeof;
    }
  }

  void render() {
    if (isPos) {
      fill(200, 56, 88);
    } else if (isInm) {
      fill(40, 220, 150);
    } else {
      fill(35, 115, 222);
    }
    noStroke();
    ellipse(this.pos.x, this.pos.y, r, r);
    if (this.counter!=0) {
      this.counter--;
      if (this.counter==0) {
        this.isPos=false;
        isInm=true;
        timeofinm=timeofinmunity;
      }
    }
    if (isInm) {
      timeofinm--;
      if (timeofinm==0) {
        isInm=false;
      } 
    }
  }

  void move() {
    //use perlin noise
    //take two perlin noises, and 
    float intensity = 1.5;
    float k=0.93133;
    float directionx = noise(noisecounter)*2-k;
    float directiony = noise(noisecounter+50)*2-k;
    this.noisecounter+=0.01;

    this.pos.x+=directionx*intensity;
    this.pos.y+=directiony*intensity;

    //borders  

    if (this.pos.x<0) {
      this.pos.x=0;
    } else if (this.pos.x>=width) {
      this.pos.x=width;
    }
    if (this.pos.y<0) {
      this.pos.y=0;
    } else if (this.pos.y>=height) {
      this.pos.y=height;
    }
  }

  void contagiar(Person p) {
    //acá podría hacer que, en vez de verificar si está dentro de una distancia;
    //que la probabilidad sea inversamente proporcional a la distancia
    if (PVector.dist(p.pos, this.pos)<50 && this.isPos==false && this.isInm==false) {
      float ratio = 1;
      float prob = random(100);
      if (p.isPos) {
        if (prob<ratio) {
          this.isPos=true;
          this.counter=this.timeof;
        }
      }
    }
  }
}
