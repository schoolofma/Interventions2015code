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
  sounds.add(new Sound(400f, 0.3f, Waves.SINE)); //0:SPHERE
  sounds.add(new Sound(435, 0.5f, Waves.SINE)); //1:TORUS
  sounds.add(new Sound(435, 0.3f, Waves.SINE)); //2:CYLINDER + TRIANGLE 0.25
  sounds.add(new Sound(435, 0.25f, Waves.SINE)); //3:CONE + SAW 0.1
  sounds.add(new Sound(435, 0.5f, Waves.TRIANGLE)); //4:CUBE
  sounds.add(new Sound(435, 0.10f, Waves.SAW)); //5:PLATO
  sounds.add(new Sound(435, 0.4f, Waves.SINE)); //6:ARCHIMEDES + SQUARE 0.05
  sounds.add(new Sound(435, 0.5f, Waves.TRIANGLE)); //7:POLYGON
  
}

void draw() {
}

void keyPressed() {

  //CREATORS
  switch(key) {
  case 'a'://SPHERE
    lastSound = sounds.get(0);
    break;
  case 's'://TORUS
    lastSound = sounds.get(1);
    break;
  case 'd'://CYLINDER
    lastSound = sounds.get(2);
    break;
  case 'f'://CONE
    lastSound = sounds.get(3);
    break;
  case 'g'://CUBE
    lastSound = sounds.get(4);
    break;
  case 'h'://PLATO
    lastSound = sounds.get(5);
    break;
  case 'j'://ARCHIMEDES
    lastSound = sounds.get(6);
    break;
  case 'k'://POLYGON
    lastSound = sounds.get(7);
    break;
  }
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

