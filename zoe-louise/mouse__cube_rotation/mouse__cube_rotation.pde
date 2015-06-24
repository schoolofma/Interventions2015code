float angle = 0;

void setup () {
  size (300, 300);
}

void draw () {
  background (0);
  angle += .01;

  // atan 2 (y,x);
  float angle = atan2 (mouseY- (height/2), mouseX - (width/2) );

  pushMatrix ();
  translate (150, 150);
  rotate (angle);
  rectMode (CENTER);
  rect(0, 0, 55, 55, 7);


  popMatrix ();
}