PImage face;


void setup () {
  noStroke();
  size (640, 640);
  face = loadImage("IMG_2277.JPG");
}

void draw () {
  background (face);

// blue
  fill (#4C60DE,  150);
  rect(370, 83, 90, 50, 7);

//red
  fill (#E34949,  150);
  rect(210, 77, 90, 50, 7);
  
   
 
}