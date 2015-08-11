class Sound
{
  Oscil wave;
  //  Oscil wave2;
  Oscil fm;
  //  Oscil fm2;

  Sound( Wavetable wavetype) {

    wave = new Oscil( 200, 0.8, wavetype );//200 hertz

    fm   = new Oscil( 10, 2, Waves.SINE );
    
    fm.offset.setLastValue( 200 );
    fm.patch( wave.frequency );//f
    wave.patch( out );
  }
  void soundUpdate(int modifier) {
    //    fm.setFrequency( modulateFrequency );
    //    fm.setAmplitude( modulateAmount );

    //    wave2.setFrequency(random(30, 200));

    switch( modifier )
    {
    case 2: 
      println("case2");
      fm.offset.setLastValue( random(200, 900) );//works
      break;

    case 'U':
      fm.setFrequency( random(190, 200) );//works
      break;

    case 'p':
      fm.setAmplitude( random(150, 500) );
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
      wave.setWaveform( Waves.SINE );
      break;

    case 'j':
      wave.setWaveform( Waves.TRIANGLE );
      break;

    case 'w':
      wave.setWaveform( Waves.SAW );
      break;

    case 'a':
      wave.setWaveform( Waves.SQUARE );
      break;

    case 's'://cube
      wave.setWaveform( Waves.QUARTERPULSE );
      break;

    case 'd':// cone
      wave.setWaveform( Waves.QUARTERPULSE );
      break;


    default: 

      break;
    }
  }
}

