// gifsicle --delay=3 --loop --colors 8 --optimize=2 *.gif >circ.gif

float x = 0;
void setup() {
  size(540, 540);
  background(#23E483);
  noStroke();
  fill(0);
}

void draw() {
  background(#23E483);
  ellipse(x, height/2, 30, 30);
  x = x + 40;
  
  saveFrame("frame####.gif");
  
  if(x > width) {
    noLoop();
  }
}


