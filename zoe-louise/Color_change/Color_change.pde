float r, g, b; //<>//
  float sz;
void setup () {
  size (600, 600);
  sz= 20;
  r=0;
  g=0;
  b=0;
}







void draw () { //<>//
  background (0); 
  fill (r, g, b);
  ellipse(width* 0.25, height/2, sz, sz);
  ellipse(width* 0.75, height/2, sz, sz);
  
  sz = sz - 1; 
}

void mousePressed () {

  r= random(256);
  g= random(256);
  b= random (256);
}



void keyPressed () {

  if (key== ' ') {

    // set sz ti a randil valye between 0 and 500

    sz= random (0, 500);
  }

  if (key == 's') {

    save ("colorchange.jpg");
  }
}