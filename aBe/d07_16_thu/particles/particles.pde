// option 1: array: fixed size
//LightningBug[] bugs;

// option 2: ArrayList, more flexible
ArrayList<LightningBug> bugs;

void setup() {
  size(600, 600);
  
  // option 1: fixed size 
  //bugs = new LightningBug[100];
  
  // option 2: size not specified
  bugs = new ArrayList<LightningBug>();
}

void draw() {
  background(#223388);
  
  text(bugs.size(), 40, 40); // for arrays it's bugs.length
  
  // Modern for loop
  //for(LightningBug b : bugs) {
  //  b.update();
  //  b.paint();
  //}
  // Old school for loop
  for(int i=bugs.size()-1; i>=0; i--) {
    LightningBug b = bugs.get(i);
    b.update();
    if(b.isAlive()) {
      b.paint();
    } else {
      bugs.remove(i);
    }
  }

  // Create bugs on each animation frame if the mouse is pressed
  if(mousePressed) {
    LightningBug b = new LightningBug(mouseX, mouseY);
    bugs.add(b);
  }
}

void mousePressed() {
  // Before I was creating a bug here when we clicked the mouse
}

class LightningBug {
  float x, y;
  float dx, dy;
  float daysLeft;
  // constructor, lets me specify the initial
  // position for this bug
  LightningBug(float tx, float ty) {
    x = tx;
    y = ty;
    dx = random(-4, 4);
    dy = random(-4, 4);
    daysLeft = random(30, 100);
  }
  void paint() {
    ellipse(x, y, 10, 10);
  }
  void update() {
    x = x + dx;
    y = y + dy;
    daysLeft--;
  }
  boolean isAlive() {
    return daysLeft > 0;
  }
}
