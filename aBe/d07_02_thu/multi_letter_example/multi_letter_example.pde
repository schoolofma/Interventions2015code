ArrayList<Letter> letters;

void setup() {
  size(600, 600);
  letters = new ArrayList<Letter>();
}
void draw() {
  background(20);
  for(int i=letters.size()-1; i>=0; i--) {
    Letter l = letters.get(i);
    l.paint();
    if(l.y > height) {
      letters.remove(i);
      println("remove", i);
    }
  }
}
void keyPressed() {
  letters.add(new Letter(keyCode));
}

class Letter {
  float x, y;
  int letterCode;
  Letter(int code) {
    letterCode = code;
    x = random(width);
    y = 0;
  }
  void paint() {
    // switch is like having many if statements
    // it used in this case to compare letterCode
    // with many different values.
    switch(letterCode) {
      case 65: // A
        rect(x, y, 20, 20);
        break;
      case 79: // S
        ellipse(x, y, 20, 20);
        break;
      //... more cases here
    }
    y += 5;
  }
}
