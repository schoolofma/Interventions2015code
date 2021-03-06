/* frequencyModulation
 <p>
 A simple example for doing FM (frequency modulation) using two Oscils.
 <p>
 For more information about Minim and additional features, 
 visit http://code.compartmental.net/minim/
 <p>  
 Author: Damien Di Fede
 */

// import everything necessary to make sound.
import ddf.minim.*;
import ddf.minim.ugens.*;
float x;
float y;


// create all of the variables that will need to be accessed in
// more than one methods (setup(), draw(), stop()).
Minim minim;
AudioOutput out;

// the Oscil we use for modulating frequency.
Oscil wave;
Oscil wave2;
Oscil fm;
Oscil fm2;
// setup is run once at the beginning
void setup()
{
  // initialize the drawing window
  size( 512, 200, P3D );

  // initialize the minim and out objects
  minim = new Minim( this );
  out   = minim.getLineOut();

  // make the Oscil we will hear.
  // arguments are frequency, amplitude, and waveform
  wave = new Oscil( 200, 0.8, Waves.TRIANGLE );//200 hertz
  wave2 = new Oscil( 200, 0.8, Waves.TRIANGLE );
  // make the Oscil we will use to modulate the frequency of wave.
  // the frequency of this Oscil will determine how quickly the
  // frequency of wave changes and the amplitude determines how much.
  // since we are using the output of fm directly to set the frequency 
  // of wave, you can think of the amplitude as being expressed in Hz.
  fm   = new Oscil( 10, 2, Waves.SINE );
  fm2   = new Oscil( 10, 2, Waves.SINE );
  // set the offset of fm so that it generates values centered around 200 Hz
  fm.offset.setLastValue( 200 );
  fm2.offset.setLastValue( 200 );
  //  // patch it to the frequency of wave so it controls it
  fm.patch( wave.frequency );
  fm2.patch( wave2.frequency );
  // and patch wave to the output
  wave2.patch( out );
  wave.patch( out );
}

// draw is run many times
void draw()
{
  // erase the window to black
  background( 0 );
  // draw using a white stroke
  stroke( 255 );
  // draw the waveforms
  for ( int i = 0; i < out.bufferSize () - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 + out.left.get(i)*50, x2, 50 + out.left.get(i+1)*50);
    line( x1, 150 + out.right.get(i)*50, x2, 150 + out.right.get(i+1)*50);
  }  

  //  text( "Modulation frequency: " + fm.frequency.getLastValue(), 5, 15 );
  //  text( "Modulation amplitude: " + fm.amplitude.getLastValue(), 5, 30 );
}

// we can change the parameters of the frequency modulation Oscil
// in real-time using the mouse.
//void mouseMoved()
//{
//  float modulateAmount = map( keyCode, 0, height, 220, 1 );
//  float modulateFrequency = map( keyCode, 0, width, 0.1, 100 );
//
//  fm.setFrequency( modulateFrequency );
//  fm.setAmplitude( modulateAmount );
//}

void keyPressed()
{ 
  float modulateAmount = map( x,0, width, 220, 1 );
  float modulateFrequency = map( y, 0, 255, 0.1, 1004848 );
  println(keyCode);

  fm.setFrequency( modulateFrequency );
  fm.setAmplitude( modulateAmount );
  wave.setFrequency(random(190,200));
 wave2.setFrequency(random(30,200));
  
  switch( key )
  {
  case '4': 
    wave.setWaveform( Waves.SINE );
    break;

  case '6':
    wave.setWaveform( Waves.TRIANGLE );
    break;

  case '8':
    wave.setWaveform( Waves.SAW );
    break;

  case '9':
    wave.setWaveform( Waves.SQUARE );
    break;

  case 't'://cube
    wave.setWaveform( Waves.QUARTERPULSE );
    break;

  case 'u':// cone
    wave.setWaveform( Waves.QUARTERPULSE );
    break;
    
     case 'f': 
    wave2.setWaveform( Waves.SINE );
    break;

  case 'j':
    wave2.setWaveform( Waves.TRIANGLE );
    break;

  case 'w':
    wave2.setWaveform( Waves.SAW );
    break;

  case 'a':
    wave2.setWaveform( Waves.SQUARE );
    break;

  case 's'://cube
    wave2.setWaveform( Waves.QUARTERPULSE );
    break;

  case 'd':// cone
    wave2.setWaveform( Waves.QUARTERPULSE );
    break;


  default: 
    break;
  }
}

