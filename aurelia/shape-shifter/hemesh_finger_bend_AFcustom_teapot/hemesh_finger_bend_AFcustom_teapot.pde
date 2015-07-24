import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh teapot; // this is the name of the obj
WB_Render render;

WB_Point P;
HEM_BendFinger modifiera;
HEM_BendFinger modifierb;
HEM_BendFinger modifierc;


int acounter=0;
int bcounter=0;
int ccounter=0;

PShape result;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  noStroke();

  //importing custom shape utah-teapot.obj
  teapot = new HEC_FromOBJFile(sketchPath("utah-teapot.obj")).create();

  //importing sphere
  //  HEC_Icosahedron creator=new HEC_Icosahedron();
  //  creator.setEdge(300); 
  //  mesh = new HE_Mesh(creator); 
  //
  //  mesh.smooth(3);//subdivision of shape
  //  HET_Diagnosis.validate(mesh);

  //modifier a
  modifiera=new HEM_BendFinger(); 
  modifiera.setFingerAxis(200, 0, 0, 200, 200, 0); //set the axis for the force
  modifiera.setMagnitude(0.01); // the force
  P = new WB_Point(0, 0, 0); // center point of the shape
  modifiera.setCenter(P);  //center of force go towards P
  modifiera.setRadius(50);  //build cylinder around axis line

  //modifier b
  modifierb=new HEM_BendFinger(); 
  modifierb.setFingerAxis(200, 0, 0, 200, 200, 0); //change axis
  modifierb.setMagnitude(0.01); // the force
  P = new WB_Point(0, 0, 0); // stays the same
  modifierb.setCenter(P).setRadius(50);  

  //modifier c
  modifierc=new HEM_BendFinger(); 
  modifierc.setFingerAxis(200, 0, 0, 200, 200, 0); //set the axis
  modifierc.setMagnitude(0.01); // the force
  P = new WB_Point(0, 0, 0); // center point of the shape
  modifierc.setCenter(P).setRadius(50);  

  render = new WB_Render(this);
}

void draw() {
  background(255);
  translate(400, 400, 100);
  rotateY(sin(frameCount * 0.03) + 4.5);
  rotateX(radians(180));

  directionalLight(255, 220, 200, 1, 1, -1);
  directionalLight(50, 187, 130, -1, -1, 1);

  scale(16);


  if (keyPressed) {
    if (key == ' ') {
      teapot.modify(modifiera); //force over time
      modifiera.weakenMagnitude(0.95);
    }
    if (key == 'b') {
      teapot.modify(modifierb); //force over time
      modifierb.weakenMagnitude(0.95);
    }
    if (key == 'c') {
      teapot.modify(modifierc); //force over time
      modifierc.weakenMagnitude(0.95);
    }
  }

  //result = render.toSmoothPShape(broken);
  //shape(result);
  //add for custom

  //  render.drawFaces(mesh);
  render.drawFaces(teapot);
}

