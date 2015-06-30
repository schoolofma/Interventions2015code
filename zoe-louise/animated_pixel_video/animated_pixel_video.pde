import processing.video.*;

//creat the capture object 
Capture video;


void setup () {
  size (640, 480);



  video = new Capture(this, 640, 480);
  video.start();
}

void captureEvent(Capture c) {

  c.read();
}

void draw () {
  
int totalPixels = video.width*video.height;

  video.loadPixels();

  for (int i=0; i <100; i++){
  
  int index =  int (random(totalPixels));
  color c = video.pixels[index];

  float x= index % video.width;
  float y= (index - x) / video.width;

  noStroke();
  fill (c, 200);
  ellipse(x, y, 20, 20);
  }
}