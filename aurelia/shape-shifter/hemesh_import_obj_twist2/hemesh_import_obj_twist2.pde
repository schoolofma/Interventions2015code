import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;


HE_Mesh importcan; // this is the name of the obj
HE_Mesh mesh;
WB_Render render;
WB_Line L;
HEM_Twist modifier;


void setup() {
  size(600, 600, P3D); 
  smooth(); 
  importcan = new HEC_FromOBJFile(sketchPath("can.obj")).create();

  modifier=new HEM_Twist();


  L=new WB_Line(100, 0, 0, 0, 0, 1);
  modifier.setTwistAxis(L);// Twist axis
  //you can also pass the line as two points:  modifier.setBendAxis(0,0,-200,1,0,-200)

  modifier.setAngleFactor(.51);// Angle per unit distance (in degrees) to the twist axis
  // points which are a distance d from the axis are rotated around it by an angle d*angleFactor;

  importcan.modify(modifier);

  render=new WB_Render(this);
}

void draw() {
  background(0);
  directionalLight(255, 255, 255, 1, 1, -1); //added
  directionalLight(127, 127, 127, -1, -1, 1);//added

  rotateY(width/2*1.0f/width*TWO_PI);
  rotateX(height*0.66*1.0f/height*TWO_PI);
  lights();

  mesh=importcan.get();
  L=new WB_Line(0, 0, 0, 0, 1, 0);
  modifier.setTwistAxis(L);
  modifier.setAngleFactor(mouseY*0.005);
  mesh.modify(modifier);

  noStroke();
  scale(10);
  render.drawFacesSmooth(mesh);
}



//void mousePressed() {
//  rotateY(mouseX*1.0f/width*TWO_PI);
//  rotateX(mouseY*1.0f/height*TWO_PI);
//}