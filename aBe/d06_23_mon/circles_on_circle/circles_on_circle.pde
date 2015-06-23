float angle1;
float angle2;
float dist = 100;
void setup() {
  size(600, 600);
  background(255);
  noStroke();
  fill(0);
}

void draw() {
  angle1 = angle1 + 0.03;
  angle2 = angle2 + 0.3;
  dist = dist + 0.06;
  
  translate(width/2, height/2);
  
  // large circular motion
  float x = dist * cos(angle1);
  float y = dist * sin(angle1);
  
  // fast small circle
  float x2 = 20 * cos(angle2);
  float y2 = 20 * sin(angle2);
  
  ellipse(x + x2, y + y2, 10, 10);  
}

void keyPressed() {
  if(key == 's') {
    save("flowery.png");
  }
}
