// Fruit is an interface, not a class. See the other tab
// to find out how an interface is declared. It allows us
// to add different classes to the same ArrayList.
// The only thing they must have in common is that they must
// implement paint(), because the interface says so.
ArrayList<Fruit> fruits;

void setup() {
  size(600, 600, P2D);
  fruits = new ArrayList<Fruit>();
  
  // See how we can add different classes to the same
  // Array list.
  fruits.add(new Banana());
  fruits.add(new Pear());
  fruits.add(new Pear());
  // But we can only add classes that implement Fruit.
  // If we had another class, Bottle, which does not
  // implement Fruit, we could not add it to fruits.
  // fruits.add(new Bottle()); // wrong if Bottle is not a Fruit
}

void draw() {
  background(255);
  // Shorthand method to iterate over the items of an
  // ArrayList
  for(Fruit fru : fruits) {
    fru.paint();
  }
  // same as
  // for(int i=0; i<fruits.size(); i++) {
  // fruits.get(i).paint();
  // }
}

