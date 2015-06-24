import processing.video.*;

// create the capture object
Capture video;

void setup(){
  size(800, 800);
  
  //initialize the video object
  video = new Capture(this, 640, 480);
  video.start();
  
  background(255);
  colorMode(HSB, 360,255,255);
}

void captureEvent(Capture c) {
  c.read();
}

void draw(){
  
  //image(video, 0, 0);
  video.loadPixels();
  
  for(int i = 0; i <10; i++){
    
    int mySize = video.width * video.height;
    int index = (int)random(0,mySize);
    color c = video.pixels[index];
    
    // get brightness value of pixel color (value is between 0 - 255)
    float b = brightness(c);
    float h = hue(c);
    float s = saturation(c);
    
    // only draw if brightness is greater than 50{
    if(h > 10 && h < 44) {
    float x = index % video.width;
    float y = (index - x) / video. width;
    
    fill(c, 150);
    noStroke();
    rect(x, y, random(5,35), random(5, 35));
    }
  
  }
    
  }


