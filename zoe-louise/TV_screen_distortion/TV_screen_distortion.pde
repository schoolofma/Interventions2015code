void setup () {
  size (600, 600);
}



void draw () {
  noStroke();
  fill(random(256));
  for (int i=0; i<1000; i=i+1) {
    rect  (random (width), random(height), 2, 2);
  }
}