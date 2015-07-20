import wblut.processing.*;
import wblut.hemesh.*;

HE_Mesh importbox;
WB_Render render;

void setup() {
  size(600, 600, P3D);
  smooth();
  importbox = new HEC_FromOBJFile(sketchPath("box.obj")).create();
  render=new WB_Render(this);
}

void draw() {
  background(120);
  lights();
  translate(300, 300, 0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  noStroke();
  render.drawFaces(importbox);
}

