import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioOutput out;
ArrayList<Sound> sounds;

Sound lastSound;


void setup() {
  size(400, 600);
  minim = new Minim(this);
  out = minim.getLineOut();

  sounds = new ArrayList<Sound>();
  
  
  
}

void draw() {
}

void keyPressed() {
  //CREATORS
  switch(key) {
  case 'a'://SPHERE
    lastSound = new Sound(400f, 0.3f, Waves.SINE, ShapeTypes.SPHERE);
    break;
  case 's'://TORUS
    lastSound = new Sound(435, 0.5f, Waves.SINE);
    break;
  case 'd'://CYLINDER
    lastSound = new Sound(435, 0.3f, Waves.SINE);
    break;
  case 'f'://CONE
    lastSound = new Sound(435, 0.25f, Waves.SINE);
    break;
  case 'g'://CUBE
    lastSound = new Sound(435, 0.5f, Waves.TRIANGLE);
    break;
  case 'h'://PLATO
    lastSound = new Sound(435, 0.10f, Waves.SAW);
    break;
  case 'j'://ARCHIMEDES
    lastSound = new Sound(435, 0.4f, Waves.SINE);
    break;
  case 'k'://POLYGON
    lastSound = new Sound(435, 0.5f, Waves.TRIANGLE);
    break;
  }
  sounds.add(lastSound);
  lastSound.play();
  
  //MODIFIERS
  switch(key) {
  case 'z'://EXPAND
    lastSound.expand();
    break;
  case 'x'://STRETCH
    break;
  case 'c'://MERGE
    break;
  case 'v'://BEND
    lastSound.bend();
    break;
  case 'b'://BACKGROUND
    break;
  case 'n'://LEFT
    break;
  case 'm'://RIGHT
    break;
  case ','://UP
    break;
  case '.'://DOWN
    break;
  case '/'://TWIST
    lastSound.twist();
    break;
  case 'l'://SPIKE
    lastSound.spike();
    break;
  case ';'://NOISE
    break;
  }
}

