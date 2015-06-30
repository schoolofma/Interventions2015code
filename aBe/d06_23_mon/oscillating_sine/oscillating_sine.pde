void setup() {
  size(600, 600);
  strokeWeight(10);
}

void draw() {
  background(255);
  
  float distance = 200;
  float angle = frameCount * 0.1;
  
  // 100 .. 200
  // 150 + 50 * -1 = 100
  // 150 + 50 * +1 = 200
  //float sz = 150 + 50 * sin(frameCount * 0.1);
  
  float sz = map(sin(frameCount * 0.1), -1, 1, 100, 200);
 
  ellipse(width/2, height/2, sz, sz);
}

void keyPressed() {
  if(key == 's') {
    save("sine_circle_frame.png");
  }
}
