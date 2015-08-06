import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
ArrayList <Letter> shapes;


//like a camera so it stays in the main prog
WB_Render render;
WB_Point[] points;
WB_BSpline C;
WB_GeometryFactory gf=WB_GeometryFactory.instance();
//to call for extrudtion
WB_Plane P;
WB_Line L;



void setup() {

  size(800, 800, P3D);
  background(222, 227, 232);
  textureMode(NORMAL);
  smooth(8);
  // container for letters 
  shapes = new ArrayList <Letter> ();

  render=new WB_Render(this);
}

void draw() {
  background(255);
  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);

  for (int i=shapes.size ()-1; i>=0; i--) {
    Letter l = shapes.get(i);
    l.display();
    l.update();
    //when letters go off the screen then remove
    if (l.y < 0) {
      shapes.remove(i);
      println("remove", i);
    }
  }
  if (frameCount% 60==0) {
    frame.setTitle("FPS" +nf(frameRate, 2, 2));
  }
}


void keyPressed() {
  if (shapes.size()>0) {
    Letter last;
    switch (key) {
      //for modifiers

    case 'q':
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(1);
      break;
    case 'w':
      last = shapes.get(shapes.size()-1);
      last.distort(2);
      break;
    case'd':
      last = shapes.get(shapes.size()-1);
      last.distort(3);
      break;
    case'f':
      last=shapes.get(shapes.size()-1);
      last.distort(4);
      break;
    case'h':
      last = shapes.get(shapes.size()-1);
      last.distort(5);
      break;
    case 'j':
      last = shapes.get(shapes.size()-1);
      last.distort(6);
      break;
    case 'u':
      if (shapes.size()>=2) { ///if theres 2 or more then do something
        last=shapes.get(shapes.size()-1);
        Letter previous= shapes.get(shapes.size()-2);
        previous.mesh.add(last.mesh);
        previous.updatePshape();
        shapes.remove(shapes.size()-1);/// removes the last elements
      }
      break;
    case 'r':
      last=shapes.get(shapes.size()-1);
      last.distort(7);
      break;
    case 'k':
      last=shapes.get(shapes.size()-1);
      last.distort(8);
      break;
    case 'l':
      last=shapes.get(shapes.size()-1);
      last.distort(9);
      break;
    case 'm':
      last=shapes.get(shapes.size()-1);
      last.distort(10);
      break;
    }
  }





  switch (key) {

    //for creating shapes
  case '2':
    // add a new letter object to container when key is pressed
    shapes.add(new Letter(0));
    break;
  case '4':
    shapes.add(new Letter(1));
    break;
  case'5':
    shapes.add(new Letter(2));
    break;
  case'8':
    shapes.add(new Letter(3));
    break;
  case'9':
    shapes.add(new Letter(4));
    break;
  case '=':
    shapes.add(new Letter(5));
    break;
  case 'U':
    shapes.add(new Letter(6));
    break;
  case 'j':
    shapes.add(new Letter(7));
    break;
  }
}

