float rot;

float sz;

float x;

float y;

void setup() {
  size(1280, 720);

  rot=0;
  sz=120;
  x=0;
  y=0;
}

void draw() {



  background(90);

  x= mouseX;
  y= mouseY;

  pushMatrix();
  //transla9te(width/2, height/2);
  translate(x, y);


  strokeWeight(8);
  fill(#BF4565);
  noStroke();
  ellipse(0, 0, sz, sz);


  rot=rot+0.15;


  pushMatrix();
  rotate(rot);
   
  fill(#48A1D9);
  ellipse(65, 65, 60, 60);
 
  popMatrix();

  pushMatrix();
  rotate(-rot/2);
  fill(#7D8C46);
  ellipse(90, 90, 30, 30);
  popMatrix();

  pushMatrix();
  rotate(rot/2.5);
  fill(#D9BC2B);
  ellipse(140, 140, 60, 60);
  popMatrix();

  pushMatrix();
  rotate(-rot/3);
  fill(#d9583b);
  ellipse(180, 180, 30, 30);
  popMatrix();

  pushMatrix();
  rotate(rot/4);
  fill(#BF4565);
  ellipse(215, 215, 60, 60);
  popMatrix();










  popMatrix();
}

