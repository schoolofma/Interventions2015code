class Sound {
  ShapeTypes type;
  
  Oscil osc;
  float frequency;
  float amplitude;
  Wavetable waveType; 
  
  Oscil fm;
  float fmFrequency;
  float fmAmplitude;
  Wavetable fmWaveType; 
  
  ADSR  adsr;
  float attack;
  float decay;
  float sustain;
  float release;
  
  Noise noize;
  float noiseLevel;
  Noise.Tint noiseTint; 
  
  MoogFilter filter;
  MoogFilter.Type filterType; 
  float cutoffFreq; 
  float resonance; 


  Sound(ShapeTypes _type) {
    type = _type;
    
    //DEFAULT VALUES (redefine for each particular sound below)
    waveType = Waves.SINE;
    frequency = 435f;
    amplitude = 0.5f;
    
    fmWaveType = Waves.SINE;
    fmFrequency = 10;
    fmAmplitude = 1;
    
    attack = 0.01;
    decay = 0.05; 
    sustain = amplitude * 0.8;//level during sustain 
    release = 0.5;
    
    noiseLevel = 0.3f;
    noiseTint = Noise.Tint.WHITE; //Noise.Tint.PINK, RED, BROWN
    
    filterType = MoogFilter.Type.BP; //MoogFilter.Type.HP, LP
    cutoffFreq = frequency; 
    resonance = 100; 
    
    if(type == ShapeTypes.SPHERE){
      frequency = random(420, 440);
      attack = random(0.1, 0.2); //long attack
      amplitude = 0.3f; 
      waveType = Waves.SINE;
      
      noiseTint = Noise.Tint.PINK;
    }
    else if(type == ShapeTypes.TORUS){
      frequency = random(100, 200);
      waveType = Waves.SINE; 
      
      noiseTint = Noise.Tint.BROWN;
    }
    else if(type == ShapeTypes.CYLINDER){
      frequency = random(300, 400);
      amplitude = 0.3f; 
      waveType = Waves.SINE; //add square? 
      
      noiseTint = Noise.Tint.RED;
      
    }
    else if(type == ShapeTypes.CONE){
      frequency = random(400, 500);
      amplitude = 0.25f; 
      waveType = Waves.SINE; //add saw? 
      
    }
    else if(type == ShapeTypes.CUBE){
      frequency = random(600, 700);
      amplitude = 0.5f; 
      waveType = Waves.TRIANGLE; 
      
    }
    else if(type == ShapeTypes.PLATO){
      frequency = random(700, 800);
      amplitude = 0.5f; 
      waveType = Waves.SAW; 
      
    }
    else if(type == ShapeTypes.ARCHIMEDES){
      frequency = random(800, 900);
      amplitude = 0.4f; 
      waveType = Waves.SINE; //add square? 
     
    }
    else if(type == ShapeTypes.POLYGON){
      frequency = random(900, 1000);
      waveType = Waves.TRIANGLE; 
    }
    
    osc = new Oscil( frequency, amplitude, waveType);
    fm = new Oscil( fmFrequency, fmAmplitude, fmWaveType );
    fm.offset.setLastValue( 200 );
    
    noize = new Noise(0.05);
    noize.setTint(noiseTint);
    
    filter = new MoogFilter( cutoffFreq, resonance );
    filter.type = filterType;

//    float maxAmp, float attTime, float decTime, float susLvl, float relTime
    adsr = new ADSR( amplitude, attack, decay, sustain, release);
    osc.patch(adsr);
    
    adsr.patch(filter);
    filter.patch(out);
    
    
  }

  void play() {
    adsr.noteOn();
    adsr.patch( out );
    
  }

  void stop() {
    // tell the ADSR to unpatch after the release is finished
    adsr.unpatchAfterRelease( filter );
    // call the noteOff 
    adsr.noteOff();
    noize.unpatch(out);
   
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
    fmAmp.patch(fm
.amplitude);
    fm.patch( osc.frequency );
  }
  
  void punchHoles(){
    //not implemented yet
  }
  
  void merge(){
    //not implemented yet
  }
  
  void mergeOnSide(){
    //not implemented yet
  }
  
  void noise(){
    noize.patch(out);
  }  
  
  void inflate(){
    expand();
  }

  void expand() {
    filter.resonance.setLastValue(filter.resonance.getLastValue() + 10);
  }

  void bend() {
    //increase/decrease the main osc frequency by a random value.
    Line oscAmp;
    oscAmp = new Line();
    oscAmp.activate(1, osc.frequency.getLastValue(), osc.frequency.getLastValue() + random(-100, 100));
    oscAmp.patch(osc.frequency);
  }

}

