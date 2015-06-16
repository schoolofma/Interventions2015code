float x = 150;
float y = 150;
PImage turtle;

void setup(){
  size(500,500);
  x = width / 2;
  y = height / 2;
  
  turtle = loadImage("turtle.png");
}

void draw(){
  
  background(#96E5FC);
 
  // calculate angle towards mouse
  float angle = atan2(mouseY - y, mouseX - x);
  
  imageMode(CENTER);
  
  pushMatrix();
    translate(x,y);
    rotate(angle+HALF_PI);
    image(turtle,0,0,turtle.width*.5,turtle.height*.5);
  popMatrix();
  
  x += .05 * (mouseX - x);
  y += .05 * (mouseY - y);
  
}
