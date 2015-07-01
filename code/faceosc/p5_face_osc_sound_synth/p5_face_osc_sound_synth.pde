/**
 * This sketch demonstrates how to create synthesized sound with Minim 
 * using an AudioOutput and an Oscil. An Oscil is a UGen object, 
 * one of many different types included with Minim. By using 
 * the numbers 1 thru 5, you can change the waveform being used
 * by the Oscil to make sound. These basic waveforms are the 
 * basis of much audio synthesis. 
 * 
 * For many more examples of UGens included with Minim, 
 * have a look in the Synthesis folder of the Minim examples.
 * <p>
 * For more information about Minim and additional features, 
 * visit http://code.compartmental.net/minim/
 */

import ddf.minim.*;
import ddf.minim.ugens.*;
import oscP5.*;

Minim       minim;
AudioOutput out;
Oscil       wave;
OscP5 oscP5;

float mouthHeight;
float mouthWidth;

void setup()
{
  size(512, 200, P3D);
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");

  minim = new Minim(this);

  // use the getLineOut method of the Minim object to get an AudioOutput object
  out = minim.getLineOut();

  // create a sine wave Oscil, set to 440 Hz, at 0.5 amplitude
  wave = new Oscil( 440, 0.5f, Waves.SINE );
  // patch the Oscil to the output
  wave.patch( out );
}

void draw()
{
  
  float amp = map( mouthWidth, 7, 20, 0, 1 );
  wave.setAmplitude( amp );

  float freq = map( mouthHeight, 0, 10, 110, 880 );
  wave.setFrequency( freq );
  
  background(0);
  stroke(255);
  strokeWeight(1);

  // draw the waveform of the output
  for (int i = 0; i < out.bufferSize () - 1; i++)
  {
    line( i, 50  - out.left.get(i)*50, i+1, 50  - out.left.get(i+1)*50 );
    line( i, 150 - out.right.get(i)*50, i+1, 150 - out.right.get(i+1)*50 );
  }

  // draw the waveform we are using in the oscillator
  stroke( 128, 0, 0 );
  strokeWeight(4);
  for ( int i = 0; i < width-1; ++i )
  {
    point( i, height/2 - (height*0.49) * wave.getWaveform().value( (float)i / width ) );
  }
}


void keyPressed()
{ 
  switch( key )
  {
  case '1': 
    wave.setWaveform( Waves.SINE );
    break;

  case '2':
    wave.setWaveform( Waves.TRIANGLE );
    break;

  case '3':
    wave.setWaveform( Waves.SAW );
    break;

  case '4':
    wave.setWaveform( Waves.SQUARE );
    break;

  case '5':
    wave.setWaveform( Waves.QUARTERPULSE );
    break;

  default: 
    break;
  }
}

public void mouthWidthReceived(float w) {
  println("mouth Width: " + w);
  mouthWidth = w;
}

public void mouthHeightReceived(float h) {
  println("mouth height: " + h);
  mouthHeight = h;
}
