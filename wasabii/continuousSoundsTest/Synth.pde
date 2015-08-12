class Synth {
  Oscil fm;
  Oscil wave;
  
  float attack = 0.1;
  float release = 0.1;

  // constructor for this instrument
  Synth( Wavetable wavetype, float frequency, float amplitude)
  { 
    // create new instances of any UGen objects as necessary
    // Need the triangle tone to chop up.
    wave = new Oscil( frequency, 0, wavetype);
    fm   = new Oscil( 10, 2, Waves.SINE );
    fm.offset.setLastValue( 200 );
    fm.patch( wave.frequency );
    wave.patch( out );
    
  }
  
  void play(){
    Line ampEnv = new Line();
    ampEnv.activate(attack, 0, 1f );
    ampEnv.patch(wave.amplitude);
//    wave.setAmplitude(0.5);
  }
  
  void stop(){
    Line ampEnv = new Line();
    ampEnv.activate(release, 1f, 0 );
    ampEnv.patch(wave.amplitude);
//    wave.setAmplitude(0);
  }
  

  
  void distort(int mode){
  
  }
  
}

