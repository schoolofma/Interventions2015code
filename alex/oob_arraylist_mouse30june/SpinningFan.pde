//position
//size
//rotation


// a float could get an integer but an integer cant get a float

class Spinning {
  float x;
  float y;
  float sz;
  float rot;
  PVector vel;

  // CONSTRUCTOR is call when an object is created 
  // allocates memory and putting objects inside objects

  Spinning(float nx, float ny, float r, float s) {
    x = nx;
    y = ny;
    // incializa la variable en el lugar que necesita
    vel = new PVector(0, 0);
    rot = r;
    sz = s;
  }

  void create() {
    rot += .1;
    pushMatrix();
    translate(x, y);
    rotate(rot);
    rectMode(CENTER);
    noFill();
    rect(0, 0, mouseX/4, sz);
    popMatrix();
  }
}

