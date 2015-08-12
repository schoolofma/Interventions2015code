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
      sounds.get(i).stop();
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
  switch (key) {
    //for creating shapes
  case 't'://cube
    // add a new letter object to container when key is pressed
    shapes.add(new Letter(0));
    sounds.add(new Sound(ShapeTypes.CUBE));
    break;

  case '4'://plato
    shapes.add(new Letter(1));
    sounds.add(new Sound(ShapeTypes.PLATO));
    break;

  case'5'://sphere
    shapes.add(new Letter(2));
    sounds.add(new Sound(ShapeTypes.SPHERE));
    break;

  case'8'://torus
    shapes.add(new Letter(3));
    sounds.add(new Sound(ShapeTypes.TORUS));
    break;

  case'9'://cylinder
    shapes.add(new Letter(4));
    sounds.add(new Sound(ShapeTypes.CYLINDER));
    break;

  case 'f'://achemedies
    shapes.add(new Letter(5));
    sounds.add(new Sound(ShapeTypes.ARCHIMEDES));
    break;

  case 'v'://cone
    shapes.add(new Letter(6));
    sounds.add(new Sound(ShapeTypes.CONE));

    break;
  case 'j'://polygon
    shapes.add(new Letter(7));
    sounds.add(new Sound(ShapeTypes.POLYGON));
    break;
  } 
  
  if (shapes.size() > 0) {
    Letter last = shapes.get(shapes.size()-1);
    Sound lastSound = sounds.get(sounds.size()-1);
    lastSound.play();
    
    switch (key) {
      //for modifiers
    case '2'://extrude-expand
      last.distort(0);
      lastSound.expand();
      break;

    case 'U'://inflate
      //keycode is used to chose the which distortion
      last.distort(1);
      lastSound.inflate();
      break;

    case 'p'://spikoooey
      last.distort(2);
      lastSound.spike();
      break;

    case'-'://bendy d = -
      last.distort(3);
      lastSound.bend();
      break;

    case'o'://twisty
      last.mesh.rotateAboutAxis(random(3), 0, 2, 0, random(3), random(3), random(3));
      last.distort(4);
      lastSound.twist();
      break;

    case'='://punchholes      
      lastSound.punchHoles();
      break;

    case ','://noise
      last.distort(6);
      lastSound.noise();
      println("noise");
      break;

    case 'c'://merge
      if (shapes.size()>=2) { ///if theres 2 or more then do something
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
      last.distort(7);
      break;

    case 'k'://down
      last.distort(8);
      break;

    case 'l'://up
      last.distort(9);
      break;

    case 'm'://bg
      last.distort(10);
      break;

    case 'A'://left
      last.distort(11);
      break;

    case 'O'://right
      last.distort(12);
      break;

    case 'w'://velo
        last.distort(13);
      break;

    case '.':
      last.freezebg();
      break;
    }
  }
}

