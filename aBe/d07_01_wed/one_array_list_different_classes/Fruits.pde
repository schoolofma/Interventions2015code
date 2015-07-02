// We are going to create this interface to be able to
// store different objects on the same ArrayList.

// All the different objects we store will have to be 
// implement Fruit.

// You can understand this as: a Fruit is something that
// provides a method called paint(). (a very simple minimal
// definition). 
interface Fruit {
  // Notice that there's no {} after (). We are not defining
  // here how paint() works. We are just saying that there
  // must be a paint method for all the classes that implement
  // Fruit (like Banana or Pear).
  void paint();
}

// Here we say that the class Banana implements Fruit (so
// there must be a paint() method).
class Banana implements Fruit {
  float x, y;
  Banana() {
    x = random(width);
    y = random(height);
  }
  void paint() {
    fill(random(255));
    ellipse(x, y, 20, 20);
  }
  void fly() {
  }
}

class Pear implements Fruit {
  float x, y;
  Pear() {
    x = random(width);
    y = random(height);
  }
  void paint() {
    fill(random(255));
    rect(x, y, 20, 20);
  }
}
