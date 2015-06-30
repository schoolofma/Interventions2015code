Thing[] things;
int howMany = 10;

void setup() {
  size(600, 600);
  things = new Thing[howMany];
  for(int i=0; i<howMany; i++) {
    things[i] = new Thing();
  }
}

void draw() {
  background(0);
  for(int i=0; i<howMany; i++) {
    things[i].display();
  }
}
void keyPressed() {
  things[keyCode % howMany].glow();
}

class Thing {
  float x;
  float y;
  float bri;
  Thing() {
    x = random(width);
    y = random(height);
    bri = 60;
  }
  void display() {
    fill(bri);
    ellipse(x, y, 20, 20);
    if(bri > 60) {
      bri = bri - 4;
    }
  }
  void glow() {
    bri = 255;
  }
}
