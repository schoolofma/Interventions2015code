interface Fruit {
  void paint();
}

class Banana implements Fruit{
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
