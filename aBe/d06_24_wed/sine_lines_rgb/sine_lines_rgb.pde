void setup() {
  size(600, 600);  
}
void draw() {
  for(int x=0; x<width; x++) {
    float angle1 = mouseX * 0.1 + x * 0.02;
    float r = map(sin(angle1), -1, 1, 0, 255);
    
    float angle2 = mouseY * 0.1 + x * 0.04;
    float g = map(sin(angle2), -1, 1, 0, 255);
    
    float angle3 = frameCount * 0.1 + x * 0.08;
    float b = map(sin(angle3), -1, 1, 0, 255);
    
    stroke(r, g, b);
    line(x, 0, x, height);
  }
}

