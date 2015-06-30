void setup() {
  size(600, 600);
  float x = random(100);

  // vertical line
  line(x, 0, x, height);
  // (probably) tilted line
  line(random(100), 0, random(100), height);
  
  // three dots on the vertical line
  ellipse(x, random(height), 20, 20);
  ellipse(x, random(height), 20, 20);
  ellipse(x, random(height), 20, 20);
  
  // random line with a dot at each end
  float x1 = random(width);
  float x2 = random(width);
  float y1 = random(height);
  float y2 = random(height);
  
  line(x1, y1, x2, y2);
  ellipse(x1, y1, 10, 10);
  ellipse(x2, y2, 10, 10);
  
  save("lines_and_ellipses.png");
}
