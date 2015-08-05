void setup() {
  size(600, 600);
  for(int i=0; i<50; i++) {
    fill(random(255), random(255), random(255));
    ellipse(random(width), random(height), random(150), random(150));
  }
  stroke(255);
  strokeWeight(3);
}

void draw(){
  int sx = (int) random(width);
  int sy = (int) random(height);
  int tx = sx + (int) random(-5, 5);
  int ty = sy + (int) random(-5, 5);
  copy(sx, sy, 50, 50, tx, ty, 50, 50);
  //point(random(width), random(height));
  //filter(BLUR, 1);
}
