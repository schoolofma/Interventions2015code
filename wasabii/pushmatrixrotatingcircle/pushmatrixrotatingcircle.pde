float angle= 0;

void setup() {
  size(800, 800);
}


void draw() {
  pushMatrix();
  background(0);
  angle=angle + 2; // angle +2 degrees----- change to increase or decrease speed of rotation
  //radians=degrees
  //translate and draws cirle first
  translate(100, 100);
  //then rotates
  rotate( radians(angle));
  //translated ellipse from 0,0 to 100,100

  ellipse(0, 0, 50, 50);
  translate(25, 25);
  ellipse(0, 0, 25, 25);
  //return anything after this back to origin 0,0
  popMatrix();

//origins
  rect(0, 0, 50, 50);
}

