float angle = 0;

float x;
float y;


void setup () {
  size (300, 300);
  x = width/2 ;
  y = height/2 ;
}

void draw () {
  background (0);
  angle += .01;

  // atan 2 (y,x);
  float angle = atan2 (mouseY- (y), mouseX - (x) );

  x= x+ .1 * (mouseX-x);
  y= y+ .1 * (mouseY - y);

  pushMatrix ();
  translate (x, y);
  rotate (angle);
  rectMode (CENTER);
  rect(0, 0, 55, 55, 7);


  popMatrix ();
}