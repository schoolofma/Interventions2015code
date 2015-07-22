import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh, broken;
WB_Render render;

WB_Point P;
WB_Line L;
HEM_BendFinger modifier;

PShape result;

void setup() {
  size(800, 800, P3D);
  smooth(8);
  noStroke();
  
  HEC_Icosahedron creator=new HEC_Icosahedron();
  creator.setEdge(300); 

  mesh = new HE_Mesh(creator);
  mesh.smooth(3);
  HET_Diagnosis.validate(mesh);
  
  modifier=new HEM_BendFinger(); 
  modifier.setFingerAxis(200, 0, 0, 200, 200, 0); 
  P = new WB_Point(0, 0, 0);
  modifier.setCenter(P).setRadius(50);  
  
  render = new WB_Render(this);
}

void draw() {
  background(255);
  translate(400, 400, 100);
  rotateY(sin(frameCount * 0.03) + 4.5);
  directionalLight(255, 220, 200, 1, 1, -1);
  directionalLight(50, 187, 130, -1, -1, 1);

  broken = mesh.get();
  modifier.setMagnitude(map(mouseX, 0, width, 0, 0.4));
  broken.modify(modifier);
  
  //result = render.toSmoothPShape(broken);
  //shape(result);
  
  render.drawFaces(broken);
}
