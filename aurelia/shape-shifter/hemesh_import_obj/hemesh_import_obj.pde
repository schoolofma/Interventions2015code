import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;


HE_Mesh importcan; // this is the name of the obj
WB_Render render;
HEM_Extrude modifier;


void setup() {
  size(600, 600, P3D); 
  smooth(); 
  importcan = new HEC_FromOBJFile(sketchPath("can.obj")).create();
  render=new WB_Render(this);

}

void draw() {
  background(0);
  directionalLight(255, 255, 255, 1, 1, -1); //added
  directionalLight(127, 127, 127, -1, -1, 1);//added
  translate(300, 300, 0);
  rotateY(mouseX*1.0f/width*TWO_PI);
  rotateX(mouseY*1.0f/height*TWO_PI);
  lights();

  noStroke();
  scale(10);
  render.drawFaces(importcan); 
  
}



//void mousePressed() {
//  rotateY(mouseX*1.0f/width*TWO_PI);
//  rotateX(mouseY*1.0f/height*TWO_PI);
//}