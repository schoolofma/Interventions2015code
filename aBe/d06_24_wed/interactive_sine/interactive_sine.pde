float angle = 0;
float angle2 = 0;

void setup() {
  size(600, 600);
  fill(0);
  noStroke();
}

void draw() {
  background(255);
  
  float x = width/2 + 50 * sin(radians(angle));
  float y = height/2 + 50 * sin(radians(angle2));
  
  ellipse(x, y, 20, 20);
  
  angle = angle + mouseX * 0.1;
  angle2 = angle2 + mouseY * 0.1;
}
