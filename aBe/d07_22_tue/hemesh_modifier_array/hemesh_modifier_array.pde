import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

HE_Mesh mesh, broken;
WB_Render render;

WB_Point P;
HEM_BendFinger[] modifier;

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
  
  P = new WB_Point(0, 0, 0);

  modifier = new HEM_BendFinger[5];

  for(int i=0; i<modifier.length; i++) {
    float a = i * TWO_PI/modifier.length;
    modifier[i]=new HEM_BendFinger(); 
    modifier[i].setFingerAxis(200*cos(a), 0, 200*sin(a), 200*cos(a), 200, 200*sin(a)); 
    modifier[i].setCenter(P).setRadius(70);  
  }

  render = new WB_Render(this);
}

void draw() {
  background(255);
  translate(400, 400, 100);
  rotateY(sin(frameCount * 0.03) + 4.5);
  directionalLight(255, 220, 200, 1, 1, -1);
  directionalLight(50, 187, 130, -1, -1, 1);

  broken = mesh.get();
  for(int i=0; i<modifier.length; i++) {
    modifier[i].setMagnitude(map(mouseX, 0, width, 0, 0.4));
    broken.modify(modifier[i]);
  }
  
  //result = render.toSmoothPShape(broken);
  //shape(result);
  
  render.drawFaces(broken);
}
