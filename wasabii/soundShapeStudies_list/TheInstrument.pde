class TheInstrument implements Instrument{
  Wavetable waveType; 
  
  public Oscil osc;
  float frequency = 440;
  float amplitude = 0.5f; 
  
//  Oscil fmOsc;
//  float fmFreq = 800;
//  float fmAmp = 0.1;
//  
//  Oscil lfo; //patch to frequency 
//  float lfoFreq;
//  float lfoAmp;
  
  //FX
//  Delay myDelay;
//  float maxDelayTime = ;
//  float amplitudeFactor = ; 
//  boolean feedBackOn = ; 
//  boolean passAudioOn = ;
  
  
  TheInstrument(float _frequency, float _amplitude, Wavetable waveType){
    osc = new Oscil( _frequency, _amplitude,  waveType);
    
//    fmOsc = new Oscil(
  }
  
  void noteOn(float dur){
    osc.patch(out);
  }
  
  void noteOff(){
    osc.unpatch(out);
  }
  
  void incrementFrequency(){
    frequency++;
    osc.setFrequency(frequency);
  }

}
