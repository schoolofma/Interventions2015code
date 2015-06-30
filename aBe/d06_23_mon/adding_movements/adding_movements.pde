float x = 0;
void setup() {
  size(600, 600);
  background(random(255),random(255),random(255));
  fill(255);
  noStroke();
}
void draw() {
  float y;
  
  y = height*0.15;
  ellipse(x, y, 10, 10);

  y = height*0.3 + 20 * sin(frameCount * 0.25);
  ellipse(x, y, 10, 10);

  y = height*0.45 + 10 * sin(frameCount * 0.055);
  ellipse(x, y, 10, 10);

  y = height*0.6 + 20 * sin(frameCount * 0.25) + 
    10 * sin(frameCount * 0.055) + random(-5, 5);
  ellipse(x, y, 10, 10);

  x = x + 2;
}

void keyPressed() {
  if(key == 's') {
    save("additive.png");
  }
}
