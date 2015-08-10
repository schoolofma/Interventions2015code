import ddf.minim.*;
import ddf.minim.ugens.*;

//import controlP5.*;

Minim minim;
AudioOutput out;
Instrument instrument;

//ControlP5 cp5;


void setup(){
  size(400, 600);
  minim = new Minim(this);
  out = minim.getLineOut();
//  instrument = new TheInstrument(Waves.SINE);
  
//  cp5 = new ControlP5(this);
  setupInterface();
}

void draw(){


}

void keyPressed(){
  switch(key){
    case 'a'://SPHERE
      out.playNote( 0, 0.5, new TheInstrument(random(300, 340), 0.5f, Waves.SINE));//around E
      break;
    case 's'://TORUS
      out.playNote( 0, 0.5, new TheInstrument(random(350, 400), 0.4f, Waves.SINE));
      out.playNote( 0, 0.5, new TheInstrument(random(350, 400), 0.1f, Waves.TRIANGLE));//G
      break;
    case 'd'://CYLINDER
      out.playNote( 0, 0.8, new TheInstrument(466.16, 0.3f, Waves.SINE));
      out.playNote( 0, 0.8, new TheInstrument(466.16*2, 0.25f, Waves.TRIANGLE));//one octave higher (double frequency)
      break;
    case 'f'://CONE
      out.playNote( 0, 0.8, new TheInstrument(440, 0.25f, Waves.SINE));
      out.playNote( 0, 0.8, new TheInstrument(880, 0.1f, Waves.SAW));
      break;
    case 'g'://SQUARE
      out.playNote( 0, 0.8, new TheInstrument(440, 0.5f, Waves.TRIANGLE));
      break;
    case 'h'://PLATO
      out.playNote( 0, 0.5, new TheInstrument(440, 0.15f, Waves.SAW));
      break;
    case 'j'://ARCHIMEDES
      out.playNote( 0, 0.8, new TheInstrument(440, 0.4f, Waves.SINE));
      out.playNote( 0, 0.8, new TheInstrument(440, 0.05f, Waves.SQUARE));
      break;
    case 'k'://POLYGON
      out.playNote( 0, 0.25, new TheInstrument(440, 0.1f, Waves.SQUARE));
      break;
  }
}

void setupInterface(){
//  cp5.addSlider("frequency")
//     .setRange(100,1000)
//     ;
}
