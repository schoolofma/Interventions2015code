import processing.video.*;

Capture video;  // to capture our web camera

// save the previous brightness values
int [] lastFrame;

void setup(){
  size(640,480);
  video = new Capture(this,640,480);
  video.start();
  
  // initialize array with same number of positions as video pixels
  lastFrame = new int[video.width*video.height];
}

void draw(){
  
  if( video.available() ){
  
    video.read();  // if camera has new info, get it
    
    // call loadPixels for video
    video.loadPixels();
    
    int totalWhite = 0; // will keep track of sum of pixels set to white
    
    
    // use for loop to loop through all pixels
    for(int i = 0; i < video.pixels.length; i++){
      
      // get the brightness of the current pixel
      float currB = brightness(video.pixels[i]);
      
      // calculate absolute difference between current and last
      float diff = abs(currB-lastFrame[i]);
      
      if( diff > 100 ){
        totalWhite++;
        video.pixels[i] = color(255);
      }else{
        video.pixels[i] = color(0);
      }
      
      // save brightness to use next time
      lastFrame[i] = (int)currB;
     
    }
    println(totalWhite);
    // call updatePixels 
    video.updatePixels();
  }
  
  image(video,0,0); // draw altered video image
}
