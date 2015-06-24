float angle = 0;

void setup () {
  size (300, 300);
}

void draw () {
background (0);
angle += .01;
  
  
  pushMatrix ();
  translate (100, 100);
  rotate (angle );
  ellipse (0, 0, 50, 50);

  translate (25, 25);
  ellipse (0, 0, 25, 25);

  popMatrix (); 


}