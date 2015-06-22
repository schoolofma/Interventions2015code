import processing.video.*;

// create the capture object
Capture video;

void setup(){
  
  size(640,480);
  
  // initialize the video object
  video = new Capture(this,640,480);
  video.start();  

  background(255);
  noStroke();
}

void captureEvent(Capture c){
  c.read();
}

void draw(){
  
  //image(video,0,0);
  
  video.loadPixels();
  
  for(int i = 0; i < 10; i++){
    
    int mySize = video.width * video.height;
    int index = (int)random( 0, mySize);
    color c = video.pixels[index];
    
    // get brightness value of pixel color (value is between 0 - 255)
    float bright = brightness(c);
    
    // only draw triangle if brightness is greater than 50
    if( bright > 50 ){
      float x = index % video.width;
      float y = (index - x) / video.width;
      
      fill(c,200);
      triangle( x,y-random(10,50),x-random(10,50),y+random(10,50),x+random(10,50),y+random(10,50));
     }
    
  }
  
}
