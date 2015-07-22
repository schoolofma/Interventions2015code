void setup() {
  size(600, 600);
  rectMode(CENTER);
}

void draw() {  
}

void keyPressed() {
  int x = (keyCode * 53) % width;
  int y = (keyCode * 771) % height;
  translate(x, y);

  int angle = keyCode * 251;
  rotate(angle);
  
  int thickness = 1 + (keyCode * 777) % 7;
  strokeWeight(thickness);
  
  int r = (keyCode * 232) % 256;
  int g = (keyCode * 177) % 256;
  int b = (keyCode * 325) % 256;
  fill (r, g, b);
  
  int w = 10 + (keyCode * 722) % 200;
  int h = 10 + (keyCode * 333) % 200;

  int kind = (keyCode % 2);
  if(kind == 0) {
    rect(0, 0, w, h);
  }
  if(kind == 1) {
    ellipse(0, 0, w, h);
  }
}
void keyReleased() {
  background(255);
}
