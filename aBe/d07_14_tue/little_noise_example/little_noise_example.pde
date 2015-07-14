void setup() {
  size(600, 600);
}
void draw() {
  background(255);
  float y = height * noise(frameCount * 0.03);
  line(y, 0, y, width);
  
  float x = frameCount;
  line(x, height/2, x, height/2-200*noise(x*0.1));
}
