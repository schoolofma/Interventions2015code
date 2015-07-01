ArrayList<Fruit> Fruits;

void setup() {
  Fruits = new ArrayList<Fruit>();
  Fruits.add(new Banana());
  Fruits.add(new Pear());
}

void draw() {
  background(255);
  for(Fruit fru : Fruits) {
    fru.paint();
  }
}

