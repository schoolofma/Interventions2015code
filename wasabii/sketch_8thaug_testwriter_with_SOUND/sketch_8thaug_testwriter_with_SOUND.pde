import penner.easing.*;

import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
ArrayList <Letter> shapes;
ArrayList<Sound> sounds;


//like a camera so it stays in the main prog
WB_Render render;
WB_Point[] points;
WB_BSpline C;
WB_GeometryFactory gf=WB_GeometryFactory.instance();
//to call for extrudtion
WB_Plane P;
WB_Line L;
Minim minim;
AudioOutput out;




void setup() {

  size(800, 800, P3D);
  background(222, 227, 232);
  textureMode(NORMAL);
  smooth(8);
  
  // container for letters 
  shapes = new ArrayList <Letter>();
  sounds = new ArrayList<Sound>();

  render=new WB_Render(this);
  
  minim = new Minim( this );
  out   = minim.getLineOut();
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
      //remove sound too
      println("remove", i);
    }
  }
  if (frameCount% 60==0) {
    frame.setTitle("FPS" +nf(frameRate, 2, 2));
  }
}


void keyPressed() {
  if (shapes.size()>0) {
    Letter last = shapes.get(shapes.size()-1);
    Sound wavelast = sounds.get(sounds.size()-1);
    switch (key) {
      //for modifiers
    case '2'://extrude-expand
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(0);
      wavelast.soundUpdate(2);
      break;

    case 'U'://inflate
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(1);
      wavelast.soundUpdate(2);

      break;
    case 'p'://croc
      last = shapes.get(shapes.size()-1);
      last.distort(2);
      break;
    case'-'://bendy d = -
      last = shapes.get(shapes.size()-1);
      last.distort(3);
      break;
    case'o'://twisty
      last=shapes.get(shapes.size()-1);
      last.distort(4);
      break;
    case'n'://punchholes
      last = shapes.get(shapes.size()-1);
      last.distort(5);
      break;
    case ','://noise
      last = shapes.get(shapes.size()-1);
      last.distort(6);
      break;
    case 'c'://merge
      if (shapes.size()>=2) { ///if theres 2 or more then do something
        last=shapes.get(shapes.size()-1);
        Letter previous= shapes.get(shapes.size()-2);
        previous.mesh.add(last.mesh);
        previous.updatePshape();
        shapes.remove(shapes.size()-1);/// removes the last elements
      }
      break;
    case 'r'://stretch
      last=shapes.get(shapes.size()-1);
      last.distort(7);
      break;
    case 'k'://leftright
      last=shapes.get(shapes.size()-1);
      last.distort(8);
      break;
    case 'l'://updown
      last=shapes.get(shapes.size()-1);
      last.distort(9);
      break;
    case 'm'://bg
      last=shapes.get(shapes.size()-1);
      last.distort(10);
      break;
    case 'A'://velo
      last=shapes.get(shapes.size()-1);
      last.distort(11);
      break;
    case 'O'://velo
      last=shapes.get(shapes.size()-1);
      last.distort(12);
      break;
    }
  }

  switch (key) {
    //for creating shapes
  case 't'://cube
    // add a new letter object to container when key is pressed
    shapes.add(new Letter(0));
    sounds.add(new Sound(Waves.SINE));
    break;
  case '4'://plato
    shapes.add(new Letter(1));
    sounds.add(new Sound(Waves.TRIANGLE));
    break;
  case'5'://ellipse
    shapes.add(new Letter(2));
    sounds.add(new Sound(Waves.SAW));
    break;
  case'8'://gridish
    shapes.add(new Letter(3));
    sounds.add(new Sound(Waves.SQUARE));
    break;
  case'9'://cylinder
    shapes.add(new Letter(4));
    sounds.add(new Sound(Waves.QUARTERPULSE));
    break;
  case 'f'://achemedies
    shapes.add(new Letter(5));
    break;
  case 'v'://cone
    shapes.add(new Letter(6));
    break;
  case 'j'://polygon
    shapes.add(new Letter(7));
    break;
  }
}

