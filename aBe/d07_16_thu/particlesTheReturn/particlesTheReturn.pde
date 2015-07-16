// option 1: array: fixed size
//LightningBug[] bugs;

// option 2: ArrayList, more flexible
ArrayList<LightningBug> bugs;

PImage bg;

void setup() {
  size(600, 600, P2D);
  noStroke();
  blendMode(ADD);
  
  bg = loadImage("livecoding.png");

  // option 1: fixed size 
  //bugs = new LightningBug[100];

  // option 2: size not specified
  bugs = new ArrayList<LightningBug>();  
}

void draw() {
  //background(#223388);
  
  blendMode(BLEND);
  image(bg, 0, 0);
  
  blendMode(ADD);

  fill(255);
  text(bugs.size(), 40, 40); // for arrays it's bugs.length

  // Modern for loop
  //for(LightningBug b : bugs) {
  //  b.update();
  //  b.paint();
  //}
  // Old school for loop
  for (int i=bugs.size ()-1; i>=0; i--) {
    LightningBug b = bugs.get(i);
    b.update();
    if (b.isAlive()) {
      b.paint();
    } else {
      bugs.remove(i);
    }
  }

  // Create bugs on each animation frame if the mouse is pressed
  if (mousePressed) {
    for (int i=0; i<20; i++) {
      LightningBug b = new LightningBug(mouseX, mouseY);
      bugs.add(b);
    }
  }
}

void mousePressed() {
  // Before I was creating a bug here when we clicked the mouse
}

class LightningBug {
  float x, y;
  float angle;
  float dangle;
  float speed;
  float opacity;
  // constructor, lets me specify the initial
  // position for this bug
  LightningBug(float tx, float ty) {
    x = tx;
    y = ty;
    angle = random(TWO_PI);
    dangle = random(-0.2, 0.2);
    speed = random(2, 4);
    opacity = random(10, 50);
  }
  void paint() {
    fill(opacity);
    // just to be confusing, I'm using the opacity
    // as the size of the circle. I do this because
    // the opacity contains a value that decreases with time.
    // I want the opacity to decrease with time, and
    // the size also to decrease with time.
    ellipse(x, y, opacity, opacity);
  }
  void update() {
    x = x + speed * cos(angle);
    y = y + speed * sin(angle);
    angle = angle + dangle;
    opacity--;
  }
  boolean isAlive() {
    return opacity > 0;
  }
}

