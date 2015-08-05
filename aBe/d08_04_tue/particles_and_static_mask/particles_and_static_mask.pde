PImage mask;
PGraphics canvas;

void setup() {
  size(640, 480, P2D);
  mask = loadImage("mask.png");
  canvas = createGraphics(width, height, P2D);
}

void draw() {
  background(0);
  
  float x = random(width);
  canvas.beginDraw();
  canvas.background(0);
  canvas.stroke(255);
  canvas.strokeWeight(15);
  canvas.line(x, 0, x, height);
  canvas.endDraw();
  
  // apply mask on my generative design
  canvas.mask(mask);
  
  // for some reason the masked image is upside down.
  // fix it.
  translate(0, height);
  scale(1, -1);
  
  // show result on the screen
  image(canvas, 0, 0);
}

