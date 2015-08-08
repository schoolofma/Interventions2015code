// Example with an array of 12 tempo meters, 
// to be used with 12 different inputs.

final int METERS = 12;
TempoMeter[] tempoMeters;

void setup() {
  size(600, 600);
  stroke(255);
  
  tempoMeters = new TempoMeter[METERS];
  for(int i=0; i<METERS; i++) {
    tempoMeters[i] = new TempoMeter();
  }
}

void draw() {  
  background(0);

  for(int i=0; i<METERS; i++) {
    tempoMeters[i].update();
    rect(i * 20, height - 20 * tempoMeters[i].smoothedRate, 20, 3);
  }
}


void keyPressed() {
  tempoMeters[keyCode % METERS].event();
}

