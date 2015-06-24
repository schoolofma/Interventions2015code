void setup() {
  size(600, 600);  

  for(int x=0; x<width; x++) {
    for(int y=0; y<height; y++) {
      float sine = sin(x * 0.03) * sin(y * 0.03) * sin(x*0.011+y*0.023);
      float v = map(sine, -1, 1, 0, 255);
      stroke(v);
      point(x, y);
    }
    
  }
}
