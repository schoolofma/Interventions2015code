float lastx = -1;
float lasty = -1;
void setup() {
  size(600, 600);
  noFill();
  background(0);
  stroke(255);
}

void draw() {
  float f = frameCount * 0.3;
  float distance = 200;
  
  float x = width/2 + distance * cos(f * 0.11) * sin(f * 0.24);
  float y = height/2 + distance * sin(f * 0.12) * cos(f * 0.3301);
  
  if(lastx > 0) {
    float wi = 3 + 3 * sin(f * 0.03);
    strokeWeight(wi);
    
    float co = 150 + 100 * sin(f * 0.5);
    stroke(co);
    
    line(lastx, lasty, x, y);
  }
  
  lastx = x;
  lasty = y;
}

void keyPressed() {
  if(key == 's') {
    save("sine_line.png");
  }
}
