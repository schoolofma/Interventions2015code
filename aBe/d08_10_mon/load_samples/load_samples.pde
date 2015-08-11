import processing.sound.*;

final static int CHANNELS = 11;
final static int SPEEDS = 3;
final static int MAX_SAMPLES = 10;

SoundFile[][][] sounds;

void setup() {
  size(600, 600);
  
  sounds = new SoundFile[CHANNELS][SPEEDS][MAX_SAMPLES];
  for(int ch=0; ch<CHANNELS; ch++) {
    for(int sp=0; sp<SPEEDS; sp++) {
      File path = new File(sketchPath() + "/data/sounds/" + ch + "/" + sp);
      File[] files = path.listFiles();
      println(path);
      printArray(files);
    }
  }
}

void draw() {
  background(255);
}