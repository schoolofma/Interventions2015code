import processing.video.*;

PImage img;
Capture webcam;
void setup() {
  size(displayWidth, displayHeight);
  img = loadImage("mask.png");
  printArray(Capture.list());
  webcam = new Capture(this, Capture.list()[2]);
  webcam.start();
}

void draw() {
  if (webcam.available() == true) {
    webcam.read();
  }
  if (webcam.width > 0) {
    webcam.mask(img);
    image(webcam, 0, 0);
  }
}

