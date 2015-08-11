class Sound implements WasabiiInstrument
{
  Oscil wave;
  Oscil fm;
  
  Sound(Wavetable wavetype) {
    wave = new Oscil( 200, 0.8, wavetype );//200 hertz
    fm   = new Oscil( 10, 2, Waves.SINE );
    
    fm.offset.setLastValue( 200 );
    fm.patch( wave.frequency );
    
  }
  // every instrument must have a noteOn( float ) method
  void noteOn( float dur )
  {
      wave.patch( out );
  }

  // every instrument must have a noteOff() method
  void noteOff()
  {
    wave.unpatch( out );  
  }
  
  void distort(int mode){
  
  }
}

