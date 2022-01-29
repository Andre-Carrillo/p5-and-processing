class Person{
  PVector pos;
  boolean isPos;
  float r = 10;
  float noisecounter=random(100);
  float counter=0;
  int timeof;//time the illness takes
  //need to implement the counter of covid
  
  Person(boolean isPositive){
    pos = new PVector(random(width), random(height));
    isPos = isPositive;
    timeof=150;
    if (isPos){
      counter=timeof;
    }
  }
  
  void render(){
    if (isPos){
      fill(200, 56, 88);
    }else{
      fill(35, 115, 222);
    }
    noStroke();
    ellipse(this.pos.x, this.pos.y, r, r);
    if (this.counter!=0){this.counter--;}
    if(this.counter==0){
      this.isPos=false;
    }

  }
  
  void move(){
    //use perlin noise
    //take two perlin noises, and 
    float intensity = 1.5;
    float directionx = noise(noisecounter)*2-.98;
    float directiony = noise(noisecounter+50)*2-.98;
    this.noisecounter+=0.01;
    
    this.pos.x+=directionx*intensity;
    this.pos.y+=directiony*intensity;
    
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

  }
  
  void contagiar(Person p){
    //acá podría hacer que, en vez de verificar si está dentro de una distancia;
    //que la probabilidad sea inversamente proporcional a la distancia
    if(PVector.dist(p.pos, this.pos)<60 && this.isPos==false){
      float ratio = 1;
      float prob = random(100);
      if(p.isPos){
        if(prob<ratio){
          this.isPos=true;
          this.counter=this.timeof;
        }
      }
    }
  }
}
