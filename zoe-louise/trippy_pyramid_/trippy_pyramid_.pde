void setup () {
  size (600, 600);
  background (255);

  for (int x=0; x<width; x=x +5) {
    line (0, 0, x, height);
  }

  strokeWeight(5);
  for (int x=0; x<width; x=x+5) {
    stroke (x);
    line( width, height, x, 0);
  }
}