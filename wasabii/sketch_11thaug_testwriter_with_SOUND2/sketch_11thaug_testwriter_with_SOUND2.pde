import wblut.math.*;
import wblut.processing.*;
import wblut.core.*;
import wblut.hemesh.*;
import wblut.geom.*;
import ddf.minim.*;
import ddf.minim.ugens.*;
ArrayList <Letter> shapes;
ArrayList<Sound> sounds;
ArrayList<SteadyGrainInstrument> instruments;


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
PShape bg;
PGraphics bg2;
PImage bg3;



void setup() {

  size(800, 800, P3D);
  //  background(222, 227, 232);
  textureMode(NORMAL);
  smooth(8);
  // container for letters 
  shapes = new ArrayList <Letter> ();
  sounds = new ArrayList<Sound>();
  instruments = new ArrayList<SteadyGrainInstrument>();

  noFill();
  stroke(232,243,245);
  bg =createShape( SPHERE, 2200);
  fill(255);
  render=new WB_Render(this);
  minim = new Minim( this );
  out   = minim.getLineOut();
  //creates 3 instruments
  instruments.add(new SteadyGrainInstrument( 110f, 0.5, 1.0, 0.5 ));
  instruments.add(new SteadyGrainInstrument( 1320f, 0.3, 1.0, 0.103 ));
  instruments.add(new SteadyGrainInstrument( 775f, 0.5, 1.0, 0.0755 ));
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
    //when letters go off the screen then remove
    if (l.y < 0) {
      shapes.remove(i);
      println("remove", i);
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
  println(key, shapes.size());
  Sound wavelast;
  SteadyGrainInstrument lastInstrument;
  Letter last;
  if (shapes.size()>0) {
    switch (key) {
      //for modifiers
    case '2'://extrude-expand
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(0);
      if (sounds.size()>0) {
        wavelast = sounds.get(sounds.size()-1);
        wavelast.soundUpdate(2);
      }

      break;

    case 'U'://inflate
      //how to distort only the last shape
      last = shapes.get(shapes.size()-1);
      //keycode is used to chose the which distortion
      last.distort(1);
      if (sounds.size()>0) {
        wavelast = sounds.get(sounds.size()-1);
        wavelast.soundUpdate(2);
      }

      break;
    case 'p'://croc
      last = shapes.get(shapes.size()-1);
      last.distort(2);
      if (sounds.size()>0) {
        wavelast = sounds.get(sounds.size()-1);
        wavelast.soundUpdate(3);
      }
      break;
    case'-'://bendy d = -
      last = shapes.get(shapes.size()-1);
      last.distort(3);
      break;
    case'o'://twisty
      last=shapes.get(shapes.size()-1);
      last.mesh.rotateAboutAxis(random(3), 0, 2, 0, random(3), random(3), random(3));
      last.distort(4);

      break;
    case'='://punchholes
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
        last.mesh.rotateAboutAxis(random(7), 0, 0, 0, random(1), random(1), random(1));


        Letter previous= shapes.get(shapes.size()-2);
        previous.mesh.add(last.mesh);
        previous.updatePshape();
        shapes.remove(shapes.size()-1);/// removes the last elements
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
      println(shapes.size());
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
      last=shapes.get(shapes.size()-1);
      last.distort(13);
      break;
    case '.':
      last=shapes.get(shapes.size()-1);
      last.freezebg();
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
  case'8'://torus
    shapes.add(new Letter(3));
    sounds.add(new Sound(Waves.SQUARE));
    break;
  case'9'://cylinder
    shapes.add(new Letter(4));

    break;
  case 'f'://achemedies
    shapes.add(new Letter(5));
    lastInstrument = instruments.get(instruments.size()-1);


    break;
  case 'v'://cone
    shapes.add(new Letter(6));
    lastInstrument = instruments.get(instruments.size()-1);

    break;
  case 'j'://polygon
    println(shapes.size());
    shapes.add(new Letter(7));
    //    lastInstrument = instruments.get(instruments.size()-1);

    println(shapes.size());
    break;
  }
}

