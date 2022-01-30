class Person {
  PVector pos;
  boolean isPos;
  float r = diameter;
  float noisecounter=random(10000);
  float counter=0;
  int timeof;//time the illness takes
  boolean isInm;
  int timeofinm;
  int timeofinmunity=time_of_inmunity;
  boolean isDead;

  Person(boolean isPositive) {
    pos = new PVector(random(width), random(height));
    isPos = isPositive;
    isInm=false;
    timeof=time_of_illness;
    isDead=false;
    if (isPos) {
      counter=timeof;
    }
  }

  void render() {
    if (isDead) {
      fill(92, 90, 88, 50);
    } else if (isPos) {
      fill(200, 56, 88);
    } else if (isInm) {
      fill(40, 220, 150);
    } else {
      fill(35, 115, 222);
    }
    noStroke();
    ellipse(this.pos.x, this.pos.y, r, r);
    if (!isDead) {
      if (this.counter!=0) {
        this.counter--;
        if (this.counter==0) {
          float ratio = probability_of_surviving;
          float prob = random(100);
          if (prob<ratio) {
            this.isPos=false;
            isInm=true;
            timeofinm=timeofinmunity;
            illdelta--;
            inmdelta++;
          } else {
            this.isPos=false;
            this.isDead=true;
            this.isInm=false;
            illdelta--;
            deaddelta++;
          }
        }
      }
      if (isInm) {
        timeofinm--;
        if (timeofinm==0) {
          isInm=false;
          inmdelta--;
          hdelta++;
        }
      }
    }
  }

  void move() {
    if (!isDead) {
      //use perlin noise
      //take two perlin noises, and 
      float intensity = intensity_of_movement;
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
  }

  void contagiar(Person p) {
    //acá podría hacer que, en vez de verificar si está dentro de una distancia;
    //que la probabilidad sea inversamente proporcional a la distancia
    if (PVector.dist(p.pos, this.pos)<limit_safe_radius && this.isPos==false && this.isInm==false && this.isDead==false && p.isDead==false) {
      float ratio = probability_of_spread/PVector.dist(p.pos, this.pos);
      float prob = random(100);
      if (p.isPos) {
        if (prob<ratio) {
          this.isPos=true;
          this.counter=this.timeof;
          illdelta++;
          hdelta--;
        }
      }
    }
  }
}
