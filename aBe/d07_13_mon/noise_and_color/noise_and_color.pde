size(600, 600);
for (int x=0; x<width; x++) {
  float r = 255 * noise(x * 0.01);
  float g = 255 * noise(0, x * 0.01);
  float b = 255 * noise(0, 0, x * 0.01);
  stroke(r, g, b);
  line(x,0, x, height);
}

