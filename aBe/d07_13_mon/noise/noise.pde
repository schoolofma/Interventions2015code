void setup() {
  size(600, 600);

  background(255);
  stroke(0);

  for (int x=0; x<width; x++) {
    point(x, 200);
    
    point(x, random(300, 400));
    
    point(x, 500 + 100 * noise(x * 0.01 ));
  }
}

