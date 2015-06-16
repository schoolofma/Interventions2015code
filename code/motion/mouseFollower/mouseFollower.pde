float x;
float y;

void setup(){
  size(300,300);
  x = width / 2;
  y = height / 2;
}

void draw(){
  
  background(255);
  
  // calculate angle towards mouse
  float angle = atan2(mouseY - y, mouseX - x);
  
  fill(#F90DFA);
  rectMode(CENTER);
  pushMatrix();
    translate(x,y);
    rotate(angle);
    rect(0,0,30,30);
  popMatrix();
  
  x += .1 * (mouseX - x);
  y += .1 * (mouseY - y);
  
}
