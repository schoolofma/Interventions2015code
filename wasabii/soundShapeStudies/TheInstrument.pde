class TheInstrument implements Instrument{
  Wavetable waveType; 
  
  public Oscil osc;
  float frequency = 440;
  float amplitude = 0.5f; 
  
  Oscil fmOsc;
  float fmFreq = 800;
  float fmAmp = 0.1;
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
    fmOsc = new Oscil(fmFreq, fmAmp, waveType);
    fmOsc.patch(osc.frequency);
//    fmOsc = new Oscil(
  }
  
  void noteOn(float dur){
    fmOsc.patch(out);
  }
  
  void noteOff(){
    fmOsc.unpatch(out);
  }

}
