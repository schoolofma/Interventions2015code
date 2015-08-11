PImage grad;

void setup() {
  size(600, 600);
  noFill();
  
  createGradient();
}
void createGradient() {
  grad = createImage(width, height, ARGB); 
  grad.loadPixels();
  for (int y=0; y<grad.height; y++) {
    float pos = map(y, 0, grad.height, 0, 1);
    int g = lerpColor(255, 100, pos);
    float a = (1-abs(y - height/2) / (height/2.0));
    int c = color(g, g, g, 255 - a * 200);
    for (int x=0; x<grad.width; x++) {
      grad.pixels[x+y*grad.width] = c;
    }
  }
  grad.updatePixels();
}

void draw() {
  background(#FFFFFF);
  stroke(0);
  strokeWeight(3);
  pushMatrix();
  translate(width/2, height - (5 * frameCount % height));
  rotate(frameCount * 0.05);
  rectMode(CENTER);
  rect(0, 0, 50, 50);
  popMatrix();

  image(grad, 0, 0);
}
