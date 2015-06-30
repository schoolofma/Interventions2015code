float angle = 0;

float x;
float y;

PImage heart;
PImage fire;


void setup () {
  size (1000, 651);
  x = width/2 ;
  y = height/2 ;

  heart = loadImage ("heart_PNG702.png");
  fire = loadImage ("fire-3.jpg");
}

void draw () {
  image (fire,0,0);
  angle += .01;


  // atan 2 (y,x);
  float angle = atan2 (mouseY- (y), mouseX - (x) );

  x= x+ .1 * (mouseX-x);
  y= y+ .1 * (mouseY - y);
  if(y > height/2) y = height/2;
  
  pushMatrix ();
  translate (x, y);
  rotate (angle);
  rectMode (CENTER);

  
  image(heart, 0, 0, heart.width*.100,heart.height*.100);


  popMatrix ();
}