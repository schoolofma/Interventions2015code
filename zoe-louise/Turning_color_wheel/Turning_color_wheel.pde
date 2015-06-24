float angle = 0;
void setup () {
  size (600, 600);
  background(255);
}

void draw () {
  background(random (80, 23));
  noStroke ();

  pushMatrix ();
  angle += .01;
  translate (width/2, height/2);
  rotate (frameCount * 0.01);

  

  // red
  fill (#FF0000, 150);
  ellipse(56, 50, 75, 75);

  // violet
  fill (#930EED, 150);
  ellipse(20, 26, 75, 75);

  // Blue
  fill (#2973F0, 150); 
  ellipse(26, -22, 75, 75);

  // green
  fill (#32A553, 150);
  ellipse(73, -40, 75, 75);

  //yellow
  fill (#F8FC2E, 150);
  ellipse(111, -6, 75, 75);

  // orange
  fill (#FF9E1F, 150);
  ellipse(105, 38, 75, 75);
  popMatrix ();
}



void keyPressed () {

  if (key == 's') {

    save ("color-wheel.jpg");
  }
}