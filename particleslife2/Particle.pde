class Particle {
  PVector pos;
  PVector vel;

  Particle() {
    pos = new PVector(random(0, width), random(0, height));
    vel = new PVector(random(0, mv), random(0, mv));
  }
  void apfparticle(Particle part, particleClass clas1, particleClass clas2) {
    float distance = part.pos.dist(this.pos);
    PVector force; 
    float j=nmatrix[clas1.indx][clas2.indx];
    force=part.pos.copy().sub(this.pos).normalize();
    float fi=2*r+e;
    if (distance<2*r+e) {
      force.mult(-A*(distance-fi)*(distance-fi)/(fi*fi));
    } else if (distance<=2*r+e+k) {
      force.mult(j*(distance-2*r-e)/k);
    } else if (distance<=2*r+e+2*k) {
      force.mult(j*(2*k+2*r-distance+e)/k);
    } else {
      force.mult(0);
    }
    vel.add(force);
  }
  void move() {
    vel.sub(vel.copy().mult(fr));
    pos.add(vel);
    if (pos.x<0) {
      pos.x=width;
    } else if (pos.y<0) {
      pos.y=height;
    } else if (pos.x>width) {
      pos.x=0;
    } else if (pos.y>height) {
      pos.y=0;
    }
  }
  void render(color col) {
    fill(col);
    ellipse(pos.x, pos.y, 2*r, 2*r);
  }
}

class particleClass {
  ArrayList<Particle> particles;
  color col;
  int indx;
  particleClass(int quantity, color colo, int index) {
    //acá irá un loop que creará todas las partículas de la clase    
    println("New class generated. The quantity is: "+quantity+". The color is "+colo);
    indx=index;
    col=colo;
    particles = new ArrayList<Particle>();
    for (int i=0; i<quantity; i++) {
      particles.add(new Particle());
    }
  }
  void moveGroup() {
    for (int i=0; i<particles.size(); i++) {
      particles.get(i).move();
    }
  }  
  void renderGroup() {
    for (int i=0; i<particles.size(); i++) {
      particles.get(i).render(col);
    }
  }
}
