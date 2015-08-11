class Synth implements Instrument {
  // create all variables that must be used throughout the class
  GranulateSteady chopper;
  

  // constructor for this instrument
  Synth( Wavetable wavetype, float frequency, float amplitude, float period, float percentOn )
  { 
    // create new instances of any UGen objects as necessary
    // Need the triangle tone to chop up.
    Oscil toneOsc = new Oscil( frequency, amplitude, wavetype);

    // need the GranulateSteady envelope
    chopper = new GranulateSteady( period*percentOn, period*(1 - percentOn ), 0.0205 );

    // patch everything together up to the final output
    // the tone just goes into the chopper
    toneOsc.patch( chopper );
  }

  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
    chopper.patch( out );
  }

  // every instrument must have a noteOff() method
  void noteOff()
  {
    chopper.unpatch( out );
  }
  
  void distort(int mode){
  
  }
}

