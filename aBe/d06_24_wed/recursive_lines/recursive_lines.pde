void recursiveLine(float x1, float y1, float x2, float y2, int iterations) {
    
  if( iterations > 0) {
    stroke(0, 100);
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
  size(1200, 1200);
  background(255);
  rectMode(CENTER);
  stroke(0, 100);
  noFill();

  recursiveLine(width*0.45, height*0.45, width*0.55, height*0.55, 15);
}

void draw() {
}

void keyPressed() {
  if(key == 's') {
    save("plant.png");
  }
  if(key == ' ') {
    background(255);
  }
  if(key == ENTER) {
    recursiveLine(random(width), random(height), random(width), random(height), 15);
  }
}
