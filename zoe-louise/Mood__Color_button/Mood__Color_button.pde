int [] opacity = {
  150, 0, 0, 0, 0, 0
};
int count = 0;
float angle = 0;
boolean doRotate = false;

void setup () {
  size (600, 600);
  background(255);
}

void draw () {

  if (doRotate==true) angle += .1;

  background(255);
  noStroke ();
  translate (300, 300);
  rotate(angle);

  // green - 0
  {fill (#32A553, opacity[0]);
  ellipse(72, -38, 82, 82);

  //yellow - 1
  fill (#F8FC2E, opacity[1]);
  ellipse(108, -13, 82, 82);

  // orange - 2
  fill (#FF9E1F, opacity[2]);
  ellipse(102, 38, 82, 82);

  // red - 3
  fill (#FF0000, opacity[3]);
  ellipse(56, 50, 82, 82);

  // violet - 4
  fill (#930EED, opacity[4]);
  ellipse(20, 26, 82, 82);

  // Blue - 5
  fill (#2973F0, opacity[5]); 
  ellipse(26, -26, 82, 82);}
}



void keyPressed () {

  if (key == 's') {
    count++;
    if (count > 5) count = 0;

    for (int i = 0; i < opacity.length; i++) {
      doRotate = false;
      if (i != count ) opacity[i] = 0;
      else opacity[i] = 150;
    }
    // save ("color-wheel.jpg");
  } else if (key == 'd') {
    doRotate = true;
    for (int i = 0; i < opacity.length; i++) {
      opacity[i] = 150;
    }
  }
}  

