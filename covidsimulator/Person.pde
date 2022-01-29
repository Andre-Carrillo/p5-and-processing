class Person{
  PVector pos;
  boolean isPos;
  float r = 10;
  float noisecounter=random(100);
  
  Person(boolean isPositive){
    pos = new PVector(random(width), random(height));
    isPos = isPositive;
  }
  
  void render(){
    if (isPos){
      fill(200, 56, 88);
    }else{
      fill(35, 115, 222);
    }
    noStroke();
    ellipse(this.pos.x, this.pos.y, r, r);
  }
  
  void move(){
    //use perlin noise
    //take two perlin noises, and 
    int n = 1;
    float directionx = noise(noisecounter);
    float directiony = noise(-noisecounter);
    
    this.pos.x+=directionx;
    this.pos.y+=directiony;
    
    //borders  
    
    if (this.pos.x<0){
      this.pos.x=0;
    }else if (this.pos.x>=width){
      this.pos.x=width;
    }
    if (this.pos.y<0){
      this.pos.y=0;
    }else if (this.pos.y>=height){
      this.pos.y=height;
    }  
    this.noisecounter+=0.1;
  }
  
  void contagiar(Person p){
    //acá podría hacer que, en vez de verificar si está dentro de una distancia;
    //que la probabilidad sea inversamente proporcional a la distancia
    if(PVector.dist(p.pos, this.pos)<30){
      float ratio = 1;
      float prob = random(100);
      if(p.isPos){
        if(prob<ratio){
          this.isPos=true;
        }
      }
    }
  }
}
