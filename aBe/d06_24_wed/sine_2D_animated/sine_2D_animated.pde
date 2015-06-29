void setup() {
  size(600, 600);  
}
void draw() {
  loadPixels();
  for(int x=0; x<width; x++) {
    for(int y=0; y<height; y++) {
      float sine1 = sin(x * 0.011) * 
         sin(y * 0.013) * sin(frameCount * 0.023);
      float sine2 = sin(x * 0.017) * 
         sin(y * 0.015) * sin(frameCount * 0.025);
      float sine3 = sin(x * 0.019) * 
         sin(y * 0.013) * sin(frameCount * 0.021);
      float r = map(sine1, -1, 1, 0, 255);
      float g = map(sine2, -1, 1, 0, 255);
      float b = map(sine3, -1, 1, 0, 255);
      //stroke(v);
      //point(x, y);
      // using the pixels array makes this work much faster
      pixels[x + y * width] = color(r, g, b);
    }
  }
  updatePixels();
}
