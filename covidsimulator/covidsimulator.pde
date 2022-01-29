ArrayList<Person> People;
int globalcounter;
int hdelta, illdelta, inmdelta, deaddelta;
IntDict healthycounter;
IntDict illcounter;
IntDict inmcounter;
IntDict deadcounter;

//PARAMETERS
int number_of_healthy_people=300;
int number_of_ill_people=2;
int diameter=10;
int time_of_inmunity=300;
int time_of_illness=700;
float probability_of_surviving=85;
float probability_of_spread=0.2;
float intensity_of_movement=1.5;
float limit_safe_radius=50;

void setup() {
  size(600, 600);
  People = new ArrayList<Person>();
  globalcounter=0;
  healthycounter = new IntDict();
  illcounter = new IntDict();
  inmcounter = new IntDict();
  deadcounter = new IntDict();
  for (int i=0; i<number_of_healthy_people; i++) {    
    People.add(new Person(false));
  }
  for (int i=0; i<number_of_ill_people; i++) {    
    People.add(new Person(true));
  }
  healthycounter.set(str(globalcounter), number_of_healthy_people);
  illcounter.set(str(globalcounter), number_of_ill_people);
  inmcounter.set(str(globalcounter), 0);
  deadcounter.set(str(globalcounter), 0);
}

void draw() {
  background(49, 46, 77);
  globalcounter++;
  hdelta=0;
  illdelta=0;
  inmdelta=0;
  deaddelta=0;
  for (int i=0; i<People.size(); i++) {
    People.get(i).render();
    People.get(i).move();
    for (int j=0; j<People.size(); j++) {
      People.get(i).contagiar(People.get(j));
    }
  }

  healthycounter.set(str(globalcounter), hdelta+healthycounter.get(str(globalcounter-1)));
  illcounter.set(str(globalcounter), illdelta+illcounter.get(str(globalcounter-1)));
  inmcounter.set(str(globalcounter), inmdelta+inmcounter.get(str(globalcounter-1)));
  deadcounter.set(str(globalcounter), deaddelta+deadcounter.get(str(globalcounter-1)));
  
  //if(globalcounter%100==0){
  //  println(inmcounter);
  //}
}

void mousePressed(){
  JSONObject data = new JSONObject();
  JSONArray raw_data = new JSONArray();
  for (int i=0; i<healthycounter.size();i++){
    JSONObject object = new JSONObject();
    object.setInt("time", i);
    object.setInt("healthy", healthycounter.get(str(i)));
    object.setInt("ill", illcounter.get(str(i)));
    object.setInt("inmune", inmcounter.get(str(i)));
    object.setInt("dead", deadcounter.get(str(i)));
    
    raw_data.setJSONObject(i, object);
  }
  data.setJSONArray("data", raw_data);
  saveJSONObject(data, "data/"+"at_"+globalcounter+".json");  
  println("data saved at: "+"data/"+"at_"+globalcounter+".json");
}
