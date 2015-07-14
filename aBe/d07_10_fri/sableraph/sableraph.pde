PImage img;

void setup() {
  size(900, 900);
  img = loadImage("DSC04342.jpg");
  image(img, 0, 0, width, height);
  blendMode(ADD);
  noFill();
}
void draw() {
  float a = frameCount * 0.01;
  float l = noise(a) * 200;
  stroke(5, 4.5, 4.2);
  PVector p0 = new PVector(474, 619);
  beginShape();
  for (int i=0; i<l; i++) {
    vertex(p0.x, p0.y);
    PVector pd = PVector.fromAngle(a + 10 * noise(p0.x * 0.01, p0.y * 0.01));
    pd.mult(4);
    p0.add(pd);
  }
  endShape();
}
void mousePressed() {
  println(mouseX, mouseY);
}
void keyPressed() {
  if(key == 's') {
    save("sableraph.jpg");
  }
}
