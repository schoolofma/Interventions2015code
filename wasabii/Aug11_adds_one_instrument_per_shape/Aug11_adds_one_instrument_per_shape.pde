import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;

import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


//SOUNDS
Minim minim;
AudioOutput out;
ArrayList<Sound> sounds;
Sound lastSound;

int numSpheres, numTorus, numCylinders, numCones, numCubes, numPlatos, numArchimedes, numPolygons;


//IMAGES
ArrayList <Letter> shapes;
//like a camera so it stays in the main prog
WB_Render render;
WB_Point[] points;
WB_BSpline C;
WB_GeometryFactory gf=WB_GeometryFactory.instance();
//to call for extrudtion
WB_Plane P;
WB_Line L;

PShape bg;
PGraphics bg2;
PImage bg3;

void setup() {
  size(800, 800, P3D);
  textureMode(NORMAL);
  smooth(8);

  //SOUNDS
  minim = new Minim( this );
  out   = minim.getLineOut();

  sounds = new ArrayList<Sound>();

  //IMAGES
  shapes = new ArrayList <Letter> ();
  noFill();
  stroke(232, 243, 245);
  bg =createShape( SPHERE, 2200);
  fill(255);
  render=new WB_Render(this);
  bg3=loadImage("bg3.png");
  
}

void draw() {
  //background(#FF0000);
  if (bg2!=null) {
    if (frameCount%3==0) {// every 5 frames before it erases the drawn shape
      bg2.beginDraw();
      bg2.fill(1);
      bg2.noStroke();
      bg2.blendMode(ADD);
      bg2.rect(0, 0, width, height);
      bg2.fill(255);
      bg2.stroke(0);
      bg2.endDraw();
    }
    hint(DISABLE_DEPTH_TEST);
    image(bg2, 0, 0, width, height);
    hint(ENABLE_DEPTH_TEST);
  } else {
    bg2=createGraphics (width, height, P3D);
    bg2.beginDraw();
    bg2.background(255);
    bg2.endDraw();
  }
  pushMatrix();
  translate(width/9, -1100, 500);
  rotateX(frameCount*0.001);
  shape(bg);
  popMatrix();

  directionalLight(255, 255, 255, 1, 1, -1);
  directionalLight(127, 127, 127, -1, -1, 1);

  for (int i=shapes.size ()-1; i>=0; i--) {
    Letter l = shapes.get(i);
    l.display();
    l.update();
    //when letters go over a threshold, show only wireframes
    boolean showWireframe=false;
    if (l.y<height*0.25) {
      l.showWireframe = true;
    }
    if (l.y>height*0.25 && l.y<height*0.55 && random(100)<50 ) {
      l.showWireframe = true;
    }
    if(l.showWireframe){
      sounds.get(i).stop();
    }
    //when letters go off the screen then remove
    if (l.y < 0) {
      shapes.remove(i);
      sounds.remove(i);
    }
  }
  if (frameCount% 60==0) {
    frame.setTitle("FPS" +nf(frameRate, 2, 2));
  }
  hint(DISABLE_DEPTH_TEST);
  //  image(bg3,0,0,width,height);
  hint(ENABLE_DEPTH_TEST);
}


void keyPressed() {
  Letter last;
  
  switch (key) {
    //for creating shapes
  case 't'://cube
    // add a new letter object to container when key is pressed
    shapes.add(new Letter(0));
    lastSound = new Sound(ShapeTypes.CUBE);
    break;

  case '4'://plato
    shapes.add(new Letter(1));
    lastSound = new Sound(ShapeTypes.PLATO);
    break;

  case'5'://sphere
    shapes.add(new Letter(2));
    lastSound = new Sound(ShapeTypes.SPHERE);
    break;

  case'8'://torus
    shapes.add(new Letter(3));
    lastSound = new Sound(ShapeTypes.TORUS);
    numTorus ++;
    break;

  case'9'://cylinder
    shapes.add(new Letter(4));
    lastSound = new Sound(ShapeTypes.CYLINDER);
    numCylinders ++;
    break;

  case 'f'://achemedies
    shapes.add(new Letter(5));
    lastSound = new Sound(ShapeTypes.ARCHIMEDES);
    numArchimedes ++;
    break;

  case 'v'://cone
    shapes.add(new Letter(6));
    lastSound = new Sound(ShapeTypes.CONE);
    numCones ++;

    break;
  case 'j'://polygon
    shapes.add(new Letter(7));
    lastSound = new Sound(ShapeTypes.POLYGON);
    numPolygons ++;
    break;
  }
  if(lastSound != null){
    sounds.add(lastSound);
    lastSound.play();
  }
  
  if (shapes.size() > 0) {
    println(shapes);
    switch (key) {
      //for modifiers
    case '2'://extrude-expand
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(0);
      lastSound.expand();
      break;

    case 'U'://inflate
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(1);
      lastSound.inflate();
      break;

    case 'p'://spikoooey
      last = shapes.get(shapes.size()-1);
      last.distort(2);
      lastSound.spike();
      break;

    case'-'://bendy d = -
      last = shapes.get(shapes.size()-1);
      last.distort(3);
      lastSound.bend();
      break;

    case'o'://twisty
      last=shapes.get(shapes.size()-1);
      last.mesh.rotateAboutAxis(random(3), 0, 2, 0, random(3), random(3), random(3));
      last.distort(4);
      lastSound.twist();
      break;

    case'='://punchholes
      last = shapes.get(shapes.size()-1);
      lastSound.punchHoles();
      break;

    case ','://noise
      last = shapes.get(shapes.size()-1);
      last.distort(6);
      lastSound.noise();
      break;

    case 'c'://merge
      if (shapes.size()>=2) { ///if theres 2 or more then do something
        last=shapes.get(shapes.size()-1);
        last.mesh.rotateAboutAxis(random(7), 0, 0, 0, random(1), random(1), random(1));

        Letter previous= shapes.get(shapes.size()-2);
        previous.mesh.add(last.mesh);
        previous.updatePshape();
        shapes.remove(shapes.size()-1);/// removes the last elements

        lastSound.merge();
      }
      break;

    case 'u'://mergeonside
      if (shapes.size()>=2) { ///if theres 2 or more then do something
        last=shapes.get(shapes.size()-1);
        Letter previous= shapes.get(shapes.size()-2);
        last.mesh.move(random(50), random(50), random(50));
        previous.mesh.add(last.mesh);
        previous.updatePshape();
        shapes.remove(shapes.size()-1);/// removes the last elements
      }

      lastSound.mergeOnSide();
      break;
    case 'r'://stretch
      last=shapes.get(shapes.size()-1);
      last.distort(7);
      break;

    case 'k'://down
      last=shapes.get(shapes.size()-1);
      last.distort(8);
      break;

    case 'l'://up
      last=shapes.get(shapes.size()-1);
      last.distort(9);
      break;

    case 'm'://bg
      last=shapes.get(shapes.size()-1);
      last.distort(10);
      break;

    case 'A'://left
      last=shapes.get(shapes.size()-1);
      last.distort(11);
      break;

    case 'O'://right
      last=shapes.get(shapes.size()-1);
      last.distort(12);
      break;

    case 'w'://velo
        last = shapes.get(shapes.size()-1);
        last.distort(13);
      break;

    case '.':
      last=shapes.get(shapes.size()-1);
      last.freezebg();
      break;
    }
  }
}

