PImage butterfly;

void setup(){
  
  butterfly = loadImage("butterfly.png");
  
  size(butterfly.width,butterfly.height);

  background(255);
}


void draw(){
  
  int mySize = butterfly.width * butterfly.height;
  int index = (int)random( 0, mySize);
  color c = butterfly.pixels[0];
  float x = index % butterfly.width;
  float y = (index - x) / butterfly.width;
  
  fill(c,200);
  triangle( x,y-random(10,50),x-random(10,50),y+random(10,50),x+random(10,50),y+random(10,50));
  
}
