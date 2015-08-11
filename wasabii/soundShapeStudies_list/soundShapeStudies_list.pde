import ddf.minim.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioOutput out;
SphereSound sphereSound;


void setup(){
  size(400, 600);
  minim = new Minim(this);
  out = minim.getLineOut();
  sphereSound = new SphereSound(400f, 0.3f, Waves.SINE);
  
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //SPHERE
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //TORUS
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //CYLINDER
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //CONE
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //CUBE
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //PLATO
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //ARCHIMEDES
// instruments.add(new TheInstrument(435, 0.5f, Waves.SINE)); //POLYGON
  

}

void draw(){

  

}

void keyPressed(){
  
  //CREATORS
  switch(key){
    case 'a'://SPHERE
//      sphereSounds.add(sphereSound);
      sphereSound.play();
      break;
    case 's'://TORUS
//      out.playNote( 0, 0.5, new TheInstrument(435, 0.4f, Waves.SINE));
//      out.playNote( 0, 0.5, new TheInstrument(435, 0.1f, Waves.TRIANGLE));//G
      break;
    case 'd'://CYLINDER
//      out.playNote( 0, 0.8, new TheInstrument(435, 0.3f, Waves.SINE));
//      out.playNote( 0, 0.8, new TheInstrument(435*2, 0.25f, Waves.TRIANGLE));//one octave higher (double frequency)
      break;
    case 'f'://CONE
//      out.playNote( 0, 0.8, new TheInstrument(435, 0.25f, Waves.SINE));
//      out.playNote( 0, 0.8, new TheInstrument(435, 0.1f, Waves.SAW));
      break;
    case 'g'://SQUARE
//      out.playNote( 0, 0.8, new TheInstrument(435, 0.5f, Waves.TRIANGLE));
      break;
    case 'h'://PLATO
//      out.playNote( 0, 0.5, new TheInstrument(435, 0.15f, Waves.SAW));
      break;
    case 'j'://ARCHIMEDES
//      out.playNote( 0, 0.8, new TheInstrument(435, 0.4f, Waves.SINE));
//      out.playNote( 0, 0.8, new TheInstrument(435, 0.05f, Waves.SQUARE));
      break;
    case 'k'://POLYGON
      break;
  }
  //MODIFIERS
  switch(key){
    case 'z'://EXPAND
      sphereSound.expand();
      break;
    case 'x'://STRETCH
      break;
    case 'c'://MERGE
      break;
    case 'v'://BEND
      sphereSound.bend();
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
      sphereSound.twist();
      break;
    case 'l'://SPIKE
      sphereSound.spike();
      break;
    case ';'://NOISE
      break;
  }
  
}
void mouseMoved()
  {
    float modulateAmount = map( mouseY, 0, height, 220, 1 );
    float modulateFrequency = map( mouseX, 0, width, 0.1, 100 );
    
    sphereSound.fm.setFrequency( modulateFrequency );
    sphereSound.fm.setAmplitude( modulateAmount );
    println("f:" + modulateFrequency);
    println("a:" + modulateAmount);
  }
