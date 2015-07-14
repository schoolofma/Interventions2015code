void draw() {
  background(0);
  
  float x = width * noise(frameCount * 0.05);
  float y = height * noise(3.33, frameCount * 0.05);
  
  ellipse(x, y, 50, 50);
}
