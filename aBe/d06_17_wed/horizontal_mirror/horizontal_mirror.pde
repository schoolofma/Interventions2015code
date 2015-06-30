int amount = 40;
float[] x;
float[] y;

void setup() {
  size(600, 600);
  fill(0);

  x = new float[amount];
  y = new float[amount];

  for (int i=0; i<amount; i++) {
    x[i] = random(50, 200);
    y[i] = random(100, 500);
  }
}

void draw() {
  background(#FFFEF0);  

  // draw something
  beginShape();
  for (int i=0; i<amount; i++) {
    vertex(x[i], y[i]);
  }
  endShape();

  // horizontal mirror of the display
  translate(width, 0);
  scale(-1, 1);

  // draw the same thing again, this time inverted
  beginShape();
  for (int i=0; i<amount; i++) {
    vertex(x[i], y[i]);
  }
  endShape();
}
void keyPressed() {
  if(key == 's') {
    save("hmirror.png");
  }
}
