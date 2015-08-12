class Sound {
  ShapeTypes type; 
  Wavetable waveType; 
  
  Oscil osc;
  Oscil fm;

  float frequency = 440;
  float amplitude = 0.5f;

  float attack = 0.2;
  float release = 0.8;

  IIRFilter filt;
  Oscil cutOsc;
  Constant cutoff;

  Sound(float _frequency, float _amplitude, Wavetable waveType) {
    amplitude = _amplitude;
    frequency = _frequency;
    if(
    osc = new Oscil( frequency, 0, waveType);

    fm = new Oscil( 10, 2, Waves.SINE );
    fm.offset.setLastValue( 200 );
    

        filt = new LowPassSP(400, out.sampleRate());
    //    filt = new LowPassFS(400, out.sampleRate());
//          filt = new BandPass(400, 10, out.sampleRate());
    //    filt = new HighPassSP(400, out.sampleRate());
    //    filt = new NotchFilter(400, 100, out.sampleRate());

    // create an Oscil we will use to modulate 
    // the cutoff frequency of the filter.
    // by using an amplitude of 800 and an
    // offset of 1000, the cutoff frequency 
    // will sweep between 200 and 1800 Hertz.
//    cutOsc = new Oscil(1, 800, Waves.SINE);
    
    // offset the center value of the Oscil by 1000
//    cutOsc.offset.setLastValue( 1000 );

    // patch the oscil to the cutoff frequency of the filter
//    cutOsc.patch(filt.cutoff);


    osc.patch(filt);
    filt.patch(out);

  }

  void play() {
    Line ampEnv = new Line();
    ampEnv.activate(attack, 0, 0.5f );
    ampEnv.patch(osc.amplitude);
  }

  void stop() {
    Line ampEnv = new Line();
    ampEnv.activate(release, 0.5f, 0 );
    ampEnv.patch(osc.amplitude);
  }

  void twist() {
    //play with Frequency Modulation example to tweak values
    //set the fm oscillator to a low frequency (2f) and a high amplitude, 
    //over 0.25 seconds
    Line fmEnv;
    fmEnv = new Line();
    fmEnv.activate(0.25, fm.frequency.getLastValue(), 2f );
    fmEnv.patch(fm.frequency);

    Line fmAmp;
    fmAmp = new Line();
    fmAmp.activate(0.25, fm.frequency.getLastValue(), 200f );
    fmAmp.patch(fm.amplitude);
    fm.patch( osc.frequency );
  }

  void spike() {
    //set the fm oscillator to a low medium frequency and a medium amplitude
    Line fmEnv;
    fmEnv = new Line();
    fmEnv.activate(0.25, fm.frequency.getLastValue(), 100 );
    fmEnv.patch(fm.frequency);

    Line fmAmp;
    fmAmp = new Line();
    fmAmp.activate(0.25, fm.frequency.getLastValue(), 200 );
    fmAmp.patch(fm.amplitude);
    fm.patch( osc.frequency );
  }

  void expand() {
    //"open up" the low pass filter
    Line filterEnv;
    filterEnv = new Line();
    filterEnv.activate(1, filt.cutoff.getLastValue(), 1200);
    filterEnv.patch(filt.cutoff);

    
//    Line fmEnv;
//    fmEnv = new Line();
//    fmEnv.activate(1, fm.frequency.getLastValue(), 50 );
//    fmEnv.patch(fm.frequency);
//
//    Line fmAmp;
//    fmAmp = new Line();
//    fmAmp.activate(1, fm.frequency.getLastValue(), 3 );
//    fmAmp.patch(fm.amplitude);
//    fm.patch( osc.frequency );
  }

  void bend() {
    //increase/decrease the main osc frequency by a random value.
    Line oscAmp;
    oscAmp = new Line();
    oscAmp.activate(1, osc.frequency.getLastValue(), osc.frequency.getLastValue() + random(-100, 100));
    oscAmp.patch(osc.frequency);
  }

}

