
ArrayList<Person> People;
int number_of_healthy_people=30;
int number_of_ill_people=2;

void setup(){
  size(400, 400);
  People = new ArrayList<Person>();
  for(int i=0; i<number_of_healthy_people; i++){    
    People.add(new Person(false));
  }
  for(int i=0; i<number_of_ill_people; i++){    
    People.add(new Person(true));
  }
}

void draw(){
  background(49, 46, 77);
  for(int i=0; i<People.size(); i++){
    People.get(i).render();
    People.get(i).move();
    for(int j=0; j<People.size(); j++){
      People.get(i).contagiar(People.get(j));
    }
  }
}
