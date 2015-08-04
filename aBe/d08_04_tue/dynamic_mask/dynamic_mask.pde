import processing.video.*;

PGraphics mask;

Capture webcam;
void setup() {
  size(displayWidth, displayHeight);
  printArray(Capture.list());
  webcam = new Capture(this, Capture.list()[2]);
  webcam.start();
  
  mask = createGraphics(640, 480);
}

void draw() {
  //background(0);
  
  if (webcam.available() == true) {
    webcam.read();
  }
  // Test if we already have a webcam image.
  // At the beginning we don't have one, and it crashes without this test.
  if (webcam.width > 0) {
    
    mask.beginDraw();
    mask.background(0);
    mask.noStroke();
    mask.fill(255);
    mask.rect(random(640), 0, random(50), 480);
    mask.endDraw();
    
    webcam.mask(mask);
    image(webcam, 0, 0);
  }
}

