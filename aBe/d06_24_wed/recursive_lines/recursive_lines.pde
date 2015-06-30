void recursiveLine(float x1, float y1, float x2, float y2, int iterations) {
    
  if( iterations > 0) {
    stroke(map(iterations, 15, 0, 0, 255));
    strokeWeight(1);
    line(x1, y1, x2, y2);
    
    stroke(#FF0000, 100);
    strokeWeight(2);
    point(x1, y1);
        
    float len = 0.95 * dist(x1, y1, x2, y2);
    recursiveLine(x1, y1, x1+random(-len, len), y1+random(-len, len), iterations-1);
    recursiveLine(x2, y2, x2+random(-len, len), y2+random(-len, len), iterations-1);
  }
}

void setup() {
  size(900, 900);
  background(#EAE9E3);
  rectMode(CENTER);
  stroke(0, 100);
  noFill();

  recursiveLine(width*0.45, height*0.45, width*0.55, height*0.55, 15);
}

void draw() {
}

void keyPressed() {
  if(key == 's') {
    save(System.currentTimeMillis() + ".png");
  }
  if(key == ' ') {
    background(#EAE9E3);
  }
  if(key == ENTER) {
    recursiveLine(random(width), random(height*0.7, height), random(width), random(height*0.7, height), 15);
  }
}
